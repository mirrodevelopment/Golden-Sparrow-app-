import 'package:flutter/material.dart';

import 'festival_universe_screen.dart';

class JapanUniverseScreen extends StatefulWidget {
  const JapanUniverseScreen({super.key});

  @override
  State<JapanUniverseScreen> createState() => _JapanUniverseScreenState();
}

class _JapanUniverseScreenState extends State<JapanUniverseScreen> {
  int _selectedNavIndex = 1;

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
      backgroundColor: const Color(0xFFFAF6F1),
      // bottomNavigationBar: _buildBottomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _buildTopBar(),
              _buildHeroSection(),
              // Stack(
              //   children: [
              //     _buildHeroSection(),          // hero renders first (bottom layer)
              //     SafeArea(
              //       child: _buildTopBar(),      // top bar floats on top of hero
              //     ),
              //   ],
              // ),
              const SizedBox(height:30),
              _buildDiscoverSection(),
              const SizedBox(height: 28),
              _buildHandpickedHighlights(),
              const SizedBox(height: 28),
              _buildPlanBanner(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

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
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFA88535),
                  letterSpacing: 2.5,
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




  Widget _buildHeroSection() {
    return Stack(
      children: [
        // Hero image placeholder — replace with actual network/asset image
        Container(
          width: double.infinity,
          height: 600,
          margin: const EdgeInsets.symmetric(horizontal: 0),
          child: Stack(
            children: [
              // Background gradient representing the scene
              // Container(
              //   decoration: const BoxDecoration(
              //     gradient: LinearGradient(
              //       begin: Alignment.topCenter,
              //       end: Alignment.bottomCenter,
              //       colors: [
              //         Color(0xFFFAF6F1),
              //           Color(0xFFF5E8D8),
              //       ],
              //     ),
              //   ),
              // ),
              // Circular pedestal with Japan label
              // Positioned(
              //   bottom: 0,
              //   left: 0,
              //   right: 0,
              //   child: Center(
              //     child: Container(
              //       width: 300,
              //       height: 80,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(140),
              //         gradient: const LinearGradient(
              //           begin: Alignment.topCenter,
              //           end: Alignment.bottomCenter,
              //           colors: [
              //             Color(0xFF3D2B1F),
              //             Color(0xFF1A0F0A),
              //           ],
              //         ),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.black.withOpacity(0.3),
              //             blurRadius: 30,
              //             offset: const Offset(0, 10),
              //           ),
              //         ],
              //       ),
              //       // child: const Center(
              //       //   child:
              //       //   // Text(
              //       //   //   'J A P A N',
              //       //   //   style: TextStyle(
              //       //   //     color: Color(0xFFC8A882),
              //       //   //     letterSpacing: 6,
              //       //   //     fontSize: 13,
              //       //   //     fontFamily: 'Arial',
              //       //   //     fontWeight: FontWeight.w300,
              //       //   //   ),
              //       //   // ),
              //       // ),
              //     ),
              //   ),
              // ),
              // Pagoda tower image placeholder
              Positioned.fill(
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(14),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/universe.png',
                        fit: BoxFit.cover,
                      ),
                      // ── LEFT FADE ──
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              const Color(0xFFFAF6F1),
                              // ← match scaffold bg
                              const Color(0xFFFAF6F1).withOpacity(0.2),
                              Colors.transparent,
                            ],
                            stops: const [0.0, 0.45, 1.0],
                          ),
                        ),
                      ),

                      // ── TOP FADE ──
                      // Positioned(
                      //   top: 0, left: 0, right: 0,
                      //   child: Container(
                      //     height: 200,
                      //     decoration: BoxDecoration(
                      //       gradient: LinearGradient(
                      //         begin: Alignment.topCenter,
                      //         end: Alignment.bottomCenter,
                      //         colors: [
                      //           const Color(0xFFFAF6F1),          // ← match scaffold bg
                      //           const Color(0xFFFAF6F1).withOpacity(0.0),  // fully transparent
                      //         ],
                      //         stops: const [0.0, 1.0],
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      // ── TOP RIGHT CORNER FADE ──
                      // Positioned(
                      //   top: 0, right: 0,
                      //   child: Container(
                      //     width: 180,
                      //     height: 180,
                      //     decoration: BoxDecoration(
                      //       gradient: RadialGradient(
                      //         center: Alignment.topRight,
                      //         radius: 1.0,
                      //         colors: [
                      //           const Color(0xFFFAF6F1),           // ← match scaffold bg
                      //           const Color(0xFFFAF6F1).withOpacity(0.1),
                      //           Colors.transparent,
                      //         ],
                      //         stops: const [0.0, 0.45, 1.0],
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      // ── BOTTOM RIGHT CORNER FADE ──
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 550,
                          height: 250,
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                              center: Alignment.bottomRight,
                              radius: 1.0,
                              colors: [
                                const Color(0xFFF8F3EE), // match scaffold background
                                const Color(0xFFF8F3EE).withOpacity(0.1),
                                const Color(0xFFF8F3EE).withOpacity(0.1),
                                Colors.transparent,
                              ],
                              stops: const [0.0, 0.3, 0.6, 1.0],
                            ),
                          ),
                        ),
                      ),
                      // ── BOTTOM CENTER RADIAL FADE ──
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                              center: Alignment.bottomCenter,
                              radius: 1.2,
                              colors: [
                                const Color(0xFFF8F3EE),
                                const Color(0xFFF8F3EE).withOpacity(0.1),
                                const Color(0xFFF8F3EE).withOpacity(0.1),
                                Colors.transparent,
                              ],
                              stops: const [0.0, 0.3, 0.6, 1.0],
                            ),
                          ),
                        ),
                      ),
                      _buildTopBar(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Text overlay on left
        Positioned(
          // left: 20,
          // top: 130,
          left: 25,
          top: 170,
          right: 25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // "WELCOME TO" small caps label
              const Text(
                "WELCOME TO",
                style: TextStyle(
                  fontSize:25,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFA88535),
                  letterSpacing: 2.5,
                ),
              ),

              const SizedBox(height: 4),

              // "Japan" large heading
              const Text(
                "Japan",
                style: TextStyle(
                  fontSize:50,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2C2218),
                  height: 1.05,
                  fontFamily: 'Serif', // use Georgia or a serif font
                ),
              ),

              const SizedBox(height:20),

              // Divider line
              Container(
                width: 36,
                height: 2,
                color: Color(0xFFA88535),
              ),

              const SizedBox(height: 20),

              // Description text
              const Text(
                "A harmony of ancient traditions\nand modern wonders.\nEvery season reveals a\nnew story.",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF6A5A4A),
                  height: 1.6,
                  fontFamily: 'Arial',
                ),
              ),

              const SizedBox(height:30),

              // Watch Japan Story button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Play icon circle
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFA88535),
                          width: 2.5,
                        ),
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: Color(0xFFA88535),
                        size:25,
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Text(
                      "Watch Japan Story",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFA88535),
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


  Widget _buildWelcomeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "WELCOME TO" small caps label
          const Text(
            "WELCOME TO",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFFA88535),
              letterSpacing: 2.5,
            ),
          ),

          const SizedBox(height: 4),

          // "Japan" large heading
          const Text(
            "Japan",
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C2218),
              height: 1.05,
              fontFamily: 'Serif', // use Georgia or a serif font
            ),
          ),

          const SizedBox(height: 16),

          // Divider line
          Container(
            width: 36,
            height: 2,
            color: Color(0xFFA88535),
          ),

          const SizedBox(height: 20),

          // Description text
          const Text(
            "A harmony of ancient traditions\nand modern wonders.\nEvery season reveals a\nnew story.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF4A3F35),
              height: 1.7,
            ),
          ),

          const SizedBox(height: 28),

          // Watch Japan Story button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Play icon circle
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFA88535),
                      width: 1.5,
                    ),
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Color(0xFFA88535),
                    size: 18,
                  ),
                ),

                const SizedBox(width: 10),

                const Text(
                  "Watch Japan Story",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2C2218),
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  // ── DISCOVER THROUGH ───────────────────────────────────────────────────────
  Widget _buildDiscoverSection() {
    final categories = [
      _Category('Festivals', Icons.celebration_outlined,
          'Celebrate life the Japanese way', const Color(0xFFE8C4B0), 'assets/universe.png'),
      _Category('Culture', Icons.temple_buddhist_outlined,
          'Timeless traditions and arts', const Color(0xFFD4B896),'assets/universe.png'),
      _Category('Nature', Icons.mms_rounded,
          'Breathtaking landscapes', const Color(0xFFC4A882),'assets/natural.png'),
      _Category('Experiences', Icons.explore_outlined,
          'Unique activities and adventures', const Color(0xFFA8B8C8),'assets/experience.png'),
      _Category('Luxury', Icons.hotel_outlined,
          'Refined stays, elevated comfort', const Color(0xFFC8B0A0),'assets/luxury.png'),
    ];

    return Column(
      children: [
        // Header
        Column(
          children: [
            const Text(
              'DISCOVER JAPAN THROUGH',
              style: TextStyle(
                fontSize:22,
                letterSpacing: 2.2,
                color: Color(0xFFB68B2D),
                fontFamily: 'Arial',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            // const Icon(Icons.play_arrow, color: Color(0xFFB8724A), size:30),
            Row(
              children: [
                // Left divider
                Expanded(
                  child: Container(
                    height: 1,
                    color: const Color(0xFFB8724A).withOpacity(0.4),
                  ),
                ),

                const SizedBox(width: 10),

                // Center play icon
                const Icon(
                  Icons.play_arrow,
                  color: Color(0xFFB8724A),
                  size: 30,
                ),

                const SizedBox(width: 10),

                // Right divider
                Expanded(
                  child: Container(
                    height: 1,
                    color: const Color(0xFFB8724A).withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Horizontal scroll
        SizedBox(
          height: 300, // ← increase to fit card content (167 image + 22 gap + 50 text)
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (_, i) => _categoryCard(categories[i]),
          ),
        ),
      ],
    );
  }

  Widget _categoryCard(_Category cat) {
    return GestureDetector(
      onTap: () {
        if (cat.title == 'Festivals') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const FestivalUniverseScreen(),
            ),
          );
        }
        // future: else if (cat.title == 'Culture') { ... }
      },
      child: Container(
        width: 300,
        // margin: const EdgeInsets.only(right: 16),
        // padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F3EE),
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              offset: Offset(-9, -9),
              blurRadius: 13,
            ),
            BoxShadow(
              color: Color(0xFFE5DDD3),
              offset: Offset(9, 9),
              blurRadius:13,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 300,
              height: 167, // 150 (image) + 17 (badge half overflow)
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Image — full SizedBox height
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      cat.imagePath,
                      width: 300,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
      
                  // Circle badge — half overlapping bottom of image
                  Positioned(
                    bottom: -17, // half of badge size (34 / 2 = 17)
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width:80,
                        height:80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            cat.icon,
                            size: 40,
                            color: const Color(0xFFB8724A),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      
            const SizedBox(height: 22), // accounts for badge bottom half
            Text(
              cat.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2A1A0A),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              cat.subtitle,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF8A7A6A),
                height: 1.3,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // ── HANDPICKED HIGHLIGHTS ──────────────────────────────────────────────────
  Widget _buildHandpickedHighlights() {
    final highlights = [
      _Highlight(
        'Cherry Blossom Spots',
        'Best places in Japan\nMar – Apr',
        'assets/cheeryimage.png',   // ← imagePath 3rd
        const Color(0xFFE8C4A0),    // ← color 4th
      ),
      _Highlight(
        'Ancient Cities',
        'Kyoto, Nara & more',
        'assets/ancient.png',
        const Color(0xFF6A4A2A),
      ),
      _Highlight(
        'Onsen Escapes',
        'Relax and rejuvenate',
        'assets/onsen_escapes.png',
        const Color(0xFF3A5A4A),
      ),
      _Highlight(
        'Modern Wonders',
        'Tokyo and beyond',
        'assets/modern_wonders.png',
        const Color(0xFF1A2A4A),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Section header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'HANDPICKED HIGHLIGHTS',
                style: TextStyle(
                  fontSize:20,
                  letterSpacing: 2.2,
                  color: Color(0xFFB68B2D),
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: const [
                  Text(
                    'View all',
                    style: TextStyle(
                      fontSize:20,
                      color: Color(0xFFB8724A),
                      fontFamily: 'Arial',
                    ),
                  ),
                  SizedBox(width: 2),
                  Icon(Icons.chevron_right,
                      size: 16, color: Color(0xFFB8724A)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          // Horizontal scroll
          SizedBox(
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: highlights.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (_, i) => _highlightCard(highlights[i]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _highlightCard(_Highlight h) {
    return Container(
      width: 300,
      // margin: const EdgeInsets.only(right: 16),
      // padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F3EE),
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(-9, -9),
            blurRadius: 13,
          ),
          BoxShadow(
            color: Color(0xFFE5DDD3),
            offset: Offset(9, 9),
            blurRadius:13,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// IMAGE
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(22),
              topRight: Radius.circular(22),
            ),
            child: Image.asset(
              h.imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// CONTENT
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// TEXT
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          h.title,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF3B3128),
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          h.subtitle,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF7B736A),
                            height: 1.4,
                          ),
                        ),

                        const SizedBox(height: 4),

                        const Text(
                          'Mar - Apr',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7B736A),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// ARROW
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFC89433),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 25,
                      ),
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
  // ── PLAN BANNER ────────────────────────────────────────────────────────────
  Widget _buildPlanBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: _softShadow,
        ),
        child: Row(
          children: [
            Container(
              width:50,
              height:50,
              decoration: BoxDecoration(
                color: const Color(0xFFFAF0E6),
                shape: BoxShape.circle
              ),
              child: const Icon(Icons.luggage_outlined,
                  size:30, color: Color(0xFFB8956A)),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ready to plan your journey?',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2A1A0A),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Build your perfect itinerary with experiences\nthat match your style.',
                    maxLines: 5,
                    style: TextStyle(
                      fontSize:15,
                      color: Color(0xFF8A7A6A),
                      fontFamily: 'Arial',
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFB8724A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  Text(
                    'Plan My Journey',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Arial',
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 13),
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
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
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
                Icon(
                  item.icon,
                  size: 22,
                  color: isSelected
                      ? const Color(0xFFB8724A)
                      : const Color(0xFF9A8A7A),
                ),
                const SizedBox(height: 3),
                Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Arial',
                    fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected
                        ? const Color(0xFFB8724A)
                        : const Color(0xFF9A8A7A),
                  ),
                ),
                if (isSelected)
                  Container(
                    margin: const EdgeInsets.only(top: 3),
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFB8724A),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // ── HELPERS ────────────────────────────────────────────────────────────────
  Widget _circleBtn(
      BuildContext context,
      IconData icon, {
        double size = 25,
      }) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: _softShadow,
        ),
        child: Icon(
          icon,
          size: size,
          color: const Color(0xFF5A4A3A),
        ),
      ),
    );
  }
  List<BoxShadow> get _softShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.07),
      blurRadius: 10,
      offset: const Offset(0, 3),
    ),
  ];
}

// ── DATA MODELS ───────────────────────────────────────────────────────────────
class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem(this.icon, this.label);
}

class _Category {
  final String title;
  final IconData icon;
  final String subtitle;
  final Color color;
  final String imagePath;      // ← add this
  const _Category(this.title, this.icon, this.subtitle, this.color, this.imagePath);
}


// ── DATA MODEL FIX ─────────────────────────────────────────────────────────
class _Highlight {
  final String title;
  final String subtitle;
  final String imagePath; // ← move imagePath before color
  final Color color;
  const _Highlight(this.title, this.subtitle, this.imagePath, this.color);
}