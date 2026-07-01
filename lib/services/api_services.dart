import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/destination_model.dart';

class ApiService{


  Future<Destination> destination(String destinationId,) async {
    try {
      final response = await http.post(
        Uri.parse("https://mirro.in/api/destination"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'destinationId': destinationId,
        }),      );
      print("printe the api response body::: ${destinationId}");
      print("printe the api response body::: ${response.body}");
      print("printe the api response body::: ${response.statusCode}");
      Map<String, dynamic> responseData = jsonDecode(response.body);
      return Destination.fromJson(responseData);
    }
    on SocketException catch (e) {
      throw Exception("No Internet Connection: ${e.message}");
    }
    on TimeoutException catch (e) {
      throw Exception("Request Timed Out: ${e.message}");
    }
    catch (e) {
      throw Exception("Unexpected Error: ${e.toString()}");
    }

  }








}