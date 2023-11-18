// order_tracker.dart

library order_tracker;

import 'order.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;

  /// Calculate the total quantity of items in a list of orders.
  Future<int> calculateTotalQuantity(List<Order> orders) async {
    int totalQuantity = 0;

    for (var order in orders) {
      totalQuantity += order.quantity;
    }

    return totalQuantity;
  }
}
