// import 'package:flutter/material.dart';
//
// class GoldenSparrowHeader extends StatefulWidget {
//   const GoldenSparrowHeader({super.key});
//
//   @override
//   State<GoldenSparrowHeader> createState() => _GoldenSparrowHeaderState();
// }
//
// class _GoldenSparrowHeaderState extends State<GoldenSparrowHeader> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: 12,
//       ),
//       color: const Color(0xFFF8F5F0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Nest Balance Section
//           const NestBalanceWidget(),
//
//           // Golden Sparrow Section
//           const GoldenSparrowWidget(),
//
//           // Search Section
//           SearchWidget(
//             onTap: () {
//               debugPrint("Search Clicked");
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// /// ------------------------------
// /// Nest Balance Widget
// /// ------------------------------
// class NestBalanceWidget extends StatelessWidget {
//   const NestBalanceWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 12,
//         vertical: 10,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 32,
//             height: 32,
//             decoration: BoxDecoration(
//               color: const Color(0xFFF5E8C8),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: const Icon(
//               Icons.account_balance_wallet_outlined,
//               size: 18,
//               color: Color(0xFFB68B2D),
//             ),
//           ),
//           const SizedBox(width: 10),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: const [
//               Text(
//                 "Nest Balance",
//                 style: TextStyle(
//                   fontSize: 11,
//                   color: Colors.grey,
//                 ),
//               ),
//               Text(
//                 "₹2,45,000",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(width: 8),
//           const Icon(
//             Icons.keyboard_arrow_down,
//             color: Colors.grey,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// /// ------------------------------
// /// Golden Sparrow Widget
// /// ------------------------------
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
//         const SizedBox(height: 4),
//         const Text(
//           "GOLDEN SPARROW",
//           style: TextStyle(
//             fontSize: 16,
//             letterSpacing: 3,
//             color: Color(0xFFB68B2D),
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         const SizedBox(height: 2),
//         const Text(
//           "EXPLORE • UNDERSTAND • JOURNEY",
//           style: TextStyle(
//             fontSize: 8,
//             letterSpacing: 1.5,
//             color: Color(0xFFB68B2D),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// /// ------------------------------
// /// Search Widget
// /// ------------------------------
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
//       child: Container(
//         width: 48,
//         height: 48,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           shape: BoxShape.circle,
//         ),
//         child: const Icon(
//           Icons.search,
//           color: Colors.black87,
//         ),
//       ),
//     );
//   }
// }