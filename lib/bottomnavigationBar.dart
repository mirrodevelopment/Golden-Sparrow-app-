import 'package:flutter/material.dart';

import 'festival_universe_screen.dart';
import 'home_screen.dart';
import 'nest_screen.dart';

//
// class MainBottomNavScreen extends StatefulWidget {
//   const MainBottomNavScreen({super.key});
//
//   @override
//   State<MainBottomNavScreen> createState() =>
//       _MainBottomNavScreenState();
// }
//
//
// class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
//
//   int _selectedIndex = 0;
//
//
//   final List<Widget> _screens = [
//     HomeScreen(),
//     HomeScreen(),
//     HomeScreen(),
//     HomeScreen(),
//     HomeScreen(),
//     HomeScreen(),
//   ];
//
//
//   final List<Map<String, String>> _items = [
//
//     {
//       "icon": "assets/NEST.png",
//       "label": "Nest",
//     },
//
//     {
//       "icon": "assets/JOURNEYS.png",
//       "label": "Journeys",
//     },
//
//     {
//       "icon": "assets/GLOBE.png",
//       "label": "Globe",
//     },
//
//     {
//       "icon": "assets/FLOCKS.png",
//       "label": "Flocks",
//     },
//
//     {
//       "icon": "assets/PROFULE.png",
//       "label": "Profile",
//     },
//
//   ];
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//       body: _screens[_selectedIndex],
//
//
//       bottomNavigationBar: Container(
//
//         height: 95,
//
//         margin: const EdgeInsets.only(
//           left: 20,
//           right: 20,
//           bottom: 20,
//         ),
//
//
//         decoration: BoxDecoration(
//
//           color: const Color(0xffFCF8F2),
//
//           borderRadius: BorderRadius.circular(50),
//
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.08),
//               blurRadius: 25,
//               offset: const Offset(0,8),
//             )
//           ],
//
//         ),
//
//
//         child: Row(
//
//           mainAxisAlignment:
//           MainAxisAlignment.spaceAround,
//
//
//           children: List.generate(
//             _items.length,
//                 (index){
//
//
//               bool active =
//                   _selectedIndex == index;
//
//
//               return GestureDetector(
//
//                 onTap: (){
//
//                   setState(() {
//                     _selectedIndex = index;
//                   });
//
//                 },
//
//
//                 child: Column(
//
//                   mainAxisAlignment:
//                   MainAxisAlignment.center,
//
//
//                   children: [
//
//
//                     AnimatedContainer(
//
//                       duration:
//                       const Duration(milliseconds:250),
//
//                       padding:
//                       active
//                           ? const EdgeInsets.all(10)
//                           : EdgeInsets.zero,
//
//
//                       decoration: active
//                           ? const BoxDecoration(
//                         color: Color(0xffFCF8F2),
//                         shape: BoxShape.circle,
//                       )
//                           : null,
//
//
//                       child: Image.asset(
//
//                         _items[index]["icon"]!,
//
//                         width: active ? 34 : 26,
//                         height: active ? 34 : 26,
//
//                         color: active
//                             ? const Color(0xffB68B2D)
//                             : const Color(0xff8C8883),
//
//                       ),
//
//                     ),
//
//
//
//                     const SizedBox(height:6),
//
//
//
//                     Text(
//
//                       _items[index]["label"]!,
//
//                       style: TextStyle(
//
//                         fontSize:14,
//
//                         fontWeight: active
//                             ? FontWeight.w600
//                             : FontWeight.w400,
//
//
//                         color: active
//                             ? const Color(0xffB68B2D)
//                             : const Color(0xff8C8883),
//
//                       ),
//
//                     )
//
//                   ],
//
//                 ),
//
//               );
//
//             },
//           ),
//
//         ),
//
//       ),
//
//     );
//
//   }
// }


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2; // ✅ Globe default selected

  final List<Widget> _screens = [
    const MyNestScreen(), // Nest
    const HomeScreen(), // Globe (main)
    const Center(child: Text("Journeys")),
    const FestivalUniverseScreen(),
    // const Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6), // ⬇ reduced from 16, 10
      decoration: BoxDecoration(
        color: const Color(0xFFF5F0EA),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(0, 'assets/NEST.png', 'Nest'),
          _buildNavItemGlobe(1), // ✅ Globe center special
          _buildNavItem(2, 'assets/JOURNEYS.png', 'Journeys'),
          _buildNavItem(3, 'assets/FLOCKS.png', 'Flocks'),
          // _buildNavItem(4, 'assets/PROFULE.png', 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String imagePath, String label) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width:25,
            height:25,
            color: isSelected
                ? const Color(0xFFB8922A) // ✅ selected — gold
                : Colors.black
            // const Color(0xFFAAAAAA), // unselected — grey
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
              color: isSelected
                  ? const Color(0xFFB8922A)
                  : const Color(0xFF666666),
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Globe — center special gold circle
  Widget _buildNavItemGlobe(int index) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.language_rounded,
            color: isSelected  ? const Color(0xFFB8922A) // ✅ selected — gold
                : const Color(0xFFAAAAAA), // unselected — grey

            size: 25,
          ),
          const SizedBox(height: 4),
          Text(
            'Globe',
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
              color: isSelected
                  ? const Color(0xFFB8922A)
                  : const Color(0xFF666666),
            ),
          ),
        ],
      ),
    );
  }
}