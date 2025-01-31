import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/orders.dart';

class ApiService {
  final String apiUrl = "https://digihand.co.in/arun1/api/AllPickupman";

  Future<OrdersResponse> fetchOrders() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response into an OrdersResponse object
      return OrdersResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load orders');
    }
  }
}