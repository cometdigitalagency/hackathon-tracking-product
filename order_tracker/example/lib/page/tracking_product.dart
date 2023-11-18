import 'package:flutter/material.dart';

class ListProduct extends StatefulWidget {
  final Map<String, dynamic> product;
  const ListProduct({super.key, required this.product});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Name: ${widget.product['from']['name']}',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            Text(
              'Product ID: ${widget.product['from']['tel']}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 8),
            Text(
              'Description: ${widget.product['from']['name']}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 8),
            Text(
              'Price: ${widget.product['price']}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            // Add more details as needed based on your product structure
          ],
        ),
      ),
    );
  }
}
