// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../models/destination_model.dart';
// import '../services/api_services.dart';
//
// class HomeProvider extends ChangeNotifier {
//
//   final ApiService _apiService = ApiService();
//   Destination destinationRes = Destination();
//
//   Future<void> destinationAPI(BuildContext context, String id) async {
//     try {
//       final response = await _apiService.destination(id);
//
//       debugPrint("API Country => ${response.country}");
//       debugPrint("API Id => ${response.id}");
//
//       // ✅ Remove the statusCode check — ApiService already validated HTTP status.
//       // Destination is already parsed and valid if no exception was thrown.
//       destinationRes = response;
//
//       debugPrint("Provider Updated => ${destinationRes.country}");
//
//       notifyListeners(); // ✅ This now always fires on success
//     } catch (e) {
//       debugPrint("Provider Error => $e");
//     }
//   }
// }




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/destination_model.dart';
import '../services/api_services.dart';

class HomeProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  // ─── State ────────────────────────────────────────────────────────────────
  Destination destinationRes = Destination();
  bool isLoading = false;
  bool hasError = false;
  String errorMessage = '';

  // Convenience getter — card is visible only when data is ready
  bool get hasDestination =>
      !isLoading && !hasError && destinationRes.id != null;

  // ─── Main API call ─────────────────────────────────────────────────────────
  Future<void> destinationAPI(BuildContext context, String id) async {
    // 1. Clear previous data + enter loading state immediately
    destinationRes = Destination();
    isLoading = true;
    hasError = false;
    errorMessage = '';
    notifyListeners(); // → HomeScreen rebuilds → shows skeleton

    try {
      final response = await _apiService.destination(id);

      debugPrint("API Country => ${response.country}");
      debugPrint("API Id     => ${response.id}");

      // 2. Success — store result, leave loading
      destinationRes = response;
      isLoading = false;
      hasError = false;
      notifyListeners(); // → HomeScreen rebuilds → shows card
    } catch (e) {
      debugPrint("Provider Error => $e");

      // 3. Failure — clear data, surface error
      destinationRes = Destination();
      isLoading = false;
      hasError = true;
      errorMessage = e.toString();
      notifyListeners(); // → HomeScreen rebuilds → shows error / hides card
    }
  }

  /// Call this if you want to hide the card without a new selection
  void clearDestination() {
    destinationRes = Destination();
    isLoading = false;
    hasError = false;
    errorMessage = '';
    notifyListeners();
  }
}