## Getting Started

- Import the package in your Dart code.

```dart
import 'package:flutter/material.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:example/product_info.dart';
import 'page/tracking_product.dart';
```

- Create an instance of the OrderTracker class and call the fetchData method to retrieve order tracking details.

```dart
  final OrderTracker orderTracker = OrderTracker();
  late Future<Map<String, dynamic>> fetchData;
  final TextEditingController productIdController= TextEditingController();
```

# example

- In this example, we demonstrate how to use the `OrderTracker` class
  to track a product and display the tracking details in a new screen.
  ````dart
       void _trackProduct() async {
         final String enteredProductId = productIdController.text;
         try {
           final data = await orderTracker.fetchData(
             express: Express.expressA,
             productId: enteredProductId,
           );
           Navigator.push(
             context,
             MaterialPageRoute(
               builder: (context) => ListProduct(
                 product: data,
               ),
             ),
           );
         } catch (error) {
           print('Error: $error');
         }
       }


## Additional Information

- To use this example, enter a product ID or scan a barcode, then tap
  the "Track Product" button. The application will fetch tracking
  information and navigate to the `ListProduct` screen to display
  details about the product's delivery status.

- The package also includes a `ProductInfo` screen that provides an
  example of displaying detailed information about a product's delivery
  progress using a `SliverList`.
