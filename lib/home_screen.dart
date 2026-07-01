// import 'package:flutter/material.dart';
// import 'package:glassmorphism/glassmorphism.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:travelagency/models/destination_model.dart';
// import 'package:travelagency/providers/home_provider.dart';
// import 'package:travelagency/spline_screen.dart';
//
//   class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F0EA),
//       extendBodyBehindAppBar: true, // ✅ body goes behind appbar (full screen)
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFF5F0EA).withOpacity(0.95), // ✅ slight transparency
//         elevation: 0,
//         scrolledUnderElevation: 0,
//         toolbarHeight: 120,
//         leadingWidth: 150,
//
//         leading: Align(
//           alignment: Alignment.center,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: const NestBalanceWidget(),
//           ),
//         ),
//
//         title: const GoldenSparrowWidget(),
//         centerTitle: true,
//
//         actions: [
//           Align(
//             alignment: Alignment.center,
//             child: Padding(
//               padding: const EdgeInsets.only(right: 10),
//               child: SearchWidget(
//                 onTap: () {
//                   debugPrint("Search Clicked");
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Consumer<HomeProvider>(
//         builder: (BuildContext context, homeManage, child) {
//           return SizedBox(
//             child: Stack(
//               children: [
//                 // ✅ SplineScreen fills entire screen including behind appbar
//                 // const Positioned.fill(
//                 //   child: SplineScreen(),
//                 // ),
//
//                 Positioned(
//                   top: MediaQuery.of(context).size.height * 0.15, // AppBar க்கு கீழே
//                   left: 0,
//                   right: 0,
//                   bottom: 0,
//                   child: SplineScreen(),
//                 ),
//
//                 Positioned(
//                   right: 16,
//                   top: MediaQuery.of(context).size.height * 0.18, // AppBar க்கு கீழே
//                   child: Row(
//                     children: [
//                       buildMenuIcon('assets/LOCATION.png'),
//                       const SizedBox(width:10),
//                       buildMenuIcon('assets/face.png'),
//                       const SizedBox(width:10),
//                       buildMenuIcon('assets/mountain.png'),
//                       const SizedBox(width:10),
//                       buildMenuIcon('assets/FILE.png'),
//                       const SizedBox(width:10),
//                       buildMenuIcon('assets/CALANDER.png'),
//                     ],
//                   ),
//                 ),
//
//                 // Discovery Card
//                 if (homeManage.destinationRes.id != null)
//                 Positioned(
//                   bottom: 90,
//                   left: 16,   // ✅ left margin
//                   right: 16,  // ✅ right margin
//                   child: buildDiscoveryCard(homeManage.destinationRes),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// // class _HomeScreenState extends State<HomeScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF5F0EA),
// //       appBar:
// //       AppBar(
// //         backgroundColor: const Color(0xFFF5F0EA),
// //         elevation: 0,
// //         scrolledUnderElevation: 0,
// //         toolbarHeight: 100, // ✅ increased to match design
// //         leadingWidth: 155,
// //
// //         // Nest Balance — Left
// //         leading: Align(
// //           alignment: Alignment.center,
// //           child: Padding(
// //             padding: const EdgeInsets.only(left:10),
// //             child: const NestBalanceWidget(),
// //           ),
// //         ),
// //
// //         // Golden Sparrow — Center
// //         title: const GoldenSparrowWidget(),
// //         centerTitle: true,
// //
// //         // Search — Right
// //         actions: [
// //           Align(
// //             alignment: Alignment.center,
// //             child: Padding(
// //               padding: const EdgeInsets.only(right: 10),
// //               child: SearchWidget(
// //                 onTap: () {
// //                   debugPrint("Search Clicked");
// //                 },
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),      body: Consumer<HomeProvider>(
// //         builder: (BuildContext context, homeManage, child) {
// //           return SizedBox(
// //             width: double.infinity,  // ✅ full width
// //             height: double.infinity, // ✅ full height
// //             child: Stack(
// //               children: [
// //                 const SplineScreen(),
// //                 // if (homeManage.destinationRes.id != null)
// //                 //   Positioned(
// //                 //     bottom: 140,
// //                 //     right: 20,
// //                 //     child: buildDiscoveryCard(homeManage.destinationRes),
// //                 //   ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //
// //     //   Scaffold(
// //     //     backgroundColor: const Color(0xFFF5F0EA),
// //     //       body: Consumer<HomeProvider>(
// //     //         builder: (BuildContext context, homeManage, child) {
// //     //           print(
// //     //               "Provider Country => ${homeManage.destinationRes.country}"
// //     //           );
// //     //           return Column(
// //     //             children: [
// //     //               Row(
// //     //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //     //                 children: [
// //     //                   // Nest Balance Section
// //     //                   Padding(
// //     //                     padding: const EdgeInsets.fromLTRB(10, 60, 0, 0),
// //     //                     child: const NestBalanceWidget(),
// //     //                   ),
// //     //
// //     //                   // Golden Sparrow Section
// //     //                   Padding(
// //     //                       padding: const EdgeInsets.fromLTRB(0, 40, 30, 0),
// //     //                       child: const GoldenSparrowWidget()),
// //     //
// //     //                   // Search Section
// //     //                   Padding(
// //     //                     padding: const EdgeInsets.fromLTRB(0, 60, 10, 0),
// //     //                     child: SearchWidget(
// //     //                       onTap: () {
// //     //                         debugPrint("Search Clicked");
// //     //                       },
// //     //                     ),
// //     //                   ),
// //     //                 ],
// //     //               ),
// //     //               Expanded(
// //     //                 child:
// //     //                 // Stack(
// //     //                 //   children: [
// //     //                 //
// //     //                 //     // Globe
// //     //                 //     // Positioned(
// //     //                 //     //   top: 20,
// //     //                 //     //   left: 0,
// //     //                 //     //   right: 50,
// //     //                 //     //   child: Image.asset(
// //     //                 //     //     'assets/global.png',
// //     //                 //     //     height: 500,
// //     //                 //     //     fit: BoxFit.contain,
// //     //                 //     //   ),
// //     //                 //     // ),
// //     //                 //     //
// //     //                 //     Positioned(
// //     //                 //       top: 20,
// //     //                 //       left: 0,
// //     //                 //       right: 0,
// //     //                 //       child: SizedBox(
// //     //                 //         height: 650,
// //     //                 //         width: MediaQuery.of(context).size.width,
// //     //                 //         child: const SplineScreen(),
// //     //                 //       ),
// //     //                 //     ),
// //     //                 //     Positioned(
// //     //                 //       right: 20,
// //     //                 //       top: 85,
// //     //                 //       child: Column(
// //     //                 //         children: [
// //     //                 //           buildMenuIcon('assets/LOCATION.png'),
// //     //                 //           // _buildIcon(Icons.location_on_outlined),
// //     //                 //
// //     //                 //           const SizedBox(height: 16),
// //     //                 //
// //     //                 //           buildMenuIcon('assets/face.png'),
// //     //                 //           // _buildIcon(Icons.security_outlined),
// //     //                 //           const SizedBox(height: 16),
// //     //                 //
// //     //                 //           buildMenuIcon('assets/mountain.png'),
// //     //                 //           // _buildIcon(Icons.landscape_outlined),
// //     //                 //           const SizedBox(height: 16),
// //     //                 //
// //     //                 //           buildMenuIcon('assets/FILE.png'),
// //     //                 //           // _buildIcon(Icons.landscape_outlined),
// //     //                 //           const SizedBox(height: 16),
// //     //                 //           // _buildIcon(Icons.calendar_month_outlined),
// //     //                 //           buildMenuIcon('assets/CALANDER.png'),
// //     //                 //         ],
// //     //                 //       ),
// //     //                 //     ),
// //     //                 //     // Bottom Center Text
// //     //                 //     Positioned(
// //     //                 //       bottom: 100,
// //     //                 //       left: 0,
// //     //                 //       right: 0,
// //     //                 //       child: Column(
// //     //                 //         children: const [
// //     //                 //           Text(
// //     //                 //             "Something wonderful is here.",
// //     //                 //             style: TextStyle(
// //     //                 //               fontFamily: "PlayfairDisplay",
// //     //                 //               fontSize: 26,
// //     //                 //               fontWeight: FontWeight.w500,
// //     //                 //             ),
// //     //                 //           ),
// //     //                 //           SizedBox(height: 10),
// //     //                 //           Text(
// //     //                 //             "Tap the glow to discover",
// //     //                 //             style: TextStyle(
// //     //                 //               fontFamily: "Lora",
// //     //                 //               fontSize: 16,
// //     //                 //               fontWeight: FontWeight.w400,
// //     //                 //               color: Color(0xFFB68B2D),
// //     //                 //               letterSpacing: 0.5,
// //     //                 //             ),
// //     //                 //           )                      ],
// //     //                 //       ),
// //     //                 //     ),
// //     //                 //     // Discovery Card
// //     //                 //     // Positioned(
// //     //                 //     //   bottom: 190,
// //     //                 //     //   right: 20,
// //     //                 //     //   child: buildDiscoveryCard(),
// //     //                 //     // ),
// //     //                 //     if (homeManage.destinationRes.id != null)
// //     //                 //       // Positioned(
// //     //                 //       //   bottom: 190,
// //     //                 //       //   right: 20,
// //     //                 //       //   child: buildDiscoveryCard(
// //     //                 //       //     homeManage.destinationRes,
// //     //                 //       //   ),
// //     //                 //       // ),
// //     //                 //       Positioned(
// //     //                 //         bottom: 50,
// //     //                 //         left: 20,
// //     //                 //         child: Material(
// //     //                 //           elevation: 10,
// //     //                 //           child: Container(
// //     //                 //             width: 200,
// //     //                 //             height: 100,
// //     //                 //             color: Colors.red,
// //     //                 //           ),
// //     //                 //         ),
// //     //                 //       ),
// //     //                 //   ],
// //     //                 // ),
// //     //
// //     //                 Stack(
// //     //                   children: [
// //     //
// //     //                     const SplineScreen(),
// //     //                      Positioned(
// //     //                         bottom: 140,
// //     //                         right: 20,
// //     //                         child: buildDiscoveryCard(
// //     //                           homeManage.destinationRes,
// //     //                         ),
// //     //                       ),
// //     //                   ],
// //     //                 )
// //     //               ),
// //     //             ],
// //     //           );
// //     //         },
// //     //       )
// //     // );
// //   }
// // }
// class NestBalanceWidget extends StatelessWidget {
//   const NestBalanceWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 8,
//         vertical: 6,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         color: const Color(0xFFF5F0EA),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.09),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min, // ✅ key fix — shrinks to content width
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/NEST.png',
//             width: 22,
//             height: 22,
//             fit: BoxFit.contain,
//           ),
//           const SizedBox(width: 6),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: const [
//               Text(
//                 "Nest Balance",
//                 style: TextStyle(
//                   fontSize: 11,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xFF8C8883),
//                 ),
//               ),
//               Text(
//                 '₹2,45,000',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFF2F2F2F),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(width: 2),
//           const Icon(
//             Icons.keyboard_arrow_down,
//             color: Color(0xFFB68B2D),
//             size: 20,
//           ),
//         ],
//       ),
//     );
//   }
// }
// class GoldenSparrowWidget extends StatelessWidget {
//   const GoldenSparrowWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Image.asset(
//           "assets/logo.png",
//           height: 40,
//         ),
//
//         // const Icon(
//         //   Icons.flutter_dash,
//         //   color: Color(0xffB8922A),
//         //   size: 28,
//         // ),
//         const SizedBox(height:10),
//         const Text(
//           "GOLDEN SPARROW",
//           style: TextStyle(
//             fontSize: 16,
//             letterSpacing: 3,
//             color: Color(0xFFB68B2D),
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         const SizedBox(height: 5),
//         const Text(
//           "EXPLORE. UNDERSTAND. JOURNEY",
//           style: TextStyle(
//             fontSize: 10,
//             letterSpacing: 1.5,
//             color: Color(0xFFB68B2D),
//           ),
//         ),
//       ],
//     );
//   }
// }
// class SearchWidget extends StatelessWidget {
//   final VoidCallback onTap;
//
//   const SearchWidget({
//     super.key,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(25),
//       child:
//       Container(
//         width: 50,
//         height: 50,
//         decoration: BoxDecoration(
//           color: const Color(0xFFF5F0EA),
//           shape: BoxShape.circle,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.09),
//               blurRadius: 20,
//               spreadRadius: 2,
//               offset: const Offset(0, 8),
//             ),
//           ],
//         ),
//         child: const Icon(
//           Icons.search,
//           color: Color(0xFFA39A90),
//           size: 30,
//         ),
//       ),
//     );
//   }
// }
// Widget buildMenuIcon(String imagePath) {
//   return Container(
//     width: 48,
//     height: 48,
//     decoration: BoxDecoration(
//       color: const Color(0xFFF5F0EA),
//       shape: BoxShape.circle,
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.1),
//           blurRadius: 20,
//           spreadRadius: 2,
//           offset: const Offset(0, 8),
//         ),
//       ],    ),
//     child: Center(
//       child: Image.asset(
//         imagePath,
//         width: 22,
//         height: 22,
//         fit: BoxFit.contain,
//       ),
//     ),
//   );
// }
// // Widget _buildIcon(IconData icon) {
// //   return Container(
// //     width: 48,
// //     height: 48,
// //     decoration: BoxDecoration(
// //       color: Colors.white,
// //       shape: BoxShape.circle,
// //       boxShadow: [
// //         BoxShadow(
// //           color: Colors.black.withOpacity(0.05),
// //           blurRadius: 8,
// //           offset: const Offset(0, 2),
// //         ),
// //       ],
// //     ),
// //     child: Icon(
// //       icon,
// //       size: 22,
// //       color: const Color(0xFF9A8261),
// //     ),
// //   );
// // }
//
//
// // Widget buildDiscoveryCard(Destination destinationRes) {
// //   return Container(
// //     width: 250,
// //     height: 290,
// //     decoration: BoxDecoration(
// //       color: Colors.white,
// //       borderRadius: BorderRadius.circular(28),
// //       boxShadow: [
// //         BoxShadow(
// //           color: Colors.black.withOpacity(0.08),
// //           blurRadius: 20,
// //           offset: const Offset(0, 8),
// //         ),
// //       ],
// //     ),
// //     child: Row(
// //       children: [
// //         // Left Content
// //         Expanded(
// //           flex: 5,
// //           child: Padding(
// //             padding: const EdgeInsets.fromLTRB(24, 24, 18, 24),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 const Text(
// //                   "NEW DISCOVERY",
// //                   style: TextStyle(
// //                     fontSize: 10,
// //                     letterSpacing: 1,
// //                     fontWeight: FontWeight.w600,
// //                     color: Color(0xFFB8922A),
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 15),
// //
// //                 Text(
// //                   destinationRes.country ?? "",
// //                   style: const TextStyle(
// //                     fontSize: 30,
// //                     height: 1,
// //                     fontFamily: "PlayfairDisplay", // optional
// //                     fontWeight: FontWeight.w500,
// //                     color: Color(0xFF222222),
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 12),
// //
// //                 Text(
// //                   destinationRes.seasonName ?? "",
// //                   style: const TextStyle(
// //                     fontSize: 10,
// //                     color: Color(0xFF555555),
// //                     fontWeight: FontWeight.w500,
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 5),
// //
// //                 Text(
// //                   destinationRes.travelMonths  ?? "",
// //                   style: const TextStyle(
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.w600,
// //                     color: Color(0xFF333333),
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 10),
// //
// //                 Container(
// //                   width: 24,
// //                   height: 1.5,
// //                   color: const Color(0xFFE5D6B2),
// //                 ),
// //
// //                 const SizedBox(height: 10),
// //
// //                  Text(
// //                    destinationRes.description  ?? "",
// //                   maxLines: 1,
// //                   overflow: TextOverflow.ellipsis,
// //                   style: TextStyle(
// //                     fontSize: 10,
// //                     color: Color(0xFF777777),
// //                   ),
// //                 ),
// //
// //                 // const SizedBox(height: 6),
// //                 //
// //                 // const Text(
// //                 //   "this destination",
// //                 //   maxLines: 1,
// //                 //   overflow: TextOverflow.ellipsis,
// //                 //   style: TextStyle(
// //                 //     fontSize:10,
// //                 //     color: Color(0xFF777777),
// //                 //   ),
// //                 // ),
// //
// //                 const Spacer(),
// //
// //                 Container(
// //                   width: 58,
// //                   height: 58,
// //                   decoration: const BoxDecoration(
// //                     shape: BoxShape.circle,
// //                     color: Color(0xFFB8922A),
// //                   ),
// //                   child: const Icon(
// //                     Icons.arrow_forward_rounded,
// //                     color: Colors.white,
// //                     size: 30,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //
// //         // Right Image
// //         Expanded(
// //           flex: 4,
// //           child: ClipRRect(
// //             borderRadius: const BorderRadius.only(
// //               topRight: Radius.circular(28),
// //               bottomRight: Radius.circular(28),
// //             ),
// //             child: Image.asset(
// //               "assets/discoveryimg.png",
// //               fit: BoxFit.cover,
// //               height: double.infinity,
// //             ),
// //           ),
// //         ),
// //       ],
// //     ),
// //   );
// // }
//
//
// Widget buildDiscoveryCard(Destination destinationRes) {
//   return Stack(
//     children:[
//     Container(
//       height:180,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(28),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 20,
//             offset: const Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // ✅ Main Content Row
//           Expanded(
//             child: Row(
//               children: [
//                 // ✅ Left Image
//                 ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     bottomLeft: Radius.circular(20),
//                   ),
//                   child:
//                   Image.network(
//                     destinationRes.heroImage ?? "",
//                     width: 180,
//                     height: 150,
//                     fit: BoxFit.cover,
//                     // ✅ Loading indicator
//                     loadingBuilder: (context, child, loadingProgress) {
//                       if (loadingProgress == null) return child;
//                       return Container(
//                         width: 100,
//                         height: 200,
//                         color: const Color(0xFF2A2A3E),
//                         child: const Center(
//                           child: CircularProgressIndicator(
//                             color: Color(0xFFB8922A),
//                             strokeWidth: 2,
//                           ),
//                         ),
//                       );
//                     },
//                     // ✅ Error fallback
//                     errorBuilder: (context, error, stackTrace) {
//                       return Container(
//                         width: 100,
//                         color: const Color(0xFF2A2A3E),
//                         child: const Icon(
//                           Icons.image_not_supported,
//                           color: Color(0xFFB8922A),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//
//                 const SizedBox(width: 14),
//
//                 // ✅ Right Content
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // ✅ NEW DISCOVERY Badge
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 10,
//                             vertical: 4,
//                           ),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: const Color(0xFFB8922A),
//                               width: 1,
//                             ),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: const Text(
//                             "NEW DISCOVERY",
//                             style: TextStyle(
//                               fontSize:14,
//                               letterSpacing: 1,
//                               fontWeight: FontWeight.w700,
//                               color: Color(0xFFB8922A),
//                             ),
//                           ),
//                         ),
//
//                         const SizedBox(height: 8),
//
//                         // ✅ Country Name
//                         Text(
//                           destinationRes.country ?? "",
//                           style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                             fontFamily: "PlayfairDisplay",
//                             height: 1,
//                           ),
//                         ),
//
//                         const SizedBox(height: 4),
//
//                         // ✅ Season Name
//                         Text(
//                           destinationRes.seasonName ?? "",
//                           style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//
//                         const SizedBox(height: 6),
//
//                         // ✅ Travel Months with dot
//                         Row(
//                           children: [
//                             Container(
//                               width: 8,
//                               height: 8,
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Color(0xFFB8922A),
//                               ),
//                             ),
//                             const SizedBox(width: 6),
//                             Text(
//                               destinationRes.travelMonths ?? "",
//                               style: const TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//
//                         // const SizedBox(height: 1), // ✅ top position adjust — 4, 8, 12 try பண்ணுங்க
//                         // Padding(
//                         //   padding: const EdgeInsets.only(bottom:30), // ✅ adjust this value
//                         //   child: Align(
//                         //     alignment: Alignment.centerRight, // ✅ right side
//                         //     child:
//                         //     Container(
//                         //       width: 48,
//                         //       height: 48,
//                         //       decoration: const BoxDecoration(
//                         //         shape: BoxShape.circle,
//                         //         color: Color(0xFFB8922A),
//                         //       ),
//                         //       child: const Icon(
//                         //         Icons.arrow_forward_rounded,
//                         //         color: Colors.white,
//                         //         size: 24,
//                         //       ),
//                         //     ),
//                         //   ),
//                         // ),
//
//                         // ✅ Explore Button
//                         // Container(
//                         //   padding: const EdgeInsets.symmetric(
//                         //     horizontal: 16,
//                         //     vertical: 7,
//                         //   ),
//                         //   decoration: BoxDecoration(
//                         //     border: Border.all(
//                         //       color: const Color(0xFFB8922A),
//                         //       width: 1.5,
//                         //     ),
//                         //     borderRadius: BorderRadius.circular(20),
//                         //   ),
//                         //   child: Row(
//                         //     mainAxisSize: MainAxisSize.min,
//                         //     children: const [
//                         //       Text(
//                         //         "Explore",
//                         //         style: TextStyle(
//                         //           fontSize: 15,
//                         //           fontWeight: FontWeight.w600,
//                         //           color: Color(0xFFB8922A),
//                         //         ),
//                         //       ),
//                         //       SizedBox(width: 6),
//                         //       Icon(
//                         //         Icons.arrow_forward,
//                         //         color: Color(0xFFB8922A),
//                         //         size: 14,
//                         //       ),
//                         //     ],
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // ✅ Bottom Bar
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//             decoration: const BoxDecoration(
//               border: Border(
//                 top: BorderSide(
//                   color: Color(0xFF2A2A3E),
//                   width: 1,
//                 ),
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // ✅ Description text
//                 Expanded(
//                   child: Text(
//                     destinationRes.description ?? "",
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontSize: 13,
//                       color: Color(0xFF888888),
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                 ),
//
//                 // ✅ Dots indicator
//                 Row(
//                   children: [
//                     Container(
//                       width: 16,
//                       height: 3,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFB8922A),
//                         borderRadius: BorderRadius.circular(2),
//                       ),
//                     ),
//                     const SizedBox(width: 4),
//                     Container(
//                       width: 6,
//                       height: 3,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF444444),
//                         borderRadius: BorderRadius.circular(2),
//                       ),
//                     ),
//                     const SizedBox(width: 4),
//                     Container(
//                       width: 6,
//                       height: 3,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF444444),
//                         borderRadius: BorderRadius.circular(2),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//       Positioned(
//         bottom: 50,
//         right:20,  // ✅ right margin
//         child: Container(
//           width: 48,
//           height: 48,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Color(0xFFB8922A),
//           ),
//           child: const Icon(
//             Icons.arrow_forward_rounded,
//             color: Colors.white,
//             size: 24,
//           ),
//         ),
//       ),
//   ]
//   );
// }
//
//
//



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelagency/models/destination_model.dart';
import 'package:travelagency/providers/home_provider.dart';
import 'package:travelagency/spline_screen.dart';

import 'japan_discovery_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: const Color(0xFFF5F0EA),
  //     // extendBodyBehindAppBar: true,
  //     // appBar: AppBar(
  //     //   backgroundColor: const Color(0xFFF5F0EA).withOpacity(0.95),
  //     //   elevation: 0,
  //     //   scrolledUnderElevation: 0,
  //     //   toolbarHeight: 50,
  //     //   leadingWidth: 150,
  //     //   leading: Align(
  //     //     alignment: Alignment.center,
  //     //     child: const NestBalanceWidget(),
  //     //   ),
  //     //   // title: const GoldenSparrowWidget(),
  //     //   centerTitle: true,
  //     //   // actions: [
  //     //   //   Align(
  //     //   //     alignment: Alignment.center,
  //     //   //     child: Padding(
  //     //   //       padding: const EdgeInsets.only(right: 10),
  //     //   //       child: SearchWidget(onTap: () => debugPrint("Search Clicked")),
  //     //   //     ),
  //     //   //   ),
  //     //   // ],
  //     // ),
  //     body: Consumer<HomeProvider>(
  //       builder: (BuildContext context, HomeProvider homeManage, _) {
  //         return SizedBox(
  //           child: Stack(
  //             children: [
  //
  //               // ── Globe / Spline WebView ─────────────────────────────────
  //               Positioned(
  //                 top: MediaQuery.of(context).size.height * 0.10,
  //                 left: 0,
  //                 right: 0,
  //                 bottom: 0,
  //                 child: const SplineScreen(),
  //               ),
  //
  //               // ── Right-side menu icons ──────────────────────────────────
  //               Positioned(
  //                 left: 0,
  //                 right: 0,
  //                 top: MediaQuery.of(context).size.height * 0.13,
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     buildMenuIcon('assets/LOCATION.png'),
  //                     const SizedBox(width: 10),
  //                     buildMenuIcon('assets/face.png'),
  //                     const SizedBox(width: 10),
  //                     buildMenuIcon('assets/mountain.png'),
  //                     const SizedBox(width: 10),
  //                     buildMenuIcon('assets/FILE.png'),
  //                     const SizedBox(width: 10),
  //                     buildMenuIcon('assets/CALANDER.png'),
  //                   ],
  //                 ),
  //               ),
  //               // ── Bottom card area ───────────────────────────────────────
  //               // Renders one of three states: skeleton, error, or real card.
  //               // Nothing is shown when no destination has been selected yet.
  //               // ── Bottom card area ───────────────────────────────────────
  //               Positioned(
  //                 bottom: 20,
  //                 right: 16,
  //                 width: 320,
  //                 child: _buildBottomCard(homeManage),
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0EA),
      body: Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider homeManage, _) {
          return SizedBox.expand( // ✅ fixed — was SizedBox() with no size
            child: Stack(
              children: [
                // ── Globe / Spline WebView ─────────────────────────────────
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.06,
                  left: 0,
                  right: 0,
                  bottom: 0,
                    child: const SplineScreen(),
                ),

                // ── Top bar: Nest Balance (left) + Golden Sparrow (right) ──
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        GoldenSparrowWidget(),
                        NestBalanceWidget(),
                      ],
                    ),
                  ),
                ),

                // ── Right-side menu icons ──────────────────────────────────
                Positioned(
                  left: 0,
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildMenuIcon('assets/LOCATION.png'),
                      const SizedBox(width: 10),
                      buildMenuIcon('assets/face.png'),
                      const SizedBox(width: 10),
                      buildMenuIcon('assets/mountain.png'),
                      const SizedBox(width: 10),
                      buildMenuIcon('assets/FILE.png'),
                      const SizedBox(width: 10),
                      buildMenuIcon('assets/CALANDER.png'),
                    ],
                  ),
                ),

                // ── Bottom card area ───────────────────────────────────────
                Positioned(
                  bottom: 50,
                  right: 16,
                  width: 320,
                  child: _buildBottomCard(homeManage),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  /// Decides which widget to render in the card slot.
  Widget _buildBottomCard(HomeProvider homeManage) {
    // 1. Loading → skeleton
    if (homeManage.isLoading) {
      return const DiscoveryCardSkeleton();
    }

    // 2. Error → small dismissible banner
    if (homeManage.hasError) {
      return _buildErrorCard(homeManage);
    }

    // 3. Success → real discovery card
    if (homeManage.hasDestination) {
      return buildDiscoveryCard(context, homeManage.destinationRes);
    }

    // 4. Initial / cleared → nothing
    return const SizedBox.shrink();
  }

  Widget _buildErrorCard(HomeProvider homeManage) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.wifi_off_rounded, color: Color(0xFFB8922A)),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "Couldn't load destination. Tap a location to try again.",
              style: TextStyle(fontSize: 13, color: Color(0xFF666666)),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 18, color: Color(0xFF999999)),
            onPressed: homeManage.clearDestination,
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Skeleton Loader
// ═══════════════════════════════════════════════════════════════════════════════

class DiscoveryCardSkeleton extends StatefulWidget {
  const DiscoveryCardSkeleton({super.key});

  @override
  State<DiscoveryCardSkeleton> createState() => _DiscoveryCardSkeletonState();
}

class _DiscoveryCardSkeletonState extends State<DiscoveryCardSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _shimmer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _shimmer = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shimmer,
      builder: (_, __) {
        final color =
        Color.lerp(const Color(0xFFE8E0D5), const Color(0xFFF5F0EA), _shimmer.value)!;

        return Container(
          height: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              // Left image placeholder
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  bottomLeft: Radius.circular(28),
                ),
                child: Container(
                  width: 180,
                  color: color,
                ),
              ),

              // Right content placeholders
              Expanded(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Badge placeholder
                      _shimmerBox(width: 110, height: 24, color: color),
                      const SizedBox(height: 12),
                      // Country name placeholder
                      _shimmerBox(width: 90, height: 20, color: color),
                      const SizedBox(height: 10),
                      // Season placeholder
                      _shimmerBox(width: 70, height: 14, color: color),
                      const SizedBox(height: 10),
                      // Travel months placeholder
                      _shimmerBox(width: 100, height: 14, color: color),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _shimmerBox(
      {required double width,
        required double height,
        required Color color}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// AppBar Widgets (unchanged)
// ═══════════════════════════════════════════════════════════════════════════════

// class NestBalanceWidget extends StatelessWidget {
//   const NestBalanceWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         color: const Color(0xFFF5F0EA),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.09),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset('assets/NEST.png',
//               width: 25, height: 25, fit: BoxFit.contain),
//           // const SizedBox(width: 6),
//           // Column(
//           //   crossAxisAlignment: CrossAxisAlignment.start,
//           //   mainAxisSize: MainAxisSize.min,
//           //   children: const [
//           //     Text(
//           //       "Nest Balance",
//           //       style: TextStyle(
//           //         fontSize: 11,
//           //         fontWeight: FontWeight.w500,
//           //         color: Color(0xFF8C8883),
//           //       ),
//           //     ),
//           //     Text(
//           //       '₹2,45,000',
//           //       style: TextStyle(
//           //         fontSize: 14,
//           //         fontWeight: FontWeight.w600,
//           //         color: Color(0xFF2F2F2F),
//           //       ),
//           //     ),
//           //   ],
//           // ),
//           const SizedBox(width: 2),
//           const Icon(Icons.keyboard_arrow_down,
//               color: Color(0xFFB68B2D), size: 20),
//         ],
//       ),
//     );
//   }
// }

class NestBalanceWidget extends StatefulWidget {
  const NestBalanceWidget({super.key});

  @override
  State<NestBalanceWidget> createState() => _NestBalanceWidgetState();
}

class _NestBalanceWidgetState extends State<NestBalanceWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFFF5F0EA),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.09),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/NEST.png',
                width: 25, height: 25, fit: BoxFit.contain),

            // ── Expandable balance text ───────────────────────────────
            AnimatedSize(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              child: _isExpanded
                  ? Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Nest Balance",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8C8883),
                      ),
                    ),
                    Text(
                      '₹2,45,000',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2F2F2F),
                      ),
                    ),
                  ],
                ),
              )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(width: 2),

            // ── Arrow rotates when expanded ───────────────────────────
            AnimatedRotation(
              turns: _isExpanded ? 0.5 : 0.0,
              duration: const Duration(milliseconds: 250),
              child: const Icon(Icons.keyboard_arrow_down,
                  color: Color(0xFFB68B2D), size: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class GoldenSparrowWidget extends StatelessWidget {
  const GoldenSparrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/logo.png", height: 40),
        // const SizedBox(height: 10),
        // const Text(
        //   "GOLDEN SPARROW",
        //   style: TextStyle(
        //     fontSize: 16,
        //     letterSpacing: 3,
        //     color: Color(0xFFB68B2D),
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),
        // const SizedBox(height: 5),
        // const Text(
        //   "EXPLORE. UNDERSTAND. JOURNEY",
        //   style: TextStyle(
        //     fontSize: 10,
        //     letterSpacing: 1.5,
        //     color: Color(0xFFB68B2D),
        //   ),
        // ),
      ],
    );
  }
}

class SearchWidget extends StatelessWidget {
  final VoidCallback onTap;
  const SearchWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F0EA),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.09),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: const Icon(Icons.search, color: Color(0xFFA39A90), size: 30),
      ),
    );
  }
}

Widget buildMenuIcon(String imagePath) {
  return Container(
    width: 48,
    height: 48,
    decoration: BoxDecoration(
      color: const Color(0xFFF5F0EA),
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 20,
          spreadRadius: 2,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: Center(
      child: Image.asset(imagePath,
          width: 25, height: 25, fit: BoxFit.contain),
    ),
  );
}

// ═══════════════════════════════════════════════════════════════════════════════
// Discovery Card (unchanged from your original)
// ═══════════════════════════════════════════════════════════════════════════════

// Widget buildDiscoveryCard(BuildContext context, Destination destinationRes) {
//   return Stack(
//     children: [
//       Container(
//         height: 180,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(28),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.08),
//               blurRadius: 20,
//               offset: const Offset(0, 8),
//             ),
//           ],
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               child: Row(
//                 children: [
//                   // Left Image
//                   ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       bottomLeft: Radius.circular(20),
//                     ),
//                     child: Image.network(
//                       destinationRes.heroImage ?? "",
//                       width: 180,
//                       height: 150,
//                       fit: BoxFit.cover,
//                       loadingBuilder: (context, child, progress) {
//                         if (progress == null) return child;
//                         return Container(
//                           width: 180,
//                           color: const Color(0xFF2A2A3E),
//                           child: const Center(
//                             child: CircularProgressIndicator(
//                               color: Color(0xFFB8922A),
//                               strokeWidth: 2,
//                             ),
//                           ),
//                         );
//                       },
//                       errorBuilder: (context, error, stack) {
//                         return Container(
//                           width: 180,
//                           color: const Color(0xFF2A2A3E),
//                           child: const Icon(Icons.image_not_supported,
//                               color: Color(0xFFB8922A)),
//                         );
//                       },
//                     ),
//                   ),
//
//                   const SizedBox(width: 14),
//
//                   // Right Content
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 14, horizontal: 8),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 10, vertical: 4),
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: const Color(0xFFB8922A), width: 1),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: const Text(
//                               "NEW DISCOVERY",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 letterSpacing: 1,
//                                 fontWeight: FontWeight.w700,
//                                 color: Color(0xFFB8922A),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             destinationRes.country ?? "",
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: "PlayfairDisplay",
//                               height: 1,
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             destinationRes.seasonName ?? "",
//                             style: const TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           const SizedBox(height: 6),
//                           Row(
//                             children: [
//                               Container(
//                                 width: 8,
//                                 height: 8,
//                                 decoration: const BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Color(0xFFB8922A),
//                                 ),
//                               ),
//                               const SizedBox(width: 6),
//                               Text(
//                                 destinationRes.travelMonths ?? "",
//                                 style: const TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Bottom Bar
//             Container(
//               padding:
//               const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//               decoration: const BoxDecoration(
//                 border: Border(
//                   top: BorderSide(color: Color(0xFF2A2A3E), width: 1),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       destinationRes.description ?? "",
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 13,
//                         color: Color(0xFF888888),
//                         fontStyle: FontStyle.italic,
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       _dot(width: 16, color: const Color(0xFFB8922A)),
//                       const SizedBox(width: 4),
//                       _dot(width: 6, color: const Color(0xFF444444)),
//                       const SizedBox(width: 4),
//                       _dot(width: 6, color: const Color(0xFF444444)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//
//       // Floating arrow button
//       Positioned(
//         bottom: 50,
//         right: 20,
//         child: InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const JapanDiscoveryScreen(),
//               ),
//             );
//           },
//           child: Container(
//             width: 48,
//             height: 48,
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               color: Color(0xFFB8922A),
//             ),
//             child: const Icon(
//               Icons.arrow_forward_rounded,
//               color: Colors.white,
//               size: 24,
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }


Widget buildDiscoveryCard(BuildContext context, Destination destinationRes) {
  return Container(
    height: 300,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(28),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.10),
          blurRadius: 24,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: Stack(
      children: [
        Row(
          children: [
            // ── LEFT TEXT PANEL ───────────────────────────────────────────
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 22, 10, 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NEW DISCOVERY label
                    Text(
                      "NEW DISCOVERY",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize:13,
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFB8922A).withOpacity(0.9),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Country name — large serif
                    Text(
                      destinationRes.country ?? "",
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        fontFamily: "PlayfairDisplay",
                        color: Color(0xFF2A2A2A),
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Season name
                    Text(
                      destinationRes.seasonName ?? "",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF555555),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Travel months — bold
                    Text(
                      destinationRes.travelMonths ?? "",
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2A2A2A),
                      ),
                    ),

                    const Spacer(),

                    // Divider line
                    Container(
                      width: 28,
                      height: 4,
                      color: const Color(0xFFB8922A).withOpacity(0.9),
                    ),
                    const SizedBox(height: 10),

                    // Helper text
                    Text(
                      // destinationRes.description ??
                          "Your Nest can reach this destination",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF8A8A8A),
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height:8),

                    // Arrow button
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const JapanDiscoveryScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFB8922A),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── RIGHT IMAGE ────────────────────────────────────────────────
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
                child: Image.network(
                  destinationRes.heroImage ?? "",
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Container(
                      color: const Color(0xFFEDE6DA),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFB8922A),
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stack) {
                    return Container(
                      color: const Color(0xFFEDE6DA),
                      child: const Icon(Icons.image_not_supported,
                          color: Color(0xFFB8922A)),
                    );
                  },
                ),
              ),
            ),
          ],
        ),

        // ── SOFT FADE AT THE SEAM (white blends into photo) ───────────────
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: IgnorePointer(
            child: Row(
              children: [
                const Spacer(flex: 5),
                Container(
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
                const Spacer(flex: 5),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _dot({required double width, required Color color}) {
  return Container(
    width: width,
    height: 3,
    decoration:
    BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
  );
}