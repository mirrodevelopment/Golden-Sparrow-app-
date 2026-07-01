import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_earth_globe/flutter_earth_globe.dart';
import 'package:flutter_earth_globe/flutter_earth_globe_controller.dart';
import 'package:flutter_earth_globe/globe_coordinates.dart';
import 'package:flutter_earth_globe/point.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:travelagency/providers/home_provider.dart';
import 'package:travelagency/spline_screen.dart' show SplineScreen;
import 'bottomnavigationBar.dart';
import 'dammy_screen.dart';
import 'festival_universe_screen.dart';
import 'home_screen.dart';
import 'japan_discovery_screen.dart';
import 'japan_universe_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,     // Change color
      statusBarIconBrightness: Brightness.dark, // Dark icons
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeProvider()),
        ],
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        final responsiveChild = ResponsiveWrapper.builder(
          child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ],
        );
        return Stack(
          children: [
            responsiveChild,
          ],
        );
      },
      debugShowCheckedModeBanner: false,
      home:MainScreen(),
      // splash screen
    );
  }
}

// void main() {
//   runApp(const EarthApp());
// }

class EarthApp extends StatelessWidget {
  const EarthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Premium Earth Globe',
      theme: ThemeData.dark(),
      home: const JapanUniverseScreen(),
    );
  }
}

class LocationMarker {
  final String id;
  final String name;
  final double latitude;
  final double longitude;
  final Color cardColor;
  final Offset position;

  LocationMarker({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.cardColor,
    required this.position,
  });
}

class EarthScreen extends StatefulWidget {
  const EarthScreen({super.key});

  @override
  State<EarthScreen> createState() => _EarthScreenState();
}

class _EarthScreenState extends State<EarthScreen> {
  late FlutterEarthGlobeController controller;
  int markerId = 0;
  List<LocationMarker> selectedLocations = [];

  // Color palette for cards
  final List<Color> cardColors = [
    const Color(0xFF8B5CF6), // Purple
    const Color(0xFFEC4899), // Pink
    const Color(0xFFF59E0B), // Amber
    const Color(0xFF06B6D4), // Cyan
    const Color(0xFF10B981), // Emerald
    const Color(0xFFEF4444), // Red
  ];

  @override
  void initState() {
    super.initState();

    controller = FlutterEarthGlobeController(
      rotationSpeed: 0.015,
      zoom: 1.4,
      minZoom: -1,
      maxZoom: 5,
      isRotating: false,

      background: Image.asset(
        'assets/8k_star_milky_way.png',
      ).image,

      surface: Image.asset(
        'assets/8k_earth_daymap (1).jpg',
      ).image,

      nightSurface: Image.asset(
        'assets/8k_earth_nightmap (1).jpg',
      ).image,

      isDayNightCycleEnabled: true,
      dayNightBlendFactor: 0.95,

      zoomToMousePosition: true,
      isBackgroundFollowingSphereRotation: false,
    );
  }

  void addMarker(GlobeCoordinates coordinates) {
    markerId++;
    controller.addPoint(
      Point(
        id: markerId.toString(),
        coordinates: coordinates,
        label: '',
        isLabelVisible: false,
      ),
    );
  }

  Future<void> onGlobeTap(GlobeCoordinates coordinates) async {
    addMarker(coordinates);

    // controller.animateTo(
    //   coordinates: coordinates,
    //   zoom: 3.0,  // zoom in level when focusing
    //   duration: const Duration(milliseconds: 800),  // smooth animation
    // );

    controller.isRotating = false;
    // controller.rotationX = -coordinates.latitude;
    // controller.rotationY = coordinates.longitude;


    final location = await getLocationName(
      coordinates.latitude,
      coordinates.longitude,
    );

    // Calculate position for the floating card
    final width = MediaQuery.of(context).size.width;
    final randomX = (width * 0.2) + (markerId * 80.0) % (width * 0.6);
    final randomY = 80.0 + (markerId * 50.0) % 120.0;

    setState(() {
      selectedLocations.add(
        LocationMarker(
          id: markerId.toString(),
          name: location,
          latitude: coordinates.latitude,
          longitude: coordinates.longitude,
          cardColor: cardColors[selectedLocations.length % cardColors.length],
          position: Offset(randomX, randomY),
        ),
      );
    });
  }

  void removeLocation(String id) {
    setState(() {
      selectedLocations.removeWhere((location) => location.id == id);
    });
  }

  void clearAllLocations() {
    // Dispose old controller
    controller.dispose();

    // Reinitialize controller to clear all markers
    controller = FlutterEarthGlobeController(
      rotationSpeed: 0.015,
      zoom: 1.4,
      minZoom: -2,
      maxZoom: 6,
      isRotating: false,
      background: Image.asset(
        'assets/8k_star_milky_way.png',
      ).image,
      surface: Image.asset(
        'assets/8k_earth_daymap (1).jpg',
      ).image,
      nightSurface: Image.asset(
        'assets/8k_earth_nightmap (1).jpg',
      ).image,
      isDayNightCycleEnabled: true,
      dayNightBlendFactor: 0.95,
      zoomToMousePosition: true,
      isBackgroundFollowingSphereRotation: false,
    );

    setState(() {
      selectedLocations.clear();
      markerId = 0;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Globe
          Center(
            child: FlutterEarthGlobe(
              controller: controller,
              radius: 50,
              onTap: (coordinates) async {
                if (coordinates != null) {
                  await onGlobeTap(coordinates);
                }
              },
            ),
          ),

          // Floating Location Cards
          ...selectedLocations.map((location) {
            return Positioned(
              left: location.position.dx,
              top: location.position.dy,
              child: GestureDetector(
                onLongPress: () => removeLocation(location.id),
                child: LocationCard(
                  location: location,
                ),
              ),
            );
          }).toList(),

          // Clear Button (bottom)
          if (selectedLocations.isNotEmpty)
            Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: ElevatedButton.icon(
                onPressed: clearAllLocations,
                icon: const Icon(Icons.delete_outline),
                label: const Text('Clear All Locations'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.withOpacity(0.7),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 20,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  final LocationMarker location;

  const LocationCard({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract city name from full location string
    final cityName = location.name.split(',').first;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            location.cardColor,
            location.cardColor.withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: location.cardColor.withOpacity(0.5),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main location name
          Text(
            cityName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          // Coordinates
          Text(
            '${location.latitude.toStringAsFixed(2)}, ${location.longitude.toStringAsFixed(2)}',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

Future<String> getLocationName(
    double lat,
    double lon,
    )
async {
  try {
    final response = await http.get(
      Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=$lat&lon=$lon',
      ),
      headers: {
        'User-Agent': 'FlutterEarthGlobe',
      },
    ).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return http.Response('{"display_name": "Unknown location"}', 200);
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['display_name'] ?? 'Unknown location';
    }

    return 'Unknown location';
  } catch (e) {
    return 'Unknown location';
  }
}




// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// void main() {
//   runApp(const GlobeApp());
// }
//
// class GlobeApp extends StatelessWidget {
//   const GlobeApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: '3D Earth',
//       theme: ThemeData.dark(),
//       home: const GlobeScreen(),
//     );
//   }
// }
//
// class GlobeScreen extends StatefulWidget {
//   const GlobeScreen({super.key});
//
//   @override
//   State<GlobeScreen> createState() => _GlobeScreenState();
// }
//
// class _GlobeScreenState extends State<GlobeScreen> {
//   late final WebViewController controller;
//
//   @override
//   void initState() {
//     super.initState();
//
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..loadHtmlString(_htmlData);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: WebViewWidget(
//           controller: controller,
//         ),
//       ),
//     );
//   }
// }
//
// const String _htmlData = r'''
// <!DOCTYPE html>
// <html lang="en">
// <head>
// <meta charset="UTF-8">
// <meta name="viewport" content="width=device-width, initial-scale=1.0">
//
// <style>
// html, body {
//   margin: 0;
//   width: 100%;
//   height: 100%;
//   overflow: hidden;
// }
// canvas {
//   display: block;
// }
// </style>
//
// <script type="importmap">
// {
//   "imports": {
//     "three": "https://unpkg.com/three@0.128.0/build/three.module.js",
//     "three/addons/": "https://unpkg.com/three@0.128.0/examples/jsm/"
//   }
// }
// </script>
//
// </head>
// <body>
//
// <div id="loading"
// style="
// position:absolute;
// top:0;
// left:0;
// width:100%;
// height:100%;
// display:flex;
// align-items:center;
// justify-content:center;
// background:#0a0a1a;
// color:white;
// font-size:20px;
// z-index:100;">
// 🌍 loading globe ...
// </div>
//
// <script type="module">
//
// import * as THREE from 'three';
// import { OrbitControls }
// from 'three/addons/controls/OrbitControls.js';
//
// const scene = new THREE.Scene();
// scene.background = new THREE.Color(0x0a0a1a);
//
// const camera =
// new THREE.PerspectiveCamera(
// 45,
// window.innerWidth/window.innerHeight,
// 0.1,
// 1000
// );
//
// camera.position.set(0,2,8);
//
// const renderer = new THREE.WebGLRenderer({
//   antialias:true
// });
//
// renderer.setSize(
// window.innerWidth,
// window.innerHeight
// );
//
// document.body.appendChild(
// renderer.domElement
// );
//
// const controls =
// new OrbitControls(
// camera,
// renderer.domElement
// );
//
// controls.enableDamping = true;
// controls.autoRotate = true;
// controls.autoRotateSpeed = 1.2;
//
// const ambient =
// new THREE.AmbientLight(
// 0x404060
// );
//
// scene.add(ambient);
//
// const light =
// new THREE.DirectionalLight(
// 0xffffff,
// 1.2
// );
//
// light.position.set(5,5,10);
//
// scene.add(light);
//
// const earthGeometry =
// new THREE.SphereGeometry(
// 2,
// 64,
// 64
// );
//
// const textureLoader =
// new THREE.TextureLoader();
//
// const earthTexture =
// textureLoader.load(
// 'https://threejs.org/examples/textures/planets/earth_atmos_2048.jpg'
// );
//
// const earthMaterial =
// new THREE.MeshPhongMaterial({
// map: earthTexture
// });
//
// const earth =
// new THREE.Mesh(
// earthGeometry,
// earthMaterial
// );
//
// scene.add(earth);
//
// function addStars() {
//
//   const vertices = [];
//
//   for(let i=0;i<3000;i++) {
//
//     vertices.push(
//       (Math.random()-0.5)*400,
//       (Math.random()-0.5)*400,
//       (Math.random()-0.5)*400
//     );
//   }
//
//   const geometry =
//   new THREE.BufferGeometry();
//
//   geometry.setAttribute(
//     'position',
//     new THREE.Float32BufferAttribute(
//       vertices,
//       3
//     )
//   );
//
//   const material =
//   new THREE.PointsMaterial({
//     color:0xffffff,
//     size:0.25
//   });
//
//   const stars =
//   new THREE.Points(
//     geometry,
//     material
//   );
//
//   scene.add(stars);
// }
//
// addStars();
//
// window.addEventListener(
// 'resize',
// () {
//
//   camera.aspect =
//   window.innerWidth /
//   window.innerHeight;
//
//   camera.updateProjectionMatrix();
//
//   renderer.setSize(
//   window.innerWidth,
//   window.innerHeight
//   );
// });
//
// function animate() {
//
//   requestAnimationFrame(
//     animate
//   );
//
//   controls.update();
//
//   renderer.render(
//     scene,
//     camera
//   );
// }
//
// animate();
//
// setTimeout(() {
//   document.getElementById('loading')
//   .style.display='none';
// },1000);
//
// </script>
//
// </body>
// </html>
// ''';
//

