import 'package:flutter_test/flutter_test.dart';
import 'package:order_tracker/order_tracker.dart';

void main() {
  test('Test fetching data from feed', () async {
    OrderTracker orderTracker = OrderTracker();

    String productId = 'DNXTK17041319885';

    try {
      // Fetch data using the fetchData method
      Map<String, dynamic> result = await orderTracker.fetchData(
        express: Express.expressA,
        productId: productId,
      );

      if (result != null) {
        print('Result: $result');
      } else {
        fail('Test failed: Result is null');
      }
    } catch (e) {
      print('error: $e');
      fail('Test failed: $e');
    }
  });
}
