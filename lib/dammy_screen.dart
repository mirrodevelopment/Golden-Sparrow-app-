// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
//
// class Place {
//   final String image;
//   final String country;
//   final String city;
//
//   Place({
//     required this.image,
//     required this.country,
//     required this.city,
//   });
// }
//
//
// class carousal extends StatefulWidget {
//   @override
//   State<carousal> createState() => _carousalState();
// }
//
// class _carousalState extends State<carousal> {
//   int current = 0;
//
//   final List<Place> places = [
//     Place(
//       image:
//       "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=1000",
//       country: "Brazil",
//       city: "Rio de Janeiro",
//     ),
//     Place(
//       image:
//       "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1000",
//       country: "Maldives",
//       city: "Blue Beach",
//     ),
//     Place(
//       image:
//       "https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=1000",
//       country: "Switzerland",
//       city: "Alps",
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//
//       body: SafeArea(
//         child: Center(
//           child: CarouselSlider.builder(
//             itemCount: places.length,
//             options: CarouselOptions(
//               height: 520,
//               viewportFraction: .78,
//               enlargeCenterPage: true,
//               enlargeStrategy: CenterPageEnlargeStrategy.scale,
//               enableInfiniteScroll: true,
//               onPageChanged: (index, reason) {
//                 setState(() {
//                   current = index;
//                 });
//               },
//             ),
//             itemBuilder: (context, index, realIndex) {
//               return PlaceCard(place: places[index]);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class PlaceCard extends StatelessWidget {
//   final Place place;
//
//   const PlaceCard({
//     super.key,
//     required this.place,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 18),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(28),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 20,
//             offset: Offset(0, 12),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(28),
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//
//             /// Image
//             Image.network(
//               place.image,
//               fit: BoxFit.cover,
//             ),
//
//             /// Gradient
//             Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.transparent,
//                     Colors.black.withOpacity(.65),
//                   ],
//                 ),
//               ),
//             ),
//
//             /// Favorite
//             Positioned(
//               top: 18,
//               right: 18,
//               child: CircleAvatar(
//                 radius: 20,
//                 backgroundColor: Colors.white24,
//                 child: Icon(
//                   Icons.favorite_border,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//
//             /// Bottom Card
//             Positioned(
//               left: 18,
//               right: 18,
//               bottom: 18,
//               child: Container(
//                 padding: const EdgeInsets.all(18),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(.55),
//                   borderRadius: BorderRadius.circular(22),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//
//                     Text(
//                       place.country,
//                       style: const TextStyle(
//                         color: Colors.white70,
//                         fontSize: 15,
//                       ),
//                     ),
//
//                     const SizedBox(height: 4),
//
//                     Text(
//                       place.city,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//
//                     const SizedBox(height: 10),
//
//                     Row(
//                       children: const [
//
//                         Icon(Icons.star_border,
//                             color: Colors.white, size: 18),
//
//                         SizedBox(width: 4),
//
//                         Text(
//                           "5.0",
//                           style: TextStyle(color: Colors.white),
//                         ),
//
//                         SizedBox(width: 16),
//
//                         Text(
//                           "143 reviews",
//                           style: TextStyle(color: Colors.white70),
//                         ),
//                       ],
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     Container(
//                       height: 58,
//                       decoration: BoxDecoration(
//                         color: Colors.black87,
//                         borderRadius: BorderRadius.circular(40),
//                       ),
//                       child: Row(
//                         children: [
//
//                           const Expanded(
//                             child: Center(
//                               child: Text(
//                                 "See more",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 17,
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                           Container(
//                             margin: const EdgeInsets.all(6),
//                             width: 46,
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Icon(
//                               Icons.arrow_forward_ios,
//                               size: 18,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//







// Step 2 ///




//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// /// ============================================================================
// /// DESTINATION CAROUSEL — stacked-card travel slider
// /// ============================================================================
// /// Recreates a "deck of cards" carousel: the active card sits on top of two
// /// faded, scaled-down cards peeking out from behind it. Swiping moves the
// /// deck forward, the back cards animate into the front position, and a new
// /// card slides in to refill the back of the stack.
// ///
// /// Drop this file into your project and use `DestinationCarousel(...)`.
// /// Everything needed (model, card, page) is self-contained below.
// /// ============================================================================
//
// class Destination {
//   final String country;
//   final String city;
//   final double rating;
//   final int reviewCount;
//   final String imageUrl;
//   final bool isFavorite;
//
//   const Destination({
//     required this.country,
//     required this.city,
//     required this.rating,
//     required this.reviewCount,
//     required this.imageUrl,
//     this.isFavorite = false,
//   });
// }
//
// class DestinationCarousel extends StatefulWidget {
//   final List<Destination> destinations;
//   final double cardHeight;
//   final void Function(Destination destination)? onSeeMore;
//   final void Function(Destination destination)? onFavoriteToggle;
//
//   /// Whether the carousel advances on its own. Defaults to true.
//   final bool autoPlay;
//
//   /// Time between automatic advances.
//   final Duration autoPlayInterval;
//
//   /// Time to wait after the user finishes a manual swipe before
//   /// auto-play resumes, so it doesn't immediately yank the card again.
//   final Duration resumeDelay;
//
//   const DestinationCarousel({
//     super.key,
//     required this.destinations,
//     this.cardHeight = 380,
//     this.onSeeMore,
//     this.onFavoriteToggle,
//     this.autoPlay = true,
//     this.autoPlayInterval = const Duration(seconds: 4),
//     this.resumeDelay = const Duration(seconds: 3),
//   });
//
//   @override
//   State<DestinationCarousel> createState() => _DestinationCarouselState();
// }
//
// class _DestinationCarouselState extends State<DestinationCarousel>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Set<int> _favorited;
//   int _frontIndex = 0;
//   double _dragDx = 0;
//   bool _dragging = false;
//   Timer? _autoPlayTimer;
//
//   // How many cards are visible in the stack behind the active one.
//   static const int _stackDepth = 3;
//   static const double _stackOffsetY = 14; // vertical peek per layer
//   static const double _stackScaleStep = 0.06; // size shrink per layer
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 120),
//     );
//     _favorited = {
//       for (var i = 0; i < widget.destinations.length; i++)
//         if (widget.destinations[i].isFavorite) i,
//     };
//     _startAutoPlay();
//   }
//
//   void _startAutoPlay() {
//     _autoPlayTimer?.cancel();
//     if (!widget.autoPlay || widget.destinations.length < 2) return;
//     _autoPlayTimer = Timer.periodic(widget.autoPlayInterval, (_) {
//       // Don't fire mid-gesture or mid-animation; the periodic timer
//       // will just tick again next interval.
//       if (_dragging || _controller.isAnimating) return;
//       _animateAdvance();
//     });
//   }
//
//   void _pauseAutoPlay() {
//     _autoPlayTimer?.cancel();
//   }
//
//   /// Cancels and restarts the timer, used after a manual interaction so
//   /// the user gets a full `resumeDelay` of breathing room before the
//   /// carousel starts moving again on its own.
//   void _resumeAutoPlayAfterDelay() {
//     _autoPlayTimer?.cancel();
//     if (!widget.autoPlay || widget.destinations.length < 2) return;
//     _autoPlayTimer = Timer(widget.resumeDelay, _startAutoPlay);
//   }
//
//   /// Plays the same forward transition the swipe-left gesture uses,
//   /// so auto-play and manual swipes look identical.
//   void _animateAdvance() {
//     _controller.forward(from: 0).whenComplete(() {
//       _controller.reset();
//       _advance();
//     });
//   }
//
//   @override
//   void didUpdateWidget(covariant DestinationCarousel oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     final relevantChange = oldWidget.autoPlay != widget.autoPlay ||
//         oldWidget.autoPlayInterval != widget.autoPlayInterval ||
//         oldWidget.destinations.length != widget.destinations.length;
//     if (relevantChange) _startAutoPlay();
//   }
//
//   @override
//   void dispose() {
//     _autoPlayTimer?.cancel();
//     _controller.dispose();
//     super.dispose();
//   }
//
//   int _indexAt(int offset) {
//     final len = widget.destinations.length;
//     return (_frontIndex + offset) % len;
//   }
//
//   void _advance() {
//     setState(() {
//       _frontIndex = (_frontIndex + 1) % widget.destinations.length;
//       _dragDx = 0;
//     });
//   }
//
//   void _onPanStart(DragStartDetails details) {
//     _dragging = true;
//     _pauseAutoPlay();
//   }
//
//   void _onPanUpdate(DragUpdateDetails details) {
//     setState(() => _dragDx += details.delta.dx);
//   }
//
//   void _onPanEnd(DragEndDetails details) {
//     _dragging = false;
//     final width = context.size?.width ?? 320;
//     final threshold = width * 0.28;
//     final flungLeft = details.velocity.pixelsPerSecond.dx < -600;
//     final flungRight = details.velocity.pixelsPerSecond.dx > 600;
//
//     if (_dragDx < -threshold || flungLeft) {
//       // Animate the front card flying off, then advance the stack.
//       _animateAdvance();
//     } else if (_dragDx > threshold || flungRight) {
//       _controller.forward(from: 0).whenComplete(() {
//         _controller.reset();
//         setState(() {
//           _frontIndex =
//               (_frontIndex - 1 + widget.destinations.length) %
//                   widget.destinations.length;
//           _dragDx = 0;
//         });
//       });
//     } else {
//       // Snap back.
//       setState(() => _dragDx = 0);
//     }
//     _resumeAutoPlayAfterDelay();
//   }
//
//   void _toggleFavorite(int destinationIndex) {
//     _pauseAutoPlay();
//     setState(() {
//       if (_favorited.contains(destinationIndex)) {
//         _favorited.remove(destinationIndex);
//       } else {
//         _favorited.add(destinationIndex);
//       }
//     });
//     widget.onFavoriteToggle?.call(widget.destinations[destinationIndex]);
//     _resumeAutoPlayAfterDelay();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final depth = _stackDepth.clamp(1, widget.destinations.length);
//
//     return SizedBox(
//       height: widget.cardHeight + (_stackOffsetY * (depth - 1)) + 4,
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           final cardWidth = constraints.maxWidth * 0.92;
//
//           return GestureDetector(
//             onPanStart: _onPanStart,
//             onPanUpdate: _onPanUpdate,
//             onPanEnd: _onPanEnd,
//             child: Stack(
//               alignment: Alignment.topCenter,
//               clipBehavior: Clip.none,
//               children: [
//                 // Back-to-front so the front card paints last (on top).
//                 for (int layer = depth - 1; layer >= 0; layer--)
//                   _buildLayer(
//                     layer: layer,
//                     cardWidth: cardWidth,
//                   ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildLayer({required int layer, required double cardWidth}) {
//     final destinationIndex = _indexAt(layer);
//     final destination = widget.destinations[destinationIndex];
//     final isFront = layer == 0;
//
//     // Drag progress, used only by the front card for a subtle rotate/fade.
//     final dragProgress = isFront
//         ? (_dragDx / 280).clamp(-1.0, 1.0)
//         : 0.0;
//
//     final targetScale = 1 - (_stackScaleStep * layer);
//     final targetOffsetY = _stackOffsetY * layer;
//     // Cards behind the front one get progressively dimmer.
//     final targetOpacity = layer == 0 ? 1.0 : (1.0 - (layer * 0.16)).clamp(0.45, 1.0);
//
//     return AnimatedPositioned(
//       duration: _dragging ? Duration.zero : const Duration(milliseconds: 320),
//       curve: Curves.easeOutCubic,
//       top: targetOffsetY,
//       child: AnimatedScale(
//         duration: _dragging ? Duration.zero : const Duration(milliseconds: 320),
//         curve: Curves.easeOutCubic,
//         scale: targetScale,
//         child: AnimatedOpacity(
//           duration: _dragging ? Duration.zero : const Duration(milliseconds: 320),
//           opacity: targetOpacity,
//           child: Transform.translate(
//             offset: Offset(isFront ? _dragDx : 0, 0),
//             child: Transform.rotate(
//               angle: isFront ? dragProgress * 0.06 : 0,
//               child: _DestinationCard(
//                 destination: destination,
//                 width: cardWidth,
//                 height: widget.cardHeight,
//                 isFavorited: _favorited.contains(destinationIndex),
//                 interactive: isFront,
//                 onFavoriteTap: () => _toggleFavorite(destinationIndex),
//                 onSeeMoreTap: () => widget.onSeeMore?.call(destination),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _DestinationCard extends StatelessWidget {
//   final Destination destination;
//   final double width;
//   final double height;
//   final bool isFavorited;
//   final bool interactive;
//   final VoidCallback onFavoriteTap;
//   final VoidCallback onSeeMoreTap;
//
//   const _DestinationCard({
//     required this.destination,
//     required this.width,
//     required this.height,
//     required this.isFavorited,
//     required this.interactive,
//     required this.onFavoriteTap,
//     required this.onSeeMoreTap,
//   });
//
//   static const _radius = 28.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(_radius),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.18),
//             blurRadius: 24,
//             offset: const Offset(0, 12),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(_radius),
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             // ---- background photo ----
//             Image.network(
//               destination.imageUrl,
//               fit: BoxFit.cover,
//               loadingBuilder: (context, child, progress) {
//                 if (progress == null) return child;
//                 return Container(
//                   color: const Color(0xFFE2E8F0),
//                   child: const Center(
//                     child: CircularProgressIndicator(strokeWidth: 2),
//                   ),
//                 );
//               },
//               errorBuilder: (context, error, stackTrace) => Container(
//                 color: const Color(0xFF94A3B8),
//                 child: const Icon(Icons.image_not_supported_outlined,
//                     color: Colors.white, size: 32),
//               ),
//             ),
//
//             // ---- bottom scrim for text legibility ----
//             const Positioned.fill(
//               child: DecoratedBox(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     stops: [0.0, 0.45, 1.0],
//                     colors: [
//                       Colors.transparent,
//                       Colors.transparent,
//                       Color(0xCC000000),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//
//             // ---- favorite button, top right ----
//             Positioned(
//               top: 16,
//               right: 16,
//               child: _FavoriteButton(
//                 isFavorited: isFavorited,
//                 onTap: interactive ? onFavoriteTap : null,
//               ),
//             ),
//
//             // ---- text content + CTA, bottom ----
//             Positioned(
//               left: 20,
//               right: 20,
//               bottom: 20,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     destination.country,
//                     style: const TextStyle(
//                       color: Colors.white70,
//                       fontSize: 13,
//                       fontWeight: FontWeight.w500,
//                       letterSpacing: 0.2,
//                     ),
//                   ),
//                   const SizedBox(height: 2),
//                   Text(
//                     destination.city,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 26,
//                       fontWeight: FontWeight.w700,
//                       height: 1.15,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       const Icon(Icons.star_rounded,
//                           color: Color(0xFFFFC93C), size: 18),
//                       const SizedBox(width: 4),
//                       Text(
//                         destination.rating.toStringAsFixed(1),
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const SizedBox(width: 6),
//                       Text(
//                         '${destination.reviewCount} reviews',
//                         style: const TextStyle(
//                           color: Colors.white70,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   _SeeMoreButton(
//                     onTap: interactive ? onSeeMoreTap : null,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _FavoriteButton extends StatelessWidget {
//   final bool isFavorited;
//   final VoidCallback? onTap;
//
//   const _FavoriteButton({required this.isFavorited, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.black.withValues(alpha: 0.28),
//       shape: const CircleBorder(),
//       child: InkWell(
//         customBorder: const CircleBorder(),
//         onTap: onTap,
//         child: Padding(
//           padding: const EdgeInsets.all(9),
//           child: Icon(
//             isFavorited ? Icons.favorite_rounded : Icons.favorite_border_rounded,
//             color: isFavorited ? const Color(0xFFFF5A5F) : Colors.white,
//             size: 19,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _SeeMoreButton extends StatelessWidget {
//   final VoidCallback? onTap;
//
//   const _SeeMoreButton({required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       child: Stack(
//         alignment: Alignment.centerRight,
//         clipBehavior: Clip.none,
//         children: [
//           // Pill button
//           Material(
//             color: Colors.white.withValues(alpha: 0.16),
//             borderRadius: BorderRadius.circular(25),
//             child: InkWell(
//               borderRadius: BorderRadius.circular(25),
//               onTap: onTap,
//               child: Container(
//                 height: 50,
//                 width: double.infinity,
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.only(right: 36),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   border: Border.all(
//                     color: Colors.white.withValues(alpha: 0.3),
//                     width: 1,
//                   ),
//                 ),
//                 child: const Text(
//                   'See more',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // Circular arrow button, overlapping the pill's right edge
//           Positioned(
//             right: -2,
//             child: Material(
//               color: Colors.white,
//               shape: const CircleBorder(),
//               elevation: 2,
//               child: InkWell(
//                 customBorder: const CircleBorder(),
//                 onTap: onTap,
//                 child: const Padding(
//                   padding: EdgeInsets.all(13),
//                   child: Icon(
//                     Icons.arrow_forward_rounded,
//                     color: Colors.black,
//                     size: 18,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// /// ============================================================================
// /// EXAMPLE USAGE
// /// ============================================================================
// /// Swap imageUrl for your own asset paths (e.g. 'assets/images/rio.jpg' +
// /// Image.asset) if you're not loading from the network.
//
// class DestinationCarouselDemo extends StatelessWidget {
//   const DestinationCarouselDemo({super.key});
//
//   static final _destinations = [
//     const Destination(
//       country: 'Brazil',
//       city: 'Rio de Janeiro',
//       rating: 5.0,
//       reviewCount: 143,
//       imageUrl:
//       'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?w=800&q=80',
//       isFavorite: false,
//     ),
//     const Destination(
//       country: 'Japan',
//       city: 'Kyoto',
//       rating: 4.9,
//       reviewCount: 287,
//       imageUrl:
//       'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800&q=80',
//     ),
//     const Destination(
//       country: 'Iceland',
//       city: 'Reykjavik',
//       rating: 4.8,
//       reviewCount: 96,
//       imageUrl:
//       'https://images.unsplash.com/photo-1504829857797-ddff29c27927?w=800&q=80',
//     ),
//     const Destination(
//       country: 'Italy',
//       city: 'Amalfi Coast',
//       rating: 4.9,
//       reviewCount: 211,
//       imageUrl:
//       'https://images.unsplash.com/photo-1533104816931-20fa691ff6ca?w=800&q=80',
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F7),
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 24),
//             child: DestinationCarousel(
//               destinations: _destinations,
//               onSeeMore: (destination) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('See more: ${destination.city}')),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'dart:ui';
//
// /// ============================================================
// /// DATA MODEL
// /// ============================================================
// class StayCardData {
//   final String title;
//   final String imageUrl;
//   final String badgeText;
//   final String description;
//   final IconData leadingIcon;
//
//   const StayCardData({
//     required this.title,
//     required this.imageUrl,
//     required this.badgeText,
//     required this.description,
//     this.leadingIcon = Icons.apartment_rounded,
//   });
// }
//
// /// Sample data — swap these image URLs / copy for your real content.
// final List<StayCardData> sampleStays = [
//   const StayCardData(
//     title: 'HERITAGE STAY IN JAIPUR',
//     imageUrl:
//     'https://images.unsplash.com/photo-1501426026826-31c667bdf23d?w=800&q=80',
//     badgeText: '₹15,000+ UNLOCKED',
//     description:
//     'Live like royalty in restored palace suites with grand courtyards.',
//   ),
//   const StayCardData(
//     title: 'BEACH ESCAPE IN GOA',
//     imageUrl:
//     'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800&q=80',
//     badgeText: '₹8,000+ UNLOCKED',
//     description:
//     'Relax by the tranquil beaches and coconut groves just outside Mumbai.',
//   ),
//   const StayCardData(
//     title: 'HOUSEBOAT IN KERALA',
//     imageUrl:
//     'https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?w=800&q=80',
//     badgeText: '₹12,500+ UNLOCKED',
//     description:
//     'Drift through quiet backwaters aboard a traditional kettuvallam.',
//   ),
//   const StayCardData(
//     title: 'MOUNTAIN RETREAT IN MANALI',
//     imageUrl:
//     'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&q=80',
//     badgeText: '₹10,200+ UNLOCKED',
//     description:
//     'Wake up to pine forests and snow-capped peaks from a private deck.',
//   ),
// ];
//
// /// ============================================================
// /// STACKED / PEEK CAROUSEL  (matches the reference screenshot)
// /// ============================================================
// class StackedStayCarousel extends StatefulWidget {
//   final List<StayCardData> items;
//   final double cardHeight;
//   final VoidCallback? onArrowTap;
//
//   const StackedStayCarousel({
//     super.key,
//     required this.items,
//     this.cardHeight = 460,
//     this.onArrowTap,
//   });
//
//   @override
//   State<StackedStayCarousel> createState() => _StackedStayCarouselState();
// }
//
// class _StackedStayCarouselState extends State<StackedStayCarousel> {
//   late final PageController _controller;
//   double _page = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     // viewportFraction < 1 is what creates the "peek" of the next card.
//     _controller = PageController(viewportFraction: 0.84);
//     _controller.addListener(() {
//       setState(() => _page = _controller.page ?? 0);
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: widget.cardHeight,
//       child: PageView.builder(
//         controller: _controller,
//         itemCount: widget.items.length,
//         // Slightly larger clip so scaled-down neighbor cards aren't cut off.
//         clipBehavior: Clip.none,
//         itemBuilder: (context, index) {
//           final delta = (index - _page);
//           // How far this card is from being "front and center", clamped 0..1.
//           final t = delta.abs().clamp(0.0, 1.0);
//
//           // Front card is full scale; neighbors shrink and fade slightly,
//           // mimicking the stacked-deck look in the screenshot.
//           final scale = 1 - (t * 0.10);
//           final verticalShift = t * 18.0; // pushes neighbors down a touch
//           final opacity = 1 - (t * 0.25);
//
//           return Transform.translate(
//             offset: Offset(0, verticalShift),
//             child: Transform.scale(
//               scale: scale,
//               child: Opacity(
//                 opacity: opacity.clamp(0.0, 1.0),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                   child: _StayCard(
//                     data: widget.items[index],
//                     onArrowTap: widget.onArrowTap,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// /// ============================================================
// /// SINGLE CARD
// /// ============================================================
// class _StayCard extends StatelessWidget {
//   final StayCardData data;
//   final VoidCallback? onArrowTap;
//
//   const _StayCard({required this.data, this.onArrowTap});
//
//   static const _cardRadius = 28.0;
//   static const _cardBg = Color(0xFF161616);
//   static const _badgeGreen = Color(0xFF1FA37C);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: _cardBg,
//         borderRadius: BorderRadius.circular(_cardRadius),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.45),
//             blurRadius: 24,
//             offset: const Offset(0, 14),
//           ),
//         ],
//       ),
//       clipBehavior: Clip.antiAlias,
//       child: Stack(
//         children: [
//           // Subtle top-to-bottom gradient so the dark card never looks flat.
//           Positioned.fill(
//             child: DecoratedBox(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.white.withOpacity(0.03),
//                     Colors.transparent,
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 18, 20, 22),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // ---- Top row: leading icon + arrow icon ----
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     _RoundIconButton(
//                       icon: data.leadingIcon,
//                       background: Colors.white.withOpacity(0.10),
//                       iconColor: Colors.white,
//                       onTap: () {},
//                     ),
//                     _RoundIconButton(
//                       icon: Icons.north_east_rounded,
//                       background: Colors.white,
//                       iconColor: Colors.black,
//                       onTap: onArrowTap ?? () {},
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 14),
//
//                 // ---- Title ----
//                 Text(
//                   data.title,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontFamily: 'PlayfairDisplay',
//                     fontSize: 21,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.white,
//                     letterSpacing: 0.6,
//                     height: 1.25,
//                   ),
//                 ),
//                 const SizedBox(height: 14),
//
//                 // ---- Image with badge overlay ----
//                 Expanded(
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(18),
//                     child: Stack(
//                       fit: StackFit.expand,
//                       children: [
//                         Image.network(
//                           data.imageUrl,
//                           fit: BoxFit.cover,
//                           loadingBuilder: (context, child, progress) {
//                             if (progress == null) return child;
//                             return Container(
//                               color: Colors.white.withOpacity(0.06),
//                               child: const Center(
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 2,
//                                   color: Colors.white54,
//                                 ),
//                               ),
//                             );
//                           },
//                           errorBuilder: (context, error, stack) => Container(
//                             color: Colors.white.withOpacity(0.06),
//                             alignment: Alignment.center,
//                             child: const Icon(
//                               Icons.image_not_supported_outlined,
//                               color: Colors.white38,
//                               size: 32,
//                             ),
//                           ),
//                         ),
//                         // Slight darken at the bottom so the badge stays legible
//                         // over any image.
//                         Align(
//                           alignment: Alignment.bottomCenter,
//                           child: Container(
//                             height: 60,
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                   Colors.transparent,
//                                   Colors.black.withOpacity(0.35),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 12,
//                           bottom: 12,
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 14,
//                               vertical: 9,
//                             ),
//                             decoration: BoxDecoration(
//                               color: _badgeGreen,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Text(
//                               data.badgeText,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w800,
//                                 fontSize: 13,
//                                 letterSpacing: 0.2,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//
//                 // ---- Description ----
//                 Text(
//                   data.description,
//                   textAlign: TextAlign.center,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     color: Colors.white.withOpacity(0.65),
//                     fontSize: 14,
//                     height: 1.4,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _RoundIconButton extends StatelessWidget {
//   final IconData icon;
//   final Color background;
//   final Color iconColor;
//   final VoidCallback onTap;
//
//   const _RoundIconButton({
//     required this.icon,
//     required this.background,
//     required this.iconColor,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(20),
//         child: Container(
//           width: 38,
//           height: 38,
//           decoration: BoxDecoration(
//             color: background,
//             shape: BoxShape.circle,
//           ),
//           child: Icon(icon, size: 18, color: iconColor),
//         ),
//       ),
//     );
//   }
// }
//
// /// ============================================================
// /// BONUS: Simple PageView variant (one card at a time, no peek)
// /// Same _StayCard is reused — just a different controller setup.
// /// ============================================================
// class SimpleStayCarousel extends StatefulWidget {
//   final List<StayCardData> items;
//   final double cardHeight;
//
//   const SimpleStayCarousel({
//     super.key,
//     required this.items,
//     this.cardHeight = 460,
//   });
//
//   @override
//   State<SimpleStayCarousel> createState() => _SimpleStayCarouselState();
// }
//
// class _SimpleStayCarouselState extends State<SimpleStayCarousel> {
//   final PageController _controller = PageController();
//   int _index = 0;
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         SizedBox(
//           height: widget.cardHeight,
//           child: PageView.builder(
//             controller: _controller,
//             itemCount: widget.items.length,
//             onPageChanged: (i) => setState(() => _index = i),
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: _StayCard(data: widget.items[index]),
//               );
//             },
//           ),
//         ),
//         const SizedBox(height: 14),
//         // Dot indicators
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(widget.items.length, (i) {
//             final active = i == _index;
//             return AnimatedContainer(
//               duration: const Duration(milliseconds: 220),
//               margin: const EdgeInsets.symmetric(horizontal: 3),
//               width: active ? 18 : 6,
//               height: 6,
//               decoration: BoxDecoration(
//                 color: active ? Colors.white : Colors.white24,
//                 borderRadius: BorderRadius.circular(3),
//               ),
//             );
//           }),
//         ),
//       ],
//     );
//   }
// }
//
// /// ============================================================
// /// DEMO PAGE — shows both variants on a warm blurred background,
// /// similar to the reference screenshot's backdrop.
// /// ============================================================
// class CarouselDemoPage extends StatelessWidget {
//   const CarouselDemoPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Warm blurred backdrop, like the screenshot.
//           Positioned.fill(
//             child: Image.network(
//               'https://images.unsplash.com/photo-1604335399105-a0c585fd81a1?w=1200&q=60',
//               fit: BoxFit.cover,
//             ),
//           ),
//           Positioned.fill(
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
//               child: Container(color: Colors.black.withOpacity(0.35)),
//             ),
//           ),
//           SafeArea(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(vertical: 24),
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 24),
//                   child: Text(
//                     'Stacked / Peek Carousel',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 13,
//                       letterSpacing: 1.1,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 StackedStayCarousel(items: sampleStays),
//                 const SizedBox(height: 40),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 24),
//                   child: Text(
//                     'Simple PageView Carousel',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 13,
//                       letterSpacing: 1.1,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 SimpleStayCarousel(items: sampleStays, cardHeight: 460),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:flutter_card_swiper/flutter_card_swiper.dart';
//
// /// ============================================================
// /// DATA MODEL
// /// ============================================================
// class StayCardData {
//   final String title;
//   final String imageUrl;
//   final String badgeText;
//   final String description;
//   final IconData leadingIcon;
//
//   const StayCardData({
//     required this.title,
//     required this.imageUrl,
//     required this.badgeText,
//     required this.description,
//     this.leadingIcon = Icons.apartment_rounded,
//   });
// }
//
// /// Sample data — swap these image URLs / copy for your real content.
// final List<StayCardData> sampleStays = [
//   const StayCardData(
//     title: 'HERITAGE STAY IN JAIPUR',
//     imageUrl:
//     'https://images.unsplash.com/photo-1501426026826-31c667bdf23d?w=800&q=80',
//     badgeText: '₹15,000+ UNLOCKED',
//     description:
//     'Live like royalty in restored palace suites with grand courtyards.',
//   ),
//   const StayCardData(
//     title: 'BEACH ESCAPE IN GOA',
//     imageUrl:
//     'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800&q=80',
//     badgeText: '₹8,000+ UNLOCKED',
//     description:
//     'Relax by the tranquil beaches and coconut groves just outside Mumbai.',
//   ),
//   const StayCardData(
//     title: 'HOUSEBOAT IN KERALA',
//     imageUrl:
//     'https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?w=800&q=80',
//     badgeText: '₹12,500+ UNLOCKED',
//     description:
//     'Drift through quiet backwaters aboard a traditional kettuvallam.',
//   ),
//   const StayCardData(
//     title: 'MOUNTAIN RETREAT IN MANALI',
//     imageUrl:
//     'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&q=80',
//     badgeText: '₹10,200+ UNLOCKED',
//     description:
//     'Wake up to pine forests and snow-capped peaks from a private deck.',
//   ),
// ];
//
// /// ============================================================
// /// CARD-SWIPER CAROUSEL  (flutter_card_swiper ^7.2.0)
// /// Swipe left / right / up / down — all directions allowed by default.
// /// ============================================================
// class StayCardSwiper extends StatefulWidget {
//   final List<StayCardData> items;
//   final double cardHeight;
//
//   const StayCardSwiper({
//     super.key,
//     required this.items,
//     this.cardHeight = 460,
//   });
//
//   @override
//   State<StayCardSwiper> createState() => _StayCardSwiperState();
// }
//
// class _StayCardSwiperState extends State<StayCardSwiper> {
//   // Controller lets you trigger swipes/undo from outside the widget
//   // (e.g. the direction buttons below). You own its lifecycle as of v5+,
//   // so it must be disposed manually.
//   final CardSwiperController _controller = CardSwiperController();
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         SizedBox(
//           height: widget.cardHeight,
//           child: CardSwiper(
//             controller: _controller,
//             cardsCount: widget.items.length,
//             // AllowedSwipeDirection defaults to .all, so left/right/up/down
//             // are already enabled — no extra config needed for that part.
//             numberOfCardsDisplayed: 2,
//             backCardOffset: const Offset(0, 24),
//             scale: 0.92,
//             padding: const EdgeInsets.symmetric(
//               horizontal: 12,
//               vertical: 8,
//             ),
//             onSwipe: _onSwipe,
//             onUndo: _onUndo,
//             onEnd: () => debugPrint('No more cards left to swipe.'),
//             cardBuilder: (
//                 context,
//                 index,
//                 horizontalThresholdPercentage,
//                 verticalThresholdPercentage,
//                 ) {
//               return _StayCard(data: widget.items[index]);
//             },
//           ),
//         ),
//         const SizedBox(height: 18),
//         // Optional: buttons to trigger swipes programmatically in any
//         // direction, and to undo the last swipe.
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _ControlButton(
//               icon: Icons.rotate_left_rounded,
//               onTap: _controller.undo,
//             ),
//             const SizedBox(width: 10),
//             _ControlButton(
//               icon: Icons.keyboard_arrow_left_rounded,
//               onTap: () => _controller.swipe(CardSwiperDirection.left),
//             ),
//             const SizedBox(width: 10),
//             _ControlButton(
//               icon: Icons.keyboard_arrow_up_rounded,
//               onTap: () => _controller.swipe(CardSwiperDirection.top),
//             ),
//             const SizedBox(width: 10),
//             _ControlButton(
//               icon: Icons.keyboard_arrow_down_rounded,
//               onTap: () => _controller.swipe(CardSwiperDirection.bottom),
//             ),
//             const SizedBox(width: 10),
//             _ControlButton(
//               icon: Icons.keyboard_arrow_right_rounded,
//               onTap: () => _controller.swipe(CardSwiperDirection.right),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   // Returning true lets the swipe complete; returning false would cancel it
//   // and snap the card back (useful if you ever want to block a direction
//   // conditionally instead of via allowedSwipeDirection).
//   bool _onSwipe(
//       int previousIndex,
//       int? currentIndex,
//       CardSwiperDirection direction,
//       ) {
//     debugPrint(
//       'Card $previousIndex swiped ${direction.name}. '
//           'Now showing card $currentIndex.',
//     );
//     return true;
//   }
//
//   bool _onUndo(
//       int? previousIndex,
//       int currentIndex,
//       CardSwiperDirection direction,
//       ) {
//     debugPrint('Undid the ${direction.name} swipe, back to card $currentIndex.');
//     return true;
//   }
// }
//
// class _ControlButton extends StatelessWidget {
//   final IconData icon;
//   final VoidCallback onTap;
//
//   const _ControlButton({required this.icon, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.white.withOpacity(0.08),
//       shape: const CircleBorder(),
//       child: InkWell(
//         onTap: onTap,
//         customBorder: const CircleBorder(),
//         child: SizedBox(
//           width: 44,
//           height: 44,
//           child: Icon(icon, color: Colors.white, size: 22),
//         ),
//       ),
//     );
//   }
// }
//
// /// ============================================================
// /// SINGLE CARD  (same visual design as the reference screenshot)
// /// ============================================================
// class _StayCard extends StatelessWidget {
//   final StayCardData data;
//
//   const _StayCard({required this.data});
//
//   static const _cardRadius = 28.0;
//   static const _cardBg = Color(0xFF161616);
//   static const _badgeGreen = Color(0xFF1FA37C);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: _cardBg,
//         borderRadius: BorderRadius.circular(_cardRadius),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.45),
//             blurRadius: 24,
//             offset: const Offset(0, 14),
//           ),
//         ],
//       ),
//       clipBehavior: Clip.antiAlias,
//       child: Stack(
//         children: [
//           Positioned.fill(
//             child: DecoratedBox(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.white.withOpacity(0.03),
//                     Colors.transparent,
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 18, 20, 22),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     _RoundIconButton(
//                       icon: data.leadingIcon,
//                       background: Colors.white.withOpacity(0.10),
//                       iconColor: Colors.white,
//                       onTap: () {},
//                     ),
//                     _RoundIconButton(
//                       icon: Icons.north_east_rounded,
//                       background: Colors.white,
//                       iconColor: Colors.black,
//                       onTap: () {},
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 14),
//                 Text(
//                   data.title,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontFamily: 'PlayfairDisplay',
//                     fontSize: 21,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.white,
//                     letterSpacing: 0.6,
//                     height: 1.25,
//                   ),
//                 ),
//                 const SizedBox(height: 14),
//                 Expanded(
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(18),
//                     child: Stack(
//                       fit: StackFit.expand,
//                       children: [
//                         Image.network(
//                           data.imageUrl,
//                           fit: BoxFit.cover,
//                           loadingBuilder: (context, child, progress) {
//                             if (progress == null) return child;
//                             return Container(
//                               color: Colors.white.withOpacity(0.06),
//                               child: const Center(
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 2,
//                                   color: Colors.white54,
//                                 ),
//                               ),
//                             );
//                           },
//                           errorBuilder: (context, error, stack) => Container(
//                             color: Colors.white.withOpacity(0.06),
//                             alignment: Alignment.center,
//                             child: const Icon(
//                               Icons.image_not_supported_outlined,
//                               color: Colors.white38,
//                               size: 32,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.bottomCenter,
//                           child: Container(
//                             height: 60,
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                   Colors.transparent,
//                                   Colors.black.withOpacity(0.35),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 12,
//                           bottom: 12,
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 14,
//                               vertical: 9,
//                             ),
//                             decoration: BoxDecoration(
//                               color: _badgeGreen,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Text(
//                               data.badgeText,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w800,
//                                 fontSize: 13,
//                                 letterSpacing: 0.2,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   data.description,
//                   textAlign: TextAlign.center,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     color: Colors.white.withOpacity(0.65),
//                     fontSize: 14,
//                     height: 1.4,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _RoundIconButton extends StatelessWidget {
//   final IconData icon;
//   final Color background;
//   final Color iconColor;
//   final VoidCallback onTap;
//
//   const _RoundIconButton({
//     required this.icon,
//     required this.background,
//     required this.iconColor,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(20),
//         child: Container(
//           width: 38,
//           height: 38,
//           decoration: BoxDecoration(
//             color: background,
//             shape: BoxShape.circle,
//           ),
//           child: Icon(icon, size: 18, color: iconColor),
//         ),
//       ),
//     );
//   }
// }
//
// /// ============================================================
// /// DEMO PAGE
// /// ============================================================
// class CardSwiperDemoPage extends StatelessWidget {
//   const CardSwiperDemoPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF0D0D0D),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 24),
//           child: StayCardSwiper(items: sampleStays),
//         ),
//       ),
//     );
//   }
// }


import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'festival_universe_screen.dart';

/// ============================================================
/// DATA MODEL
/// ============================================================
class StayCardData {
  final String title;
  final String imageUrl;
  final String badgeText;
  final String description;
  final IconData leadingIcon;

  const StayCardData({
    required this.title,
    required this.imageUrl,
    required this.badgeText,
    required this.description,
    this.leadingIcon = Icons.apartment_rounded,
  });
}

/// Sample data — swap these image URLs / copy for your real content.
final List<StayCardData> sampleStays = [
  const StayCardData(
    title: 'HERITAGE STAY IN JAIPUR',
    imageUrl:
    'https://images.unsplash.com/photo-1501426026826-31c667bdf23d?w=800&q=80',
    badgeText: '₹15,000+ UNLOCKED',
    description:
    'Live like royalty in restored palace suites with grand courtyards.',
  ),
  const StayCardData(
    title: 'BEACH ESCAPE IN GOA',
    imageUrl:
    'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800&q=80',
    badgeText: '₹8,000+ UNLOCKED',
    description:
    'Relax by the tranquil beaches and coconut groves just outside Mumbai.',
  ),
  const StayCardData(
    title: 'HOUSEBOAT IN KERALA',
    imageUrl:
    'https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?w=800&q=80',
    badgeText: '₹12,500+ UNLOCKED',
    description:
    'Drift through quiet backwaters aboard a traditional kettuvallam.',
  ),
  const StayCardData(
    title: 'MOUNTAIN RETREAT IN MANALI',
    imageUrl:
    'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&q=80',
    badgeText: '₹10,200+ UNLOCKED',
    description:
    'Wake up to pine forests and snow-capped peaks from a private deck.',
  ),
];

/// ============================================================
/// CARD-SWIPER CAROUSEL  (flutter_card_swiper ^7.2.0)
/// Swipe left / right / up / down — all directions allowed by default.
/// ============================================================
class StayCardSwiper extends StatefulWidget {
  final List<StayCardData> items;
  final double cardHeight;

  const StayCardSwiper({
    super.key,
    required this.items,
    this.cardHeight = 460,
  });

  @override
  State<StayCardSwiper> createState() => _StayCardSwiperState();
}

class _StayCardSwiperState extends State<StayCardSwiper> {
  // Controller lets you trigger swipes/undo from outside the widget
  // (e.g. the direction buttons below, or the auto-swipe timer).
  // You own its lifecycle as of v5+, so it must be disposed manually.
  final CardSwiperController _controller = CardSwiperController();

  // ---- Auto-swipe state ----
  Timer? _autoSwipeTimer;
  Timer? _resumeTimer;
  final _random = Random();

  // Set to true immediately before a timer-triggered swipe, and checked
  // (then cleared) inside onSwipe. This is what lets us tell "the timer
  // did this" apart from "the user dragged the card" — onSwipe alone
  // fires for both, with no other way to distinguish the source.
  bool _isProgrammaticSwipe = false;

  static const _autoSwipeInterval = Duration(seconds: 3);
  static const _resumeAfterUserSwipe = Duration(seconds: 4);

  static const _allDirections = [
    CardSwiperDirection.left,
    CardSwiperDirection.right,
    CardSwiperDirection.top,
    CardSwiperDirection.bottom,
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSwipe();
  }

  @override
  void dispose() {
    _autoSwipeTimer?.cancel();
    _resumeTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startAutoSwipe() {
    _autoSwipeTimer?.cancel();
    _autoSwipeTimer = Timer.periodic(_autoSwipeInterval, (_) {
      _isProgrammaticSwipe = true;
      // Random direction each tick, since "all direction" was requested
      // rather than one fixed direction.
      final direction = _allDirections[_random.nextInt(_allDirections.length)];
      _controller.swipe(direction);
    });
  }

  void _stopAutoSwipe() {
    _autoSwipeTimer?.cancel();
  }

  // Called when a *real* user touch is detected on the swiper (see the
  // Listener in build()). Pauses the timer, then restarts it after a
  // short delay so auto-swipe resumes on its own.
  void _onUserInteraction() {
    _stopAutoSwipe();
    _resumeTimer?.cancel();
    _resumeTimer = Timer(_resumeAfterUserSwipe, _startAutoSwipe);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Listener (not GestureDetector) so we observe the raw pointer-down
        // without intercepting or competing with CardSwiper's own drag
        // recognizer — it only reports that a touch happened, it never
        // consumes the gesture.
        Listener(
          onPointerDown: (_) => _onUserInteraction(),
          child: SizedBox(
            height: widget.cardHeight,
            child: CardSwiper(
              controller: _controller,
              cardsCount: widget.items.length,
              // AllowedSwipeDirection defaults to .all, so left/right/up/down
              // are already enabled — no extra config needed for that part.
              numberOfCardsDisplayed: 2,
              backCardOffset: const Offset(0, 24),
              scale: 0.92,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              onSwipe: _onSwipe,
              onUndo: _onUndo,
              onEnd: () => debugPrint('No more cards left to swipe.'),
              cardBuilder: (
                  context,
                  index,
                  horizontalThresholdPercentage,
                  verticalThresholdPercentage,
                  ) {
                return _StayCard(data: widget.items[index]);
              },
            ),
          ),
        ),
        const SizedBox(height: 18),
        // Optional: buttons to trigger swipes programmatically in any
        // direction, and to undo the last swipe. Tapping these counts as
        // user interaction too, so auto-swipe pauses and resumes the same
        // way it would for a manual drag.
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ControlButton(
              icon: Icons.rotate_left_rounded,
              onTap: () {
                _onUserInteraction();
                _controller.undo();
              },
            ),
            const SizedBox(width: 10),
            _ControlButton(
              icon: Icons.keyboard_arrow_left_rounded,
              onTap: () {
                _onUserInteraction();
                _controller.swipe(CardSwiperDirection.left);
              },
            ),
            const SizedBox(width: 10),
            _ControlButton(
              icon: Icons.keyboard_arrow_up_rounded,
              onTap: () {
                _onUserInteraction();
                _controller.swipe(CardSwiperDirection.top);
              },
            ),
            const SizedBox(width: 10),
            _ControlButton(
              icon: Icons.keyboard_arrow_down_rounded,
              onTap: () {
                _onUserInteraction();
                _controller.swipe(CardSwiperDirection.bottom);
              },
            ),
            const SizedBox(width: 10),
            _ControlButton(
              icon: Icons.keyboard_arrow_right_rounded,
              onTap: () {
                _onUserInteraction();
                _controller.swipe(CardSwiperDirection.right);
              },
            ),
          ],
        ),
      ],
    );
  }

  // Returning true lets the swipe complete; returning false would cancel it
  // and snap the card back (useful if you ever want to block a direction
  // conditionally instead of via allowedSwipeDirection).
  bool _onSwipe(
      int previousIndex,
      int? currentIndex,
      CardSwiperDirection direction,
      ) {
    final source = _isProgrammaticSwipe ? 'auto-swipe' : 'user';
    debugPrint(
      'Card $previousIndex swiped ${direction.name} ($source). '
          'Now showing card $currentIndex.',
    );
    // Clear the flag regardless of source, so the next swipe (of either
    // kind) is evaluated fresh.
    _isProgrammaticSwipe = false;
    return true;
  }

  bool _onUndo(
      int? previousIndex,
      int currentIndex,
      CardSwiperDirection direction,
      ) {
    debugPrint('Undid the ${direction.name} swipe, back to card $currentIndex.');
    return true;
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ControlButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.08),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 44,
          height: 44,
          child: Icon(icon, color: Colors.white, size: 22),
        ),
      ),
    );
  }
}

/// ============================================================
/// SINGLE CARD  (same visual design as the reference screenshot)
/// ============================================================
class _StayCard extends StatelessWidget {
  final StayCardData data;

  const _StayCard({required this.data});

  static const _cardRadius = 28.0;
  static const _cardBg = Color(0xFF161616);
  static const _badgeGreen = Color(0xFF1FA37C);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(_cardRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.45),
            blurRadius: 24,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.03),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _RoundIconButton(
                      icon: data.leadingIcon,
                      background: Colors.white.withOpacity(0.10),
                      iconColor: Colors.white,
                      onTap: () {},
                    ),
                    _RoundIconButton(
                      icon: Icons.north_east_rounded,
                      background: Colors.white,
                      iconColor: Colors.black,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 0.6,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          data.imageUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return Container(
                              color: Colors.white.withOpacity(0.06),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white54,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stack) => Container(
                            color: Colors.white.withOpacity(0.06),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.image_not_supported_outlined,
                              color: Colors.white38,
                              size: 32,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.35),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 12,
                          bottom: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 9,
                            ),
                            decoration: BoxDecoration(
                              color: _badgeGreen,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              data.badgeText,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  data.description,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.65),
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Color background;
  final Color iconColor;
  final VoidCallback onTap;

  const _RoundIconButton({
    required this.icon,
    required this.background,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: background,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 18, color: iconColor),
        ),
      ),
    );
  }
}

/// ============================================================
/// DEMO PAGE
/// ============================================================
class CardSwiperDemoPage extends StatelessWidget {
  const CardSwiperDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: StayCardSwiper(items: sampleStays),
        ),
      ),
    );
  }
}






