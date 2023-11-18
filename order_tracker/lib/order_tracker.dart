library order_tracker;

import 'dart:convert';
import 'package:http/http.dart' as http;
export 'src/express.dart';
import 'src/express.dart';

class OrderTracker {
  Future<void> fetchData({
    required Express express,
    required String productId,
  }) async {
    if (express == Express.expressA) {
      String baseUrlA = 'https://kiangkai.com/track/$productId';
      final response = await http.get(Uri.parse(baseUrlA));
      //
      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = (response.body);
        print(data);
      
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } else if (express == Express.expressB) {
      String baseUrlB = 'https://example.com/$productId';
      final response = await http.get(Uri.parse(baseUrlB));

      print(response.statusCode);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(responseData);
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    }

    // In case the express type is not recognized, you can handle it appropriately.
    throw Exception('Invalid express type: $express');
  }
}
