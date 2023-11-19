library order_tracker;

import 'dart:convert';
import 'package:http/http.dart' as http;
export 'src/express.dart';
import 'src/express.dart';

export 'order_tracker.dart';

class OrderTracker {
  Future<Map<String, dynamic>> fetchData({
    required Express express,
    required String productId,
  }) async {
    final baseUrl = _getBaseUrl(express, productId);
    final response = await http.get(Uri.parse(baseUrl));

    // print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }

  String _getBaseUrl(Express express, String productId) {
    switch (express) {
      case Express.expressA:
        return 'https://kiangkai.com/track/$productId';
      case Express.expressB:
        return 'https://example.com/$productId';
    }
  }
}
