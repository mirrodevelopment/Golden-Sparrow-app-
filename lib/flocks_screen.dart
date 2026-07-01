import 'package:flutter/material.dart';


class FlocksApp extends StatefulWidget {
  const FlocksApp({Key? key}) : super(key: key);

  @override
  State<FlocksApp> createState() => _FlocksAppState();
}

class _FlocksAppState extends State<FlocksApp> {
  int selectedCategoryIndex = -1;

  final List<FlockModel> myFlocks = [
    FlockModel(
      id: '1',
      title: 'Japan Echoes Trip 2026',
      route: 'Mumbai → Tokyo → Kyoto',
      date: 'Mar 2026',
      members: 12,
      progress: 65,
      status: 'Planning',
      imageUrl: 'assets/japan.png',
    ),
    FlockModel(
      id: '2',
      title: 'Traditions Offline',
      route: 'Delhi → Leh → Lhasa',
      date: 'Nov 2025',
      members: 8,
      progress: 0,
      status: 'Planning',
      imageUrl: 'assets/traditions.png',
    ),
    FlockModel(
      id: '3',
      title: 'Dharavi Vanilla Vacation',
      route: 'Mumbai → Amsterdam',
      date: 'Feb 2026',
      members: 6,
      progress: 45,
      status: 'Planning',
      imageUrl: 'assets/dharavi.png',
    ),
    FlockModel(
      id: '4',
      title: 'French Riviera Getaway',
      route: 'Mumbai → Nice → Monaco',
      date: 'Apr 2026',
      members: 10,
      progress: 18,
      status: 'Planning',
      imageUrl: 'assets/french.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Banner
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Container(
            //     padding: const EdgeInsets.all(20),
            //     decoration: BoxDecoration(
            //       color: const Color(0xFFB8956A),
            //       borderRadius: BorderRadius.circular(16),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.black.withOpacity(0.1),
            //           blurRadius: 8,
            //           offset: const Offset(0, 4),
            //         ),
            //       ],
            //     ),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         const Text(
            //           'Travel as a flock, create memories that last.',
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 24,
            //             fontWeight: FontWeight.w600,
            //             height: 1.3,
            //           ),
            //         ),
            //         const SizedBox(height: 12),
            //         const Text(
            //           'Plan collective journeys, share experiences, and explore the world together with people you love.',
            //           style: TextStyle(
            //             color: Color(0xFFF5F3F0),
            //             fontSize: 13,
            //             height: 1.5,
            //           ),
            //         ),
            //         const SizedBox(height: 16),
            //         ElevatedButton(
            //           onPressed: () {},
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: const Color(0xFFD4AF37),
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(8),
            //             ),
            //           ),
            //           child: const Row(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               Icon(Icons.add, color: Color(0xFF8B7355)),
            //               SizedBox(width: 8),
            //               Text(
            //                 'Create New Flock',
            //                 style: TextStyle(
            //                   color: Color(0xFF8B7355),
            //                   fontWeight: FontWeight.w600,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Categories Section
            _buildHeroSection(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      color: Color(0xFF8B7355),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _categoryCard('Schools', 'Academic trips', 0),
                      _categoryCard('Corporate', 'Team retreats', 1),
                      _categoryCard('Families', 'Family getaways', 2),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // My Flocks Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My Flocks',
                    style: TextStyle(
                      color: Color(0xFF8B7355),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'View all >',
                      style: TextStyle(
                        color: Color(0xFFD4AF37),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: myFlocks.length,
              itemBuilder: (context, index) {
                return _flockCard(context, myFlocks[index]);
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back button
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
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
              SizedBox(width: 10,),
              const Text(
                'DISCOVERY REVEAL',
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 1.8,
                  // color: Color(0xFF8A7A6A),
                  color: Color(0xFFB68B2D),
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Arial',
                ),
              ),
            ],
          ),          // Title
          Image.asset(
            "assets/logo.png",
            height: 40,
          ),
          // Nest Balance
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal:5,
              vertical:5,
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
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    // color: const Color(0xFFF5E8C8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    'assets/NEST.png', // your asset path
                    fit: BoxFit.fill,
                    width: 20,
                    height: 20,
                  ),
                ),
                const SizedBox(width:6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Nest Balance",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8C8883),

                      ),
                    ),
                    Text(
                      '₹2,45,000',
                      style: TextStyle(
                        fontSize: 20,
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
          height: 500,
          margin: const EdgeInsets.symmetric(horizontal: 0),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/Discoveryreveal.png',
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
                              const Color(0xFFFAF6F1).withOpacity(0.6),
                              Colors.transparent,
                            ],
                            stops: const [0.0, 0.45, 1.0],
                          ),
                        ),
                      ),

                      // ── TOP FADE ──
                      Positioned(
                        top: 0, left: 0, right: 0,
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xFFFAF6F1),          // ← match scaffold bg
                                const Color(0xFFFAF6F1).withOpacity(0.0),  // fully transparent
                              ],
                              stops: const [0.0, 1.0],
                            ),
                          ),
                        ),
                      ),

                      // ── TOP RIGHT CORNER FADE ──
                      Positioned(
                        top: 0, right: 0,
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                              center: Alignment.topRight,
                              radius: 1.0,
                              colors: [
                                const Color(0xFFFAF6F1),           // ← match scaffold bg
                                const Color(0xFFFAF6F1).withOpacity(0.1),
                                Colors.transparent,
                              ],
                              stops: const [0.0, 0.45, 1.0],
                            ),
                          ),
                        ),
                      ),

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
                                const Color(0xFFF8F3EE).withOpacity(0.7),
                                const Color(0xFFF8F3EE).withOpacity(0.7),
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
                                const Color(0xFFF8F3EE).withOpacity(0.8),
                                const Color(0xFFF8F3EE).withOpacity(0.3),
                                Colors.transparent,
                              ],
                              stops: const [0.0, 0.3, 0.6, 1.0],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildTopBar()
            ],
          ),
        ),
        // Text overlay on left
        Positioned(
          left: 20,
          top: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text('🌸', style: TextStyle(fontSize:50)),
                  SizedBox(width: 6),
                  Text(
                    'Japan',
                    style: TextStyle(
                      fontSize:50,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2A1A0A),
                      height: 1.1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Text(
                    'Cherry Blossom Season',
                    style: TextStyle(
                      fontSize:20,
                      color: Color(0xFFB8724A),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Arial',
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.circle, size: 10, color: Color(0xFFB8724A)),
                  SizedBox(width: 6),
                  Text(
                    'Mar – Apr',
                    style: TextStyle(
                      fontSize: 18,
                      color:Colors.black,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'A land where ancient traditions\nmeet timeless beauty.\nEvery moment feels like poetry.',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF6A5A4A),
                  height: 1.6,
                  fontFamily: 'Arial',
                ),
              ),
              const SizedBox(height: 20),
              // Row(
              //   children: [
              //     Container(
              //       width: 40,
              //       height: 40,
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         shape: BoxShape.circle,
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.black.withOpacity(0.06),
              //             blurRadius: 8,
              //             offset: const Offset(0, 2),
              //           ),
              //         ],
              //       ),
              //       child: Center(
              //         child: const
              //         Text('🌸', style: TextStyle(fontSize: 22)),
              //       ),
              //     ),
              //     const SizedBox(width: 16),
              //     const Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Text(
              //           'Best Time',
              //           style: TextStyle(
              //             fontSize: 13,
              //             fontWeight: FontWeight.w600,
              //             color: Color(0xFF5A4A3A),
              //           ),
              //         ),
              //         SizedBox(height: 6),
              //         Text(
              //           'Mar - Apr',
              //           style: TextStyle(
              //             fontSize: 13,
              //             fontWeight: FontWeight.w700,
              //             color: Color(0xFF5A4A3A),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 10),
              // Row(
              //   children: [
              //     Container(
              //       width: 40,
              //       height: 40,
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         shape: BoxShape.circle,
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.black.withOpacity(0.06),
              //             blurRadius: 8,
              //             offset: const Offset(0, 2),
              //           ),
              //         ],
              //       ),
              //       child: Center(
              //         child: const
              //         Text('🌸', style: TextStyle(fontSize: 22)),
              //       ),
              //     ),
              //     const SizedBox(width: 16),
              //     const Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Text(
              //           'Weather',
              //           style: TextStyle(
              //             fontSize: 13,
              //             fontWeight: FontWeight.w600,
              //             color: Color(0xFF5A4A3A),
              //           ),
              //         ),
              //         SizedBox(height: 6),
              //         Text(
              //           '10° - 20°C',
              //           style: TextStyle(
              //             fontSize: 13,
              //             fontWeight: FontWeight.w700,
              //             color: Color(0xFF5A4A3A),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 10),
              // Row(
              //   children: [
              //     Container(
              //       width: 40,
              //       height: 40,
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         shape: BoxShape.circle,
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.black.withOpacity(0.06),
              //             blurRadius: 8,
              //             offset: const Offset(0, 2),
              //           ),
              //         ],
              //       ),
              //       child: Center(
              //         child: const
              //         Text('🌸', style: TextStyle(fontSize: 22)),
              //       ),
              //     ),
              //     const SizedBox(width: 16),
              //     const Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Text(
              //           'Travel Suitability',
              //           style: TextStyle(
              //             fontSize: 13,
              //             fontWeight: FontWeight.w600,
              //             color: Color(0xFF5A4A3A),
              //           ),
              //         ),
              //         SizedBox(height: 6),
              //         Text(
              //           'Perfect',
              //           style: TextStyle(
              //             fontSize: 13,
              //             fontWeight: FontWeight.w700,
              //             color: Color(0xFF5A4A3A),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              // _buildInfoCards(),
              const SizedBox(height: 30),
              // Center(
              //   child: Material(
              //     color: Colors.transparent,
              //     child: InkWell(
              //       borderRadius: BorderRadius.circular(40),
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (_) => const JapanUniverseScreen(),
              //           ),
              //         );
              //       },
              //       child: Container(
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 24,
              //           vertical: 14,
              //         ),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(40),
              //           gradient: const LinearGradient(
              //             begin: Alignment.centerLeft,
              //             end: Alignment.centerRight,
              //             colors: [
              //               Color(0xFF2A1A0E),
              //               Color(0xFF4A2E1A),
              //             ],
              //           ),
              //         ),
              //         child: const Row(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             Text(
              //               'Explore',
              //               style: TextStyle(
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.w600,
              //                 color: Colors.white,
              //               ),
              //             ),
              //             SizedBox(width: 8),
              //             Icon(
              //               Icons.arrow_forward,
              //               color: Colors.white,
              //               size: 18,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 70, // Adjust this value as needed
          child: Align(
            alignment: Alignment.center,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(40),
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (_) => const JapanUniverseScreen(),
                //     ),
                //   );
                // },
                child:
                // Container(
                //   width: 170,
                //   height: 52,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(40),
                //     gradient: const LinearGradient(
                //       colors: [
                //         Color(0xFF2A1A0E),
                //         Color(0xFF4A2E1A),
                //       ],
                //     ),
                //   ),
                //   child: const Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         "Explore",
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 16,
                //           fontWeight: FontWeight.w600,
                //         ),
                //       ),
                //       SizedBox(width: 8),
                //       Icon(
                //         Icons.arrow_forward,
                //         color: Colors.white,
                //         size: 18,
                //       ),
                //     ],
                //   ),
                // ),
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
                      const Text(
                        "Explore Japan",
                        style: TextStyle(
                          fontSize:20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFA88535),
                          letterSpacing: 0.3,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward,color: Color(0xFFA88535), size:25),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }


  Widget _categoryCard(String title, String subtitle, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategoryIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selectedCategoryIndex == index
              ? const Color(0xFFB8956A)
              : Colors.white,
          border: Border.all(
            color: const Color(0xFFE8E4E0),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              index == 0
                  ? Icons.school
                  : index == 1
                  ? Icons.business
                  : Icons.favorite,
              color: selectedCategoryIndex == index
                  ? Colors.white
                  : const Color(0xFFB8956A),
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: selectedCategoryIndex == index
                    ? Colors.white
                    : const Color(0xFF8B7355),
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                color: selectedCategoryIndex == index
                    ? Colors.white70
                    : const Color(0xFF999999),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _flockCard(BuildContext context, FlockModel flock) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FlockDetailsScreen(flock: flock),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE8E4E0), width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFFE8D7C3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  flock.title.substring(0, 1),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB8956A),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    flock.title,
                    style: const TextStyle(
                      color: Color(0xFF8B7355),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    flock.route,
                    style: const TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          size: 12, color: Color(0xFFD4AF37)),
                      const SizedBox(width: 4),
                      Text(
                        flock.date,
                        style: const TextStyle(
                          color: Color(0xFFD4AF37),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.people,
                          size: 12, color: Color(0xFFD4AF37)),
                      const SizedBox(width: 4),
                      Text(
                        '${flock.members} members',
                        style: const TextStyle(
                          color: Color(0xFFD4AF37),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: flock.progress / 100,
                      backgroundColor: const Color(0xFFE8D7C3),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFFD4AF37),
                      ),
                      minHeight: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${flock.progress}%',
                  style: const TextStyle(
                    color: Color(0xFFD4AF37),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  flock.status,
                  style: const TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FlockDetailsScreen extends StatelessWidget {
  final FlockModel flock;

  const FlockDetailsScreen({Key? key, required this.flock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF8B7355)),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'FLOCKS',
          style: TextStyle(
            color: Color(0xFF8B7355),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Flock Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE8E4E0), width: 1),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8D7C3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          flock.title.substring(0, 1),
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB8956A),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            flock.title,
                            style: const TextStyle(
                              color: Color(0xFF8B7355),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            flock.route,
                            style: const TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today,
                                  size: 12, color: Color(0xFFD4AF37)),
                              const SizedBox(width: 4),
                              Text(
                                flock.date,
                                style: const TextStyle(
                                  color: Color(0xFFD4AF37),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: flock.progress / 100,
                              backgroundColor: const Color(0xFFE8D7C3),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFFD4AF37),
                              ),
                              minHeight: 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Flock Tools Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Flock Tools',
                    style: TextStyle(
                      color: Color(0xFF8B7355),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: [
                      _toolCard('Shared\nItinerary', Icons.map,
                          const Color(0xFFE8A76A)),
                      _toolCard('Polls', Icons.poll, const Color(0xFF6B9FDB)),
                      _toolCard('Payments', Icons.payment,
                          const Color(0xFF6DD5A8)),
                      _toolCard('Documents', Icons.description,
                          const Color(0xFFC4A4E8)),
                      _toolCard('Photo\nMemories', Icons.photo,
                          const Color(0xFFF0A4D4)),
                      _toolCard('Chat', Icons.chat, const Color(0xFFD4A76A)),
                    ],
                  ),
                ],
              ),
            ),
            // Quote Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8D7C3),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFD4C4B0), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '"A flock goes farther when everyone flies together."',
                      style: TextStyle(
                        color: Color(0xFF8B7355),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Audubon birds illustration',
                        style: TextStyle(
                          color: const Color(0xFF8B7355).withOpacity(0.6),
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB8956A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text(
                        'Learn More',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Upcoming Departures
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Upcoming Departures',
                    style: TextStyle(
                      color: Color(0xFF8B7355),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'See all >',
                      style: TextStyle(
                        color: Color(0xFFD4AF37),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _departureCard('Kyoto Cherry\nBlossom', 'Mar 15, 2026', '87'),
            _departureCard('Himalayan\nCircuit', 'Dec 20, 2025', '12'),
            _departureCard('Santorini\nEscape', 'Jun 5, 2026', '168'),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _toolCard(String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8E4E0), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF8B7355),
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _departureCard(String title, String date, String days) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8E4E0), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFE8D7C3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                title.substring(0, 1),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB8956A),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF8B7355),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Text(
            days,
            style: const TextStyle(
              color: Color(0xFFD4AF37),
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 4),
          const Text(
            'days',
            style: TextStyle(
              color: Color(0xFFD4AF37),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class FlockModel {
  final String id;
  final String title;
  final String route;
  final String date;
  final int members;
  final int progress;
  final String status;
  final String imageUrl;

  FlockModel({
    required this.id,
    required this.title,
    required this.route,
    required this.date,
    required this.members,
    required this.progress,
    required this.status,
    required this.imageUrl,
  });
}