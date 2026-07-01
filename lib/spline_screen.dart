//
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:travelagency/providers/home_provider.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class SplineScreen extends StatefulWidget {
//   const SplineScreen({super.key});
//
//   @override
//   State<SplineScreen> createState() => _SplineScreenState();
// }
//
// class _SplineScreenState extends State<SplineScreen> {
//   late final WebViewController controller;
//
//   String? selectedDestinationId;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewController()
//     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     ..addJavaScriptChannel(
//     'FlutterChannel',
//     onMessageReceived: (JavaScriptMessage message) async {
//     // final destinationId = message.message;
//       final Map<String, dynamic> data =
//       jsonDecode(message.message);
//
//       final String destinationId =
//       data['destinationId'];
//
//     debugPrint(
//     'Received destinationId from WebView: $destinationId',
//     );
//
//     setState(() {
//     selectedDestinationId = destinationId;
//     });
//       final homeManage = Provider.of<HomeProvider>(context, listen: false,);
//       await homeManage.destinationAPI(context, destinationId);      },
//     )
//     ..setNavigationDelegate(
//     NavigationDelegate(
//     onPageStarted: (url) {
//     debugPrint('Page started: $url');
//     },
//       onPageFinished: (url) {
//         debugPrint('Page finished: $url');
//
//       //   // ✅ Force full width via JS injection
//       //   controller.runJavaScript('''
//       //   document.body.style.width = '100%';
//       //   document.body.style.margin = '0';
//       //   document.body.style.padding = '0';
//       //   document.body.style.overflow = 'hidden';
//       //   document.documentElement.style.width = '100%';
//       //   document.documentElement.style.margin = '0';
//       //   document.documentElement.style.padding = '0';
//       //   var canvas = document.querySelector('canvas');
//       //   if (canvas) {
//       //     canvas.style.width = '100%';
//       //     canvas.style.height = '100%';
//       //   }
//       // '''
//       //   );
//       },
//       onWebResourceError: (error) {
//     debugPrint(
//     'WebView Error: ${error.description}',
//     );
//     },
//     ),
//     )
//     ..loadRequest(
//     Uri.parse('https://mirro.in/goldensparrow.html'),
//     );
//   }
//
//   Future<void> loadDestination(String destinationId) async {
//     try {
// // TODO:
// // 1. Read destinations.json OR Call API
// // 2. Find matching destination
// // 3. Update Discovery Popup
//
//     debugPrint(
//     'Loading destination details for: $destinationId',
//     );
//
//     // Example:
//     //
//     // final response =
//     //     await rootBundle.loadString(
//     //       'assets/destinations.json',
//     //     );
//     //
//     // final data = jsonDecode(response);
//     //
//     // final destination =
//     //     data.firstWhere(
//     //       (e) => e['id'] == destinationId,
//     //     );
//     //
//     // setState(() {
//     //   selectedDestination = destination;
//     // });
//     } catch (e) {
//     debugPrint(
//     'Error loading destination: $e',
//     );
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       // width: MediaQuery.of(context).size.width,   // ✅ full screen width
//       // height: MediaQuery.of(context).size.height, // ✅ full screen height
//       child: WebViewWidget(
//         controller: controller,
//         layoutDirection: TextDirection.ltr,
//       ),
//     );
//   }
// }


import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelagency/providers/home_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SplineScreen extends StatefulWidget {
  const SplineScreen({super.key});

  @override
  State<SplineScreen> createState() => _SplineScreenState();
}

class _SplineScreenState extends State<SplineScreen> {
  late final WebViewController controller;

  // Guard against rapid repeated taps on the same destination
  String? _lastDestinationId;
  bool _isFetching = false;
  bool _isLoading = true; // ✅ loading state


  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'FlutterChannel',
        onMessageReceived: (JavaScriptMessage message) async {
          // ── Parse incoming message ──────────────────────────────────────
          late final String destinationId;
          try {
            final Map<String, dynamic> data = jsonDecode(message.message);
            destinationId = data['destinationId'] as String;
          } catch (e) {
            debugPrint('SplineScreen: malformed WebView message — $e');
            return;
          }

          debugPrint('SplineScreen: received destinationId = $destinationId');

          // ── Debounce: skip if same destination is already loading ───────
          if (_isFetching && _lastDestinationId == destinationId) {
            debugPrint('SplineScreen: duplicate tap ignored');
            return;
          }

          _lastDestinationId = destinationId;
          _isFetching = true;

          // ── Delegate entirely to HomeProvider ───────────────────────────
          // Provider handles: clear → loading → API → success/error
          if (!mounted) return;
          final homeManage =
          Provider.of<HomeProvider>(context, listen: false);
          await homeManage.destinationAPI(context, destinationId);

          _isFetching = false;
        },
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() => _isLoading = true); // ✅ loading start
          },
          onPageFinished: (url) {
            setState(() => _isLoading = false); // ✅ loading end
            debugPrint('Page finished: $url');
          },

          onWebResourceError: (error) {
            setState(() => _isLoading = false);
            debugPrint('WebView Error: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse('https://mirro.in/goldensparrow.html'));
  }

  @override

  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ✅ WebView
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: WebViewWidget(
            controller: controller,
            layoutDirection: TextDirection.ltr,
          ),
        ),

        // ✅ Loading overlay
        if (_isLoading)
          Container(
            color: const Color(0xFFF5F0EA), // ✅ app background color
            child: const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: Color(0xFFB8922A), // ✅ gold color
                    strokeWidth: 2,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Loading Globe...",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFB8922A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
  // Widget build(BuildContext context) {
  //   return WebViewWidget(
  //     controller: controller,
  //     layoutDirection: TextDirection.ltr,
  //   );
  // }
// }