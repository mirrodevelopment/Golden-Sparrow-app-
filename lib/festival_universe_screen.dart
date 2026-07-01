import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'dammy_screen.dart';

// ── COLORS ────────────────────────────────────────────────────────────────────
const kCream = Color(0xFFFAF6F1);
const kBrown = Color(0xFF2A1A0A);
const kTerra = Color(0xFFB8724A);
const kGold = Color(0xFFB8956A);
const kMuted = Color(0xFF8A7A6A);
const kPink = Color(0xFFE8A0A0);
const kWhite = Colors.white;


bool _isExpanded = false;

// ── SCREEN ────────────────────────────────────────────────────────────────────
class FestivalUniverseScreen extends StatefulWidget {
  const FestivalUniverseScreen({super.key});

  @override
  State<FestivalUniverseScreen> createState() => _FestivalUniverseScreenState();
}

class _FestivalUniverseScreenState extends State<FestivalUniverseScreen> {
  int _selectedNavIndex = 0;
  int _placeDotIndex = 0;


  int _heroIndex = 0;

  final CarouselSliderController _carouselController =
  CarouselSliderController();

  final List<Map<String, String>> heroSlides = [
    {
      "title": "Cherry Blossom",
      "subtitle": "Sakura Season 🍃",
      "country": "Japan",
      "month": "Mar – Apr",
      "image": "assets/universe.png",
    },
    {
      "title": "Lantern Festival",
      "subtitle": "Sky Lantern ✨",
      "country": "Taiwan",
      "month": "Feb",
      "image": "assets/natural.png",
    },
    {
      "title": "Holi Festival",
      "subtitle": "Festival of Colors 🌈",
      "country": "India",
      "month": "Mar",
      "image": "assets/experience.png",
    },
  ];

  final List<_NavItem> _navItems = const [
    _NavItem(Icons.home_outlined, 'Nest'),
    _NavItem(Icons.language_outlined, 'Globe'),
    _NavItem(Icons.map_outlined, 'Journeys'),
    _NavItem(Icons.people_outline, 'Flocks'),
    _NavItem(Icons.person_outline, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCream,
      // bottomNavigationBar: _buildBottomNav(),
      // appBar: _buildAppBar(),          // ← add this
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // _buildTopBar(),
            //             const SizedBox(height: 24),← remove this
            const SizedBox(height: 24),
            _buildHeroSection(),
            const SizedBox(height: 24),
            _buildAboutAndHighlights(),
            const SizedBox(height: 24),
            _buildTopPlaces(),
            const SizedBox(height: 24),
            _buildExperiencesYouLove(),
            const SizedBox(height: 24),
            _buildCuratedPackages(),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }

  // PreferredSizeWidget _buildAppBar() {
  //   return AppBar(
  //     backgroundColor: kCream,
  //     elevation: 0,
  //     scrolledUnderElevation: 0,
  //     leading: Padding(
  //       padding: const EdgeInsets.only(left: 10),
  //       child: _circleBtn(Icons.arrow_back, size: 25),
  //     ),
  //     title: Column(
  //       children: [
  //         Image.asset('assets/logo.png', height:40),
  //         const SizedBox(height: 2),
  //         const Text(
  //           'FESTIVAL UNIVERSE',
  //           style: TextStyle(
  //             fontSize:15,
  //             letterSpacing: 2.2,
  //             color: Color(0xFFB68B2D),
  //             fontWeight: FontWeight.w600,
  //             fontFamily: 'Arial',
  //           ),
  //         ),
  //         // const SizedBox(width: 20),
  //         const Text(
  //           'CELEBRATE THE WORLD',
  //           style: TextStyle(
  //             color: Color(0xFFB68B2D),
  //             fontSize: 12,
  //             letterSpacing: 1.8,
  //             fontFamily: 'Arial',
  //             fontWeight: FontWeight.w700,
  //           ),
  //         ),
  //       ],
  //     ),
  //     centerTitle: true,
  //     titleSpacing: 0,
  //     actions: [
  //       Padding(
  //         padding: const EdgeInsets.only(right: 10,left: 20),
  //         child: Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
  //           decoration: BoxDecoration(
  //             color: kWhite,
  //             borderRadius: BorderRadius.circular(20),
  //             boxShadow: _softShadow,
  //           ),
  //           child: Row(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               SizedBox(
  //                 width: 25,
  //                 height: 25,
  //                 child: Image.asset(
  //                   'assets/NEST.png',
  //                   fit: BoxFit.contain,
  //                 ),
  //               ),
  //               const SizedBox(width: 6),
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: const [
  //                   Text(
  //                     'Nest Balance',
  //                     style: TextStyle(
  //                       fontSize: 12,
  //                       fontWeight: FontWeight.w700,
  //                       color: Color(0xFF8C8883),
  //                     ),
  //                   ),
  //                   Text(
  //                     '₹2,45,000',
  //                     style: TextStyle(
  //                       fontSize:16,
  //                       fontWeight: FontWeight.w600,
  //                       color: Color(0xFF2F2F2F),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(width: 2),
  //               const Icon(
  //                 Icons.keyboard_arrow_down,
  //                 color: Color(0xFFB68B2D),
  //                 size: 25,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //     toolbarHeight: 72,        // ← taller to fit logo + two text lines
  //   );
  // }

  // ── HERO STACK ─────────────────────────────────────────────────────────────
  // Widget _buildHeroStack() {
  //   return Stack(
  //     children: [
  //       // Hero image placeholder
  //       Container(
  //         height: 500,
  //         width: double.infinity,
  //         decoration: const BoxDecoration(
  //           gradient: LinearGradient(
  //             begin: Alignment.topLeft,
  //             end: Alignment.bottomRight,
  //             colors: [Colors.white, Colors.white,Color(0xFFD4907A), Color(0xFFB07080),Colors.white],
  //           ),
  //         ),
  //         child: Stack(
  //           children: [
  //             const Center(
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Icon(Icons.temple_buddhist, size: 90, color: Color(0x448B3A3A)),
  //                   SizedBox(height: 8),
  //                   // Text('[ Replace: assets/cherry_blossom_hero.jpg ]',
  //                   //     style: TextStyle(fontSize: 9, color: Color(0x776A3030))),
  //                 ],
  //               ),
  //             ),
  //             // Bottom fade
  //             Positioned(
  //               bottom: 0, left: 0, right: 0,
  //               child: Container(
  //                 height: 180,
  //                 decoration: const BoxDecoration(
  //                   gradient: LinearGradient(
  //                     begin: Alignment.bottomCenter,
  //                     end: Alignment.topCenter,
  //                     colors: [kCream, Colors.transparent],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             // Left fade
  //             Positioned(
  //               top: 0, left: 0, bottom: 0,
  //               child: Container(
  //                 width: 200,
  //                 decoration: const BoxDecoration(
  //                   gradient: LinearGradient(
  //                     begin: Alignment.centerLeft,
  //                     end: Alignment.centerRight,
  //                     colors: [Color(0xBBFAF6F1), Colors.transparent],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //
  //       // Top bar
  //       // SafeArea(
  //       //   child: Padding(
  //       //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
  //       //     child: Row(
  //       //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //       children: [
  //       //         _circleBtn(Icons.arrow_back_ios_new, size: 14),
  //       //         Column(
  //       //           children: [
  //       //             const Icon(Icons.flutter_dash, size: 18, color: kGold),
  //       //             const SizedBox(height: 2),
  //       //             const Text('FESTIVAL UNIVERSE',
  //       //                 style: TextStyle(fontSize: 10, letterSpacing: 2.2,
  //       //                     color: kMuted, fontWeight: FontWeight.w600)),
  //       //             const Text('CELEBRATE THE WORLD',
  //       //                 style: TextStyle(fontSize: 8, letterSpacing: 1.8,
  //       //                     color: kMuted)),
  //       //           ],
  //       //         ),
  //       //         _nestBalanceChip(),
  //       //       ],
  //       //     ),
  //       //   ),
  //       // ),
  //
  //       // Right side vertical tab pills
  //       Positioned(
  //         right: 0,
  //         top: 140,
  //         child: _buildSideTabs(),
  //       ),
  //
  //       // Text content over hero
  //       Positioned(
  //         left: 20,
  //         top: 50,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Row(children: [
  //               const Icon(Icons.local_florist, size: 50, color: kPink),
  //               const SizedBox(width: 6),
  //               Text('FEATURED FESTIVAL',
  //                   style: TextStyle(fontSize: 15, letterSpacing: 1.8,
  //                       color: kTerra.withOpacity(0.85), fontWeight: FontWeight.w600)),
  //             ]),
  //             const SizedBox(height: 8),
  //             const Text('Cherry Blossom',
  //                 style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800,
  //                     color: kBrown, height: 1.1)),
  //             Text('Sakura Season 🍃',
  //                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500,
  //                     color: kTerra.withOpacity(0.85),
  //                     fontStyle: FontStyle.italic, height: 1.2)),
  //             const SizedBox(height: 10),
  //             Row(children: const [
  //               Icon(Icons.location_on_outlined, size:25,color: Color(0xFFB68B2D),),
  //               SizedBox(width: 4),
  //               Text('Japan', style: TextStyle(fontSize: 15, color: kBrown,
  //                   fontWeight: FontWeight.w700)),
  //               SizedBox(width: 8),
  //               Text('•', style: TextStyle(color: kMuted)),
  //               SizedBox(width: 8),
  //               Text('Mar – Apr', style: TextStyle(fontSize: 15, color: Colors.black)),
  //             ]),
  //             const SizedBox(height: 12),
  //             const SizedBox(
  //               width: 200,
  //               child: Text(
  //                 'A fleeting celebration of nature\'s beauty that paints Japan in dreams of pink and poetry.',
  //                 style: TextStyle(fontSize: 16, color: Color(0xFF5A4A3A), height: 1.6),
  //               ),
  //             ),
  //             const SizedBox(height: 14),
  //             _buildStatRow(),
  //             const SizedBox(height:30),
  //             Row(children: [
  //               _exploreBtn(),
  //               const SizedBox(width: 10),
  //               _heartBtn(),
  //             ]),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }


  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back button
          Row(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Color(0xFF5A4A3A),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          SizedBox(width:40,),
          // Title + Subtitle
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/logo.png",
                height: 40,
              ),
              const SizedBox(height: 4),
              const Text(
                "JAPAN UNIVERSE",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFA88535),
                  letterSpacing: 2.5,
                ),
              ),
                  const Text(
              'CELEBRATE THE WORLD',
              style: TextStyle(
                color: Color(0xFFB68B2D),
                fontSize: 10,
                letterSpacing: 1.8,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w700,
              ),
            ),
            ],
          ),

          // Nest Balance
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    'assets/NEST.png',
                    fit: BoxFit.fill,
                    width: 20,
                    height: 20,
                  ),
                ),
                const SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Nest Balance",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8C8883),
                      ),
                    ),
                    Text(
                      '₹2,45,000',
                      style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2F2F2F),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xFFB68B2D),
                  size: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }




  // Widget _buildHeroStack() {
  //   return
  //     SizedBox(
  //     height: 600, // ✅
  //     child: Stack(
  //       children: [
  //         // ✅ Positioned.fill — universe.png
  //         Positioned.fill(
  //           child: ClipRRect(
  //             child: Stack(
  //               fit: StackFit.expand,
  //               children: [
  //                 // Image.asset(
  //                 //   'assets/universe.png',
  //                 //   fit: BoxFit.cover,
  //                 // ),
  //                 // GlassmorphicContainer(
  //                 //   width: double.infinity,
  //                 //   height: double.infinity,
  //                 //   borderRadius: 0,
  //                 //   blur: 15,
  //                 //   alignment: Alignment.center,
  //                 //   border: 0,
  //                 //   linearGradient: LinearGradient(
  //                 //       colors: [
  //                 //         Colors.white.withOpacity(0.2),
  //                 //         Colors.white38.withOpacity(0.2)
  //                 //       ],
  //                 //       begin: Alignment.topLeft,
  //                 //       end: Alignment.bottomRight),
  //                 //   borderGradient: LinearGradient(colors: [
  //                 //     Colors.white24.withOpacity(0.2),
  //                 //     Colors.white70.withOpacity(0.2)
  //                 //   ]),
  //                 //   child: const SizedBox.shrink(),
  //                 // ),
  //                 Container(
  //                   decoration: const BoxDecoration(
  //                     color: Color(0xFFF5F0EA), // light cream base
  //                   ),
  //                   child: Stack(
  //                     children: [
  //                       // Top-left purple blob
  //                       Positioned(
  //                         top: -60,
  //                         left: -60,
  //                         child: _blurBlob(220, const Color(0xFFB8A8E0)),
  //                       ),
  //                       // Top-left small pink edge blob
  //                       Positioned(
  //                         top: 90,
  //                         left: -70,
  //                         child: _blurBlob(150, const Color(0xFFE8A8B8)),
  //                       ),
  //                       // Bottom-right coral blob
  //                       Positioned(
  //                         bottom: -80,
  //                         right: -60,
  //                         child: _blurBlob(260, const Color(0xFFE8A88A)),
  //                       ),
  //                       // Bottom-right warm gold blob
  //                       Positioned(
  //                         bottom: 30,
  //                         right: -40,
  //                         child: _blurBlob(180, const Color(0xFFE0C088)),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //
  //                 // LEFT FADE
  //                 Container(
  //                   decoration: BoxDecoration(
  //                     gradient: LinearGradient(
  //                       begin: Alignment.centerLeft,
  //                       end: Alignment.centerRight,
  //                       colors: [
  //                         const Color(0xFFFAF6F1),
  //                         const Color(0xFFFAF6F1).withOpacity(0.2),
  //                         Colors.transparent,
  //                       ],
  //                       stops: const [0.0, 0.45, 1.0],
  //                     ),
  //                   ),
  //                 ),
  //                 // BOTTOM RIGHT FADE
  //                 Positioned(
  //                   bottom: 0,
  //                   right: 0,
  //                   child: Container(
  //                     width: 550,
  //                     height: 250,
  //                     decoration: BoxDecoration(
  //                       gradient: RadialGradient(
  //                         center: Alignment.bottomRight,
  //                         radius: 1.0,
  //                         colors: [
  //                           const Color(0xFFF8F3EE),
  //                           const Color(0xFFF8F3EE).withOpacity(0.1),
  //                           Colors.transparent,
  //                         ],
  //                         stops: const [0.0, 0.4, 1.0],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 // BOTTOM CENTER FADE
  //                 // Positioned(
  //                 //   left: 0,
  //                 //   right: 0,
  //                 //   bottom: 0,
  //                 //   child: Container(
  //                 //     height: 200,
  //                 //     decoration: BoxDecoration(
  //                 //       gradient: LinearGradient(
  //                 //         begin: Alignment.bottomCenter,
  //                 //         end: Alignment.topCenter,
  //                 //         colors: [
  //                 //           const Color(0xFFFAF6F1),
  //                 //           Colors.transparent,
  //                 //         ],
  //                 //       ),
  //                 //     ),
  //                 //   ),
  //                 // ),
  //
  //                 _buildTopBar(),
  //               ],
  //             ),
  //           ),
  //         ),
  //
  //         // Right side tabs
  //         Positioned(
  //           right: 0,
  //           top: 140,
  //           child: _buildSideTabs(),
  //         ),
  //
  //         // Text content
  //         Positioned(
  //           left: 20,
  //           top: 120,
  //           right: 80, // ✅ side tabs க்கு space
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Row(children: [
  //                 const Icon(Icons.local_florist, size: 50, color: kPink),
  //                 const SizedBox(width: 6),
  //                 Text('FEATURED FESTIVAL',
  //                     style: TextStyle(fontSize: 15, letterSpacing: 1.8,
  //                         color: kTerra.withOpacity(0.85), fontWeight: FontWeight.w600)),
  //               ]),
  //               const SizedBox(height: 10),
  //               const Text('Cherry Blossom',
  //                   style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800,
  //                       color: kBrown, height: 1.1)),
  //               const SizedBox(height: 5),
  //               Text('Sakura Season 🍃',
  //                   style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500,
  //                       color: kTerra.withOpacity(0.85),
  //                       fontStyle: FontStyle.italic, height: 1.2)),
  //               const SizedBox(height: 10),
  //               Row(children: const [
  //                 Icon(Icons.location_on_outlined, size: 25, color: Color(0xFFB68B2D)),
  //                 SizedBox(width: 4),
  //                 Text('Japan', style: TextStyle(fontSize: 15, color: kBrown,
  //                     fontWeight: FontWeight.w700)),
  //                 SizedBox(width: 8),
  //                 Text('•', style: TextStyle(color: kMuted)),
  //                 SizedBox(width: 8),
  //                 Text('Mar – Apr', style: TextStyle(fontSize: 15, color: Colors.black)),
  //               ]),
  //               const SizedBox(height: 12),
  //               const SizedBox(
  //                 width: 200,
  //                 child: Text(
  //                   'A fleeting celebration of nature\'s beauty that paints Japan in dreams of pink and poetry.',
  //                   style: TextStyle(fontSize: 18, color: Color(0xFF5A4A3A), height: 1.6),
  //                 ),
  //               ),
  //               const SizedBox(height: 14),
  //               _buildStatRow(),
  //               const SizedBox(height: 30),
  //               Row(children: [
  //                 _exploreBtn(),
  //                 const SizedBox(width: 10),
  //                 _heartBtn(),
  //               ]),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildHeroStack() {
  //   return Column(
  //     children: [
  //
  //       CarouselSlider.builder(
  //         carouselController: _carouselController,
  //         itemCount: heroSlides.length,
  //         itemBuilder: (context, index, realIndex) {
  //
  //           final hero = heroSlides[index];
  //
  //           return _heroPage(hero);
  //
  //         },
  //         options: CarouselOptions(
  //           height: 600,
  //           viewportFraction: 1,
  //           autoPlay: true,
  //           autoPlayInterval: const Duration(seconds: 4),
  //           autoPlayAnimationDuration:
  //           const Duration(milliseconds: 800),
  //           autoPlayCurve: Curves.easeInOut,
  //           enlargeCenterPage: false,
  //           enableInfiniteScroll: true,
  //           onPageChanged: (index, reason) {
  //             setState(() {
  //               _heroIndex = index;
  //             });
  //           },
  //         ),
  //       ),
  //
  //       const SizedBox(height: 15),
  //
  //       AnimatedSmoothIndicator(
  //         activeIndex: _heroIndex,
  //         count: heroSlides.length,
  //         effect: ExpandingDotsEffect(
  //           activeDotColor: kTerra,
  //           dotColor: Colors.grey.shade300,
  //           dotHeight: 8,
  //           dotWidth: 8,
  //           expansionFactor: 3,
  //           spacing: 6,
  //         ),
  //         onDotClicked: (index) {
  //           _carouselController.animateToPage(index);
  //         },
  //       ),
  //     ],
  //   );
  // }

  Widget _buildHeroSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: StayCardSwiper(
        items: _japanHeroStays,
        cardHeight: 460,
      ),
    );
  }


  static const List<StayCardData> _japanHeroStays = [
    StayCardData(
      title: 'CHERRY BLOSSOM IN KYOTO',
      imageUrl:
      'https://images.unsplash.com/photo-1522383225653-ed111181a951?w=800&q=80',
      badgeText: '¥85,000+ UNLOCKED',
      description:
      'Wander ancient temple paths beneath endless canopies of sakura.',
      leadingIcon: Icons.temple_buddhist_outlined,
    ),
    StayCardData(
      title: 'NEON NIGHTS IN TOKYO',
      imageUrl:
      'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800&q=80',
      badgeText: '¥62,000+ UNLOCKED',
      description:
      'Lose yourself in Shibuya\'s glow and Tokyo\'s endless skyline.',
      leadingIcon: Icons.location_city_outlined,
    ),
    StayCardData(
      title: 'ONSEN RETREAT IN HAKONE',
      imageUrl:
      'https://images.unsplash.com/photo-1545569341-9eb8b30979d9?w=800&q=80',
      badgeText: '¥48,000+ UNLOCKED',
      description:
      'Soak in steaming hot springs with views of Mount Fuji nearby.',
      leadingIcon: Icons.spa_outlined,
    ),
    StayCardData(
      title: 'SNOW COUNTRY IN HOKKAIDO',
      imageUrl:
      'https://images.unsplash.com/photo-1578637387939-43c525550085?w=800&q=80',
      badgeText: '¥70,000+ UNLOCKED',
      description:
      'Powder-soft slopes and quiet pine forests blanketed in snow.',
      leadingIcon: Icons.ac_unit_outlined,
    ),
  ];

  Widget _heroPage(Map<String, String> hero) {
    return Stack(
      children: [

        Positioned.fill(
          child: Image.asset(
            hero["image"]!,
            fit: BoxFit.cover,
          ),
        ),

        _buildTopBar(),

        Positioned(
          right: 0,
          top: 140,
          child: _buildSideTabs(),
        ),

        Positioned(
          left: 20,
          top: 120,
          right: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.local_florist,
                      color: kPink,
                      size: 50),
                  SizedBox(width: 8),
                  Text(
                    "FEATURED FESTIVAL",
                    style: TextStyle(
                      color: kTerra,
                      fontSize: 15,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Text(
                hero["title"]!,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                hero["subtitle"]!,
                style: const TextStyle(
                  fontSize: 26,
                  color: kTerra,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.location_on,
                      color: Color(0xFFB68B2D)),
                  const SizedBox(width: 5),
                  Text(hero["country"]!),
                  const SizedBox(width: 8),
                  const Text("•"),
                  const SizedBox(width: 8),
                  Text(hero["month"]!),
                ],
              ),
              const SizedBox(height: 15),
              _buildStatRow(),
              const SizedBox(height: 30),
              Row(
                children: [
                  _exploreBtn(),
                  const SizedBox(width: 10),
                  _heartBtn(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }




  Widget _blurBlob(double size, Color color) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(0.6), // ✅ reduced opacity for light bg
        ),
      ),
    );
  }



  Widget _buildSideTabs() {
    final tabs = [
      (Icons.celebration_outlined, 'Festivals'),
      (Icons.access_time_outlined, 'Time Machine'),
      (Icons.location_on_outlined, 'Destinations'),
      (Icons.terrain_outlined, 'Adventure'),
    ];
    return Container(
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
        boxShadow: _softShadow,
      ),
      child: Column(
        children: tabs.asMap().entries.map((e) {
          final isActive = e.key == 0;
          return Container(
            width: 72,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: isActive ? kCream : kWhite,
              borderRadius: e.key == 0
                  ? const BorderRadius.only(topLeft: Radius.circular(16))
                  : e.key == tabs.length - 1
                  ? const BorderRadius.only(bottomLeft: Radius.circular(16))
                  : BorderRadius.zero,
            ),
            child: Column(children: [
              Icon(e.value.$1, size: 18,
                  color: isActive ? kTerra : kMuted),
              const SizedBox(height: 4),
              Text(e.value.$2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 8,
                      color: isActive ? kTerra : kMuted,
                      fontWeight: isActive ? FontWeight.w700 : FontWeight.w400)),
            ]),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildStatRow() {
    return Row(children: [
      _stat(Icons.calendar_today_outlined, 'Best Time', 'Mar – Apr'),
      const SizedBox(width: 16),
      _stat(Icons.star_outline, 'Popularity', '★★★★★'),
      const SizedBox(width: 16),
      _stat(Icons.people_outline, 'Experience', 'Peaceful'),
    ]);
  }

  Widget _stat(IconData icon, String label, String value) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Icon(icon, size: 30, color: kGold),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.w700 )),
      ]),
      const SizedBox(height: 5),
      Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700,
          color: kBrown)),
    ]);
  }

  Widget _exploreBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: kGold,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: const [
        Text('Explore Festival',
            style: TextStyle(fontSize: 15, color: kWhite, fontWeight: FontWeight.w600)),
        SizedBox(width: 8),
        Icon(Icons.arrow_forward, color: kWhite, size:30),
      ]),
    );
  }

  Widget _heartBtn() {
    return Container(
      width: 50, height:50,
      decoration: BoxDecoration(
        color: kWhite,
        shape: BoxShape.circle,
        boxShadow: _softShadow,
      ),
      child: const Icon(Icons.favorite_border, size:30, color: kTerra),
    );
  }

  // ── ABOUT + HIGHLIGHTS ─────────────────────────────────────────────────────
// ── ABOUT THE FESTIVAL ─────────────────────────────────────────────────────
  Widget _buildAboutAndHighlights() {
    const String aboutText =
        "Japan's cherry blossom season transforms the entire country into a canvas of delicate pink and white. The sakura blooms typically last only 1–2 weeks, creating a magical atmosphere across parks, temples, rivers, and streets. Locals and visitors gather for hanami (flower viewing) picnics to celebrate the fleeting beauty of spring.";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About the Festival',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: kBrown,
            ),
          ),
          const SizedBox(height: 10),

          Text(
            aboutText,
            maxLines: _isExpanded ? null : 3,
            overflow:
            _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF6A5A4A),
              height: 1.55,
            ),
          ),

          const SizedBox(height: 8),

          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? 'Read less' : 'Read more',
              style: const TextStyle(
                fontSize: 16,
                color: kTerra,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 24),

          _buildFestivalHighlights(),
        ],
      ),
    );
  }


  // ── FESTIVAL HIGHLIGHTS ────────────────────────────────────────────────────
  Widget _buildFestivalHighlights() {
    // final items = [
    //   ('Sweet Hanami Spots', 'Ueno Park', 'assets/universe.png'),
    //   ('Evening Illuminations', 'Meguro River', 'assets/natural.png'),
    //   ('Blossom Trail', 'Mt. Yoshino', 'assets/experience.png'),
    // ];

    final items = [
      (
      'Sweet Hanami Spots',
      'Ueno Park',
      'Enjoy breathtaking cherry blossom views with traditional hanami picnics and beautiful lakeside scenery.',
      'assets/universe.png',
      ),
      (
      'Evening Illuminations',
      'Meguro River',
      'Experience thousands of illuminated cherry blossom trees reflecting beautifully along the river at night.',
      'assets/natural.png',
      ),
      (
      'Blossom Trail',
      'Mt. Yoshino',
      'Walk through over 30,000 cherry blossom trees across Japan\'s most famous sakura mountain.',
      'assets/experience.png',
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Festival Highlights',
              style: TextStyle(fontSize:20, fontWeight: FontWeight.w800, color: kBrown),
            ),
            _seeAllBtn(),
          ],
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 600,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, i) => _highlightCard(items[i]),
          ),
        ),
      ],
    );
  }

  // Widget _highlightCard((String, String, String, String) item) {
  //   return Container(
  //     width: 300,
  //     decoration: BoxDecoration(
  //       // borderRadius: BorderRadius.circular(18),
  //       // boxShadow: _softShadow,
  //       color: const Color(0xFFF8F3EE),
  //       borderRadius: BorderRadius.circular(30),
  //       boxShadow: const [
  //         BoxShadow(
  //           color: Colors.white,
  //           offset: Offset(-9, -9),
  //           blurRadius: 13,
  //         ),
  //         BoxShadow(
  //           color: Color(0xFFE5DDD3),
  //           offset: Offset(9, 9),
  //           blurRadius:13,
  //         ),
  //       ],
  //       image: DecorationImage(
  //         image: AssetImage(item.$4),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //     child: Stack(
  //       children: [
  //         Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(18),
  //             gradient: LinearGradient(
  //               begin: Alignment.topCenter,
  //               end: Alignment.bottomCenter,
  //               colors: [
  //                 Colors.transparent,
  //                 Colors.black.withOpacity(0.55),
  //               ],
  //               stops: const [0.4, 1.0],
  //             ),
  //           ),
  //         ),
  //         Positioned(
  //           left: 14,
  //           right: 10,
  //           bottom: 12,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 item.$1,
  //                 style: const TextStyle(
  //                   fontSize: 20,
  //                   fontWeight: FontWeight.w700,
  //                   color: kWhite,
  //                 ),
  //               ),
  //               const SizedBox(height: 4),
  //
  //               Text(
  //                 item.$2,
  //                 style: const TextStyle(
  //                   fontSize: 16,
  //                   color: kGold,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //
  //               const SizedBox(height: 8),
  //
  //               Text(
  //                 item.$3,
  //                 maxLines: 3,
  //                 overflow: TextOverflow.ellipsis,
  //                 style: const TextStyle(
  //                   fontSize: 14,
  //                   color: kWhite,
  //                   height: 1.5,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _highlightCard((String, String, String, String) item) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F3EE),
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(-8, -8),
            blurRadius: 16,
          ),
          BoxShadow(
            color: Color(0xFFD8CFC4),
            offset: Offset(8, 8),
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Image
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, -5),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Color(0xFFD8CFC4),
                    offset: Offset(5, 5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  item.$4,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          const SizedBox(height: 18),

          /// Text Area
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  item.$1,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2C2C2C),
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  item.$2,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFFB8956A),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                Expanded(
                  child: Text(
                    item.$3,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Color(0xFF777777),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutStats() {
    final stats = [
      (Icons.people_outline, 'Tradition', '1,000+ Years'),
      (Icons.favorite_outline, 'Best For', 'Nature Lovers'),
      (Icons.wb_sunny_outlined, 'Vibes', 'Peaceful • Scenic'),
      (Icons.groups_outlined, 'Crowd', 'Moderate'),
    ];
    return Wrap(
      spacing: 12,
      runSpacing: 10,
      children: stats.map((s) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 28, height: 28,
            decoration: BoxDecoration(
              color: const Color(0xFFF5EDE0),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(s.$1, size: 14, color: kGold),
          ),
          const SizedBox(width: 6),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(s.$2, style: const TextStyle(fontSize: 9, color: kMuted)),
            Text(s.$3, style: const TextStyle(fontSize: 10,
                fontWeight: FontWeight.w600, color: kBrown)),
          ]),
        ],
      )).toList(),
    );
  }

  Widget _buildHighlightCards() {
    final items = [
      ('Scenic Hanami Spots', 'Cherry blossoms glow for breathtaking views',
      const Color(0xFFE8C4A8)),
      ('Evening Illuminations', 'Cherry blossoms glow under lantern lights',
      const Color(0xFF6A3A2A)),
      ('Seasonal Delicacies', 'Savour special treats available only in spring',
      const Color(0xFF8A6A5A)),
    ];
    return Row(
      children: items.map((item) => Expanded(
        child: Container(
          margin: const EdgeInsets.only(right: 6),
          height: 110,
          decoration: BoxDecoration(
            color: item.$3,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter, end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.55)],
                ),
              ),
            ),
            Positioned(
              left: 6, right: 4, bottom: 6,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(item.$1, style: const TextStyle(fontSize: 9,
                    fontWeight: FontWeight.w700, color: kWhite, height: 1.2)),
                const SizedBox(height: 2),
                Text(item.$2, style: const TextStyle(fontSize: 8,
                    color: Color(0xFFCCBBAA), height: 1.3)),
              ]),
            ),
          ]),
        ),
      )).toList(),
    );
  }

  // ── TOP PLACES ─────────────────────────────────────────────────────────────
// ── PLACES TO EXPERIENCE ───────────────────────────────────────────────────


  Widget _buildTopPlaces() {
    final places = [
      _Place(
        'Kyoto, Japan',
        '3 Days • Ancient Temples & Cherry Blossoms',
        'Starting from ¥28,000 per person',
        4.9,
        'assets/universe.png',
      ),
      _Place(
        'Osaka, Japan',
        '2 Days • Food Streets & Nightlife Experience',
        'Starting from ¥18,500 per person',
        4.7,
        'assets/cheeryimage.png',
      ),
      _Place(
        'Nara, Japan',
        '1 Day • Deer Park & Historic Shrines',
        'Packages from ¥9,000',
        4.6,
        'assets/culture.png',
      ),
      _Place(
        'Tokyo, Japan',
        '2 Days • Modern City, Shopping & Culture',
        'Starting from ¥22,000 per person',
        4.8,
        'assets/discoveryimg.png',
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Places to Experience',
                style: TextStyle(fontSize:20, fontWeight: FontWeight.w800, color: kBrown),
              ),
              _seeAllBtn(),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            height:400,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: places.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, i) => _placeCard(places[i]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _placeCard(_Place p) {
    return Container(
      width: 300,
      height: 320, // fixed total height for predictable 70/30 split
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: _softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image — 70% of card height
          SizedBox(
            height: 320 * 0.8,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(18),
                  ),
                  child: Image.asset(
                    p.image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.92),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, size: 15, color: Color(0xFFFFB800)),
                        const SizedBox(width: 3),
                        Text(
                          p.rating.toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: kBrown,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Text Area — remaining 30% of card height
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    p.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize:20,
                      fontWeight: FontWeight.w700,
                      color: kBrown,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    p.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 18, color: kMuted),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    p.priceLabel,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: kTerra,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }



  // ── EXPERIENCES ────────────────────────────────────────────────────────────
// ── EXPERIENCES YOU'LL LOVE ────────────────────────────────────────────────
  Widget _buildExperiencesYouLove() {
    final experiences = [
      _Experience(Icons.emoji_food_beverage_outlined, const Color(0xFFFCE4E4),
          'Traditional Tea Ceremony', 'Authentic matcha experience in...', '¥3,500', '2h'),
      _Experience(Icons.nightlight_round, const Color(0xFFFCE4E4),
          'Evening Illuminations', 'Night walk along Meguro River lit by...', '¥1,200', '3h'),
      _Experience(Icons.checkroom_outlined, const Color(0xFFFCE4E4),
          'Kimono Dressing', 'Wear a traditional kimono and stroll...', '¥5,000', '4h'),
      _Experience(Icons.music_note_outlined, const Color(0xFFFCE4E4),
          'Local Matsuri Festival', 'Street food, taiko drums, and folk...', 'Free', 'Evening'),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Experiences You'll Love",
                style: TextStyle(fontSize:20, fontWeight: FontWeight.w800, color: kBrown),
              ),
              _seeAllBtn(),
            ],
          ),
          const SizedBox(height: 14),
          ...experiences.map((e) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(16),
              boxShadow: _softShadow,
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: e.color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(e.icon, size:30, color: kTerra),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.title,
                          style: const TextStyle(
                              fontSize:20, fontWeight: FontWeight.w700, color: kBrown)),
                      const SizedBox(height: 3),
                      Text(
                        e.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 18, color: kMuted, height: 1.3),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(Icons.access_time, size: 15, color: kMuted),
                          const SizedBox(width: 3),
                          Text(e.duration,
                              style: const TextStyle(fontSize: 15, color: kMuted)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  e.price,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w700, color: kTerra),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }


  // ── CURATED PACKAGES ───────────────────────────────────────────────────────
// ── SEASONAL PACKAGES ──────────────────────────────────────────────────────
  Widget _buildCuratedPackages() {
    final packages = [
      _Package(
        'Sakura Explorer',
        '5 nights',
        '¥58,000',
        'Best Value',
        'assets/universe.png',
      ),
      _Package(
        'Kyoto Heritage',
        '3 nights',
        '¥38,000',
        'Popular',
        'assets/universe.png',
      ),
      _Package(
        'Family Sakura Fun',
        '4 nights',
        '¥45,000',
        null,
        'assets/universe.png',
      ),
      _Package(
        'Luxury Sakura Trail',
        '6 nights',
        '¥72,000',
        null,
        'assets/universe.png',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Seasonal Packages',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: kBrown),
              ),
              _seeAllBtn(),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 250,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: packages.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, i) => _packageCard(packages[i]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _packageCard(_Package p) {
    return Container(
      width: 185,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: _softShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.asset(
              p.image,
              fit: BoxFit.cover,
            ),

            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                  ],
                  stops: const [0.3, 1.0],
                ),
              ),
            ),

            // Badge
            if (p.badge != null)
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: p.badge == 'Best Value'
                        ? kTerra
                        : const Color(0xFFE05050),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    p.badge!,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            // Bottom Text
            Positioned(
              left: 14,
              right: 14,
              bottom: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    p.name,
                    style: const TextStyle(
                      fontSize:20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        p.duration,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFFE5DACC),
                        ),
                      ),
                      Text(
                        p.price,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  // ── BOTTOM NAV ─────────────────────────────────────────────────────────────
  Widget _buildBottomNav() {
    return Container(
      height: 68,
      decoration: BoxDecoration(
        color: kWhite,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.06),
              blurRadius: 16, offset: const Offset(0, -4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_navItems.length, (i) {
          final item = _navItems[i];
          final isSelected = i == _selectedNavIndex;
          return GestureDetector(
            onTap: () => setState(() => _selectedNavIndex = i),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, size: 22,
                    color: isSelected ? kTerra : kMuted),
                const SizedBox(height: 3),
                Text(item.label,
                    style: TextStyle(fontSize: 10,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                        color: isSelected ? kTerra : kMuted)),
                if (isSelected)
                  Container(
                    margin: const EdgeInsets.only(top: 3),
                    width: 4, height: 4,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: kTerra),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // ── HELPERS ────────────────────────────────────────────────────────────────
  Widget _nestBalanceChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: kWhite, borderRadius: BorderRadius.circular(20),
        boxShadow: _softShadow,
      ),
      child: Row(children: [
        const Icon(Icons.savings_outlined, size: 16, color: kGold),
        const SizedBox(width: 6),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
          Text('Nest Balance', style: TextStyle(fontSize: 9, color: kMuted)),
          Text('₹2,45,000', style: TextStyle(fontSize: 13,
              fontWeight: FontWeight.w700, color: kBrown)),
        ]),
        const SizedBox(width: 4),
        const Icon(Icons.keyboard_arrow_down, size: 16, color: kMuted),
      ]),
    );
  }

  Widget _circleBtn(IconData icon, {double size = 22}) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: kWhite,
        shape: BoxShape.circle,
        boxShadow: _softShadow,
      ),
      child: Icon(icon, size: size, color: const Color(0xFF5A4A3A)),
    );
  }


  Widget _sectionLabel(String text) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(text, style: const TextStyle(fontSize: 10, letterSpacing: 1.8,
          color: Color(0xFF5A4A3A), fontWeight: FontWeight.w700)),
      const SizedBox(height: 4),
      Container(width: 32, height: 2,
          decoration: BoxDecoration(color: kTerra,
              borderRadius: BorderRadius.circular(1))),
    ]);
  }

  Widget _viewAllBtn() {
    return Row(children: const [
      Text('View all', style: TextStyle(fontSize: 11, color: kTerra)),
      SizedBox(width: 2),
      Icon(Icons.chevron_right, size: 16, color: kTerra),
    ]);
  }

  List<BoxShadow> get _softShadow => [
    BoxShadow(color: Colors.black.withOpacity(0.07),
        blurRadius: 10, offset: const Offset(0, 3)),
  ];
}

// ── DATA MODELS ───────────────────────────────────────────────────────────────
class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem(this.icon, this.label);
}

class _Place {
  final String name;
  final String subtitle;
  final String priceLabel;
  final double rating;
  final String image;

  _Place(
      this.name,
      this.subtitle,
      this.priceLabel,
      this.rating,
      this.image,
      );
}

class _Experience {
  final IconData icon;
  final Color color;
  final String title, subtitle, price, duration;
  const _Experience(this.icon, this.color, this.title, this.subtitle, this.price, this.duration);
}

class _Package {
  final String name;
  final String duration;
  final String price;
  final String? badge;
  final String image;

  _Package(
      this.name,
      this.duration,
      this.price,
      this.badge,
      this.image,
      );
}

Widget _seeAllBtn() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: const [
      Text('See all', style: TextStyle(fontSize: 18, color: kTerra, fontWeight: FontWeight.w600)),
      SizedBox(width: 2),
      Icon(Icons.chevron_right, size: 25, color: kTerra),
    ],
  );
}


