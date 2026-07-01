import 'package:flutter/material.dart';

import 'japan_universe_screen.dart';

class JapanDiscoveryScreen extends StatefulWidget {
  const JapanDiscoveryScreen({super.key});

  @override
  State<JapanDiscoveryScreen> createState() => _JapanDiscoveryScreenState();
}

class _JapanDiscoveryScreenState extends State<JapanDiscoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _buildTopBar(),
              const SizedBox(height: 20),
              _buildHeroSection(),
              // _buildInfoCards(),
              _buildWhySpecialSection(),
              _buildDotIndicator(),
              const SizedBox(height: 20),
              // _buildExploreButton(),
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
            height: 750,
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
                _buildInfoCards(),
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const JapanUniverseScreen(),
                      ),
                    );
                  },
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

      //     Positioned(
      //       right: 0,
      //       left: 0,
      //       bottom: 90,
      //       child: Material(
      //         color: Colors.transparent,
      //         child: InkWell(
      //           borderRadius: BorderRadius.circular(40),
      //           onTap: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (_) => const JapanUniverseScreen(),
      //               ),
      //             );
      //           },
      //           child: Container(
      //             padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      //             decoration: BoxDecoration(
      //               color: const Color(0xFFE85D75),
      //               borderRadius: BorderRadius.circular(40),
      // gradient: const LinearGradient(
      //           begin: Alignment.centerLeft,
      //           end: Alignment.centerRight,
      //           colors: [
      //             Color(0xFF2A1A0E),
      //             Color(0xFF4A2E1A),
      //           ],
      //         ),
      //             ),
      //             child: Row(
      //               mainAxisSize: MainAxisSize.min,
      //               children: const [
      //                 Text(
      //                   'Explore',
      //                   style: TextStyle(
      //                     fontSize: 16,
      //                     fontWeight: FontWeight.w600,
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //                 SizedBox(width: 8),
      //                 Icon(Icons.arrow_forward, color: Colors.white, size: 18),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),


          // Action icons top right
          // Positioned(
          //   right: 16,
          //   top: 8,
          //   child: Column(
          //     children: [
          //       _actionIcon(Icons.ios_share_outlined),
          //       const SizedBox(height: 10),
          //       _actionIcon(Icons.favorite_border),
          //     ],
          //   ),
          // ),
        ],
      );
    }

  Widget _actionIcon(IconData icon) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, size: 16, color: const Color(0xFF5A4A3A)),
    );
  }

  Widget _buildInfoCards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _infoRow(Icons.calendar_today_outlined, 'Best Time', 'Mar – Apr'),
        const SizedBox(height:20),
        _infoRow(Icons.wb_sunny_outlined, 'Weather', '10° – 20°C'),
        const SizedBox(height: 20),
        _infoRow(
            Icons.bar_chart_outlined, 'Travel Suitability', 'Perfect ●'),
      ],
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          width: 62,
          height: 62,
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
          child: Icon(icon, size:30, color: const Color(0xFFB8956A)),
        ),
        const SizedBox(width:10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF6A5A4A),
                fontFamily: 'Arial',
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6A5A4A),
                fontFamily: 'Arial',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWhySpecialSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Why it's special",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 50,
            child: Divider(
              thickness:5,
              color: Color(0xFFC2AF96),
              height: 1,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: specialItems.length,
              itemBuilder: (context, index) {
                final item = specialItems[index];

                return Container(
                  width:200,
                  margin: const EdgeInsets.only(right: 12),
                  child: _specialCard(
                    item['icon'],
                    item['title'],
                    item['desc'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _specialCard(
      IconData icon,
      String title,
      String desc,
      ) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(18),
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
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Circle
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFF8F3EE),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 8,
                ),
                BoxShadow(
                  color: Color(0xFFE5DDD3),
                  offset: Offset(4, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 30,
              color: const Color(0xFFC6A15B),
            ),
          ),

          const SizedBox(height: 24),

          Text(
            title,
            maxLines: 1,
            textAlign: TextAlign.center,

            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2A1A0A),
            ),
          ),

          const SizedBox(height: 14),

          Expanded(
            child: Text(
              desc,
              maxLines: 4,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                height: 1.6,
                color: Color(0xFF7F7367),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF8F3EE),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 8,
                  ),
                  BoxShadow(
                    color: Color(0xFFE5DDD3),
                    offset: Offset(4, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Color(0xFFC6A15B),
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildDotIndicator() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _dot(true),
          const SizedBox(width: 6),
          _dot(false),
          const SizedBox(width: 6),
          _dot(false),
        ],
      ),
    );
  }

  Widget _dot(bool active) {
    return Container(
      width: active ? 16 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: active ? const Color(0xFFB8724A) : const Color(0xFFD8C8B8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  // Widget _buildExploreButton() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20),
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20),
  //         gradient: const LinearGradient(
  //           begin: Alignment.centerLeft,
  //           end: Alignment.centerRight,
  //           colors: [
  //             Color(0xFF2A1A0E),
  //             Color(0xFF4A2E1A),
  //           ],
  //         ),
  //         boxShadow: [
  //           BoxShadow(
  //             color: const Color(0xFF2A1A0E).withOpacity(0.35),
  //             blurRadius: 20,
  //             offset: const Offset(0, 8),
  //           ),
  //         ],
  //       ),
  //       child: Row(
  //         children: [
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: const [
  //                 Text(
  //                   'Explore Japan',
  //                   style: TextStyle(
  //                     fontSize:20,
  //                     fontWeight: FontWeight.w700,
  //                     color: Color(0xFFB68B2D),
  //                   ),
  //                 ),
  //                 SizedBox(height: 2),
  //                 Text(
  //                   'Discover places, experiences and more',
  //                   style: TextStyle(
  //                     fontSize:18,
  //                     color: Color(0xFFB8A898),
  //                     fontFamily: 'Arial',
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Material(
  //             color: Colors.transparent,
  //             child: InkWell(
  //               borderRadius: BorderRadius.circular(12),
  //               onTap: () {
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (_) => const JapanUniverseScreen(),
  //                   ),
  //                 );
  //               },
  //               child: Container(
  //                 width: 50,
  //                 height: 50,
  //                 decoration: BoxDecoration(
  //                   color: const Color(0xFFB8956A),
  //                   // borderRadius: BorderRadius.circular(12),
  //                   shape: BoxShape.circle
  //                 ),
  //                 child: const Icon(
  //                   Icons.arrow_forward,
  //                   color: Colors.white,
  //                   size: 30,
  //                 ),
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}


final List<Map<String, dynamic>> specialItems = [
  {
    'icon': Icons.temple_buddhist_outlined,
    'title': 'Rich Heritage',
    'desc':
    'Thousands of years of culture, temples and timeless traditions.',
  },
  {
    'icon': Icons.local_florist_outlined,
    'title': 'Breathtaking Beauty',
    'desc':
    'From cherry blossoms to snow-capped mountains.',
  },
  {
    'icon': Icons.ramen_dining_outlined,
    'title': 'Exquisite Cuisine',
    'desc':
    'A celebration of flavors, technique and hospitality.',
  },
  {
    'icon': Icons.favorite_outline,
    'title': 'Warm Hospitality',
    'desc':
    'Experience the kindness and grace of Japan.',
  },
];