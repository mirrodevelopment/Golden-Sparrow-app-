import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_earth_globe/flutter_earth_globe.dart';
import 'package:flutter_earth_globe/flutter_earth_globe_controller.dart';
import 'package:flutter_earth_globe/globe_coordinates.dart';
import 'package:flutter_earth_globe/point.dart';

/// Zoom limits expressed as display multipliers (0.5x – 4.0x).
const double kGlobeMinZoomMultiplier = 0.5;
const double kGlobeMaxZoomMultiplier = 4.0;
const double kGlobeDefaultZoomMultiplier = 1.0;

/// Internal logarithmic zoom used by [FlutterEarthGlobeController].
final double kGlobeMinZoomLog = log(kGlobeMinZoomMultiplier) / ln2;
final double kGlobeMaxZoomLog = log(kGlobeMaxZoomMultiplier) / ln2;
final double kGlobeDefaultZoomLog = log(kGlobeDefaultZoomMultiplier) / ln2;

double _logZoomFromMultiplier(double multiplier) =>
    log(multiplier.clamp(kGlobeMinZoomMultiplier, kGlobeMaxZoomMultiplier)) /
    ln2;

double _multiplierFromLogZoom(double logZoom) => pow(2, logZoom).toDouble();

/// A destination marker on the globe.
class GlobeDestination {
  final String id;
  final String name;
  final double lat;
  final double lon;

  const GlobeDestination({
    required this.id,
    required this.name,
    required this.lat,
    required this.lon,
  });
}

/// Interactive 3D Earth globe with night lights, zoom, rotation, and touch support.
class EarthGlobeView extends StatefulWidget {
  final List<GlobeDestination> destinations;
  final String? selectedDestinationId;
  final ValueChanged<GlobeDestination>? onDestinationTap;
  final double radius;

  const EarthGlobeView({
    super.key,
    required this.destinations,
    this.selectedDestinationId,
    this.onDestinationTap,
    this.radius = 155,
  });

  @override
  State<EarthGlobeView> createState() => _EarthGlobeViewState();
}

class _EarthGlobeViewState extends State<EarthGlobeView> {
  late final FlutterEarthGlobeController _controller;
  double _displayZoom = kGlobeDefaultZoomMultiplier;
  bool _autoRotate = true;
  bool _pointsAdded = false;

  @override
  void initState() {
    super.initState();
    _controller = FlutterEarthGlobeController(
      rotationSpeed: 0.04,
      minZoom: kGlobeMinZoomLog,
      maxZoom: kGlobeMaxZoomLog,
      zoom: kGlobeDefaultZoomLog,
      isRotating: true,
      isZoomEnabled: true,
      zoomToMousePosition: false,
      isBackgroundFollowingSphereRotation: false,
      surface: const AssetImage('assets/2k_earth-day.jpg'),
      nightSurface: const AssetImage('assets/2k_earth-night.jpg'),
      isDayNightCycleEnabled: false,
      dayNightBlendFactor: 0.12,
      sunLongitude: 30.0,
      sunLatitude: 8.0,
      showAtmosphere: true,
      atmosphereColor: const Color(0xFFD4A843),
      atmosphereBlur: 28.0,
      atmosphereThickness: 0.04,
      atmosphereOpacity: 0.32,
      surfaceLightingEnabled: true,
      lightAngle: -40.0,
      lightIntensity: 0.7,
      ambientLight: 0.55,
      panSensitivity: 1.0,
      zoomSensitivity: 0.8,
    );

    _controller.onLoaded = _onGlobeLoaded;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(EarthGlobeView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_pointsAdded &&
        oldWidget.selectedDestinationId != widget.selectedDestinationId) {
      _syncPointStyles();
    }
  }

  void _onGlobeLoaded() {
    if (!_pointsAdded) {
      for (final dest in widget.destinations) {
        _controller.addPoint(_buildPoint(dest));
      }
      _pointsAdded = true;
    }
    _syncPointStyles();
    _controller.focusOnCoordinates(
      const GlobeCoordinates(25.0, 95.0),
      animate: true,
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutCubic,
    );
    setState(() {});
  }

  Point _buildPoint(GlobeDestination dest) {
    final isSelected = dest.id == widget.selectedDestinationId;
    return Point(
      id: dest.id,
      coordinates: GlobeCoordinates(dest.lat, dest.lon),
      isLabelVisible: false,
      style: PointStyle(
        color: const Color(0xFFD4A843),
        size: isSelected ? 10 : 4,
        altitude: isSelected ? 0.06 : 0.02,
        transitionDuration: 300,
      ),
      onTap: () {
        widget.onDestinationTap?.call(dest);
      },
    );
  }

  void _syncPointStyles() {
    for (final dest in widget.destinations) {
      final isSelected = dest.id == widget.selectedDestinationId;
      final point = _controller.points.where((p) => p.id == dest.id).firstOrNull;
      if (point == null) continue;
      point.style = PointStyle(
        color: const Color(0xFFD4A843),
        size: isSelected ? 10 : 4,
        altitude: isSelected ? 0.06 : 0.02,
        transitionDuration: 300,
      );
      _controller.updatePoint(dest.id);
    }
  }

  void _setDisplayZoom(double multiplier) {
    final clamped = multiplier.clamp(
      kGlobeMinZoomMultiplier,
      kGlobeMaxZoomMultiplier,
    );
    _displayZoom = clamped;
    _controller.setZoom(_logZoomFromMultiplier(clamped));
  }

  void _resetView() {
    _controller.resetRotation();
    _controller.resetPanOffset();
    _setDisplayZoom(kGlobeDefaultZoomMultiplier);
    _controller.focusOnCoordinates(
      const GlobeCoordinates(25.0, 95.0),
      animate: true,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOutCubic,
    );
    if (_autoRotate) {
      _controller.startRotation();
    }
    setState(() {});
  }

  void _toggleAutoRotate() {
    _autoRotate = !_autoRotate;
    if (_autoRotate) {
      _controller.startRotation();
    } else {
      _controller.stopRotation();
    }
    setState(() {});
  }

  GlobeDestination? _nearestDestination(GlobeCoordinates coords) {
    GlobeDestination? nearest;
    double minDist = double.infinity;
    for (final dest in widget.destinations) {
      final dLat = (dest.lat - coords.latitude) * pi / 180;
      final dLon = (dest.lon - coords.longitude) * pi / 180;
      final lat1 = dest.lat * pi / 180;
      final lat2 = coords.latitude * pi / 180;
      final a = sin(dLat / 2) * sin(dLat / 2) +
          cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
      final dist = 2 * atan2(sqrt(a), sqrt(1 - a));
      if (dist < minDist) {
        minDist = dist;
        nearest = dest;
      }
    }
    return nearest;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        FlutterEarthGlobe(
          radius: widget.radius,
          controller: _controller,
          onZoomChanged: (logZoom) {
            setState(() {
              _displayZoom = _multiplierFromLogZoom(logZoom);
            });
          },
          onTap: (coords) {
            if (coords != null) {
              final nearest = _nearestDestination(coords);
              if (nearest != null) {
                widget.onDestinationTap?.call(nearest);
              }
            }
          },
        ),
        Positioned(
          left: 12,
          bottom: 12,
          child: _GlobeControls(
            zoom: _displayZoom,
            autoRotate: _autoRotate,
            onZoomChanged: _setDisplayZoom,
            onToggleAutoRotate: _toggleAutoRotate,
            onReset: _resetView,
          ),
        ),
      ],
    );
  }
}

class _GlobeControls extends StatelessWidget {
  final double zoom;
  final bool autoRotate;
  final ValueChanged<double> onZoomChanged;
  final VoidCallback onToggleAutoRotate;
  final VoidCallback onReset;

  const _GlobeControls({
    required this.zoom,
    required this.autoRotate,
    required this.onZoomChanged,
    required this.onToggleAutoRotate,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.92),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              _ControlIconButton(
                icon: Icons.remove,
                tooltip: 'Zoom out',
                onTap: () => onZoomChanged(zoom - 0.25),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '${zoom.toStringAsFixed(1)}x',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF342818),
                  ),
                ),
              ),
              _ControlIconButton(
                icon: Icons.add,
                tooltip: 'Zoom in',
                onTap: () => onZoomChanged(zoom + 0.25),
              ),
              const SizedBox(width: 8),
              _ControlIconButton(
                icon: autoRotate ? Icons.pause : Icons.play_arrow,
                tooltip: autoRotate ? 'Pause rotation' : 'Auto-rotate',
                onTap: onToggleAutoRotate,
                highlighted: autoRotate,
              ),
              _ControlIconButton(
                icon: Icons.refresh,
                tooltip: 'Reset view',
                onTap: onReset,
              ),
            ],
          ),
          SizedBox(
            width: 200,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 2,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
                activeTrackColor: const Color(0xFFB8922A),
                inactiveTrackColor: const Color(0xFFE8E0D4),
                thumbColor: const Color(0xFFB8922A),
              ),
              child: Slider(
                value: zoom,
                min: kGlobeMinZoomMultiplier,
                max: kGlobeMaxZoomMultiplier,
                onChanged: onZoomChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ControlIconButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  final bool highlighted;

  const _ControlIconButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: highlighted
                ? const Color(0xFFF5EFE7)
                : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 18,
            color: const Color(0xFF8A8378),
          ),
        ),
      ),
    );
  }
}
