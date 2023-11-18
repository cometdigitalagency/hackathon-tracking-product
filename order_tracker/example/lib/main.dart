import 'package:flutter/material.dart';
import 'package:order_tracker/order.dart';
import 'package:order_tracker/order_tracker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Create a list of orders
  List<Order> orders = [
    Order(orderId: '1', productName: 'Product A', quantity: 3),
    Order(orderId: '2', productName: 'Product B', quantity: 5),
    Order(orderId: '3', productName: 'Product C', quantity: 2),
  ];

  // Use the Calculator to calculate the total quantity
  Calculator calculator = Calculator();
  late Future<int> totalQuantity;

  @override
  void initState() {
    super.initState();
    totalQuantity = calculator.calculateTotalQuantity(orders);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Tracker'),
      ),
      body: Column(
        children: [
          FutureBuilder<int>(
            future: totalQuantity,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                int result = snapshot.data ?? 0;
                return Text('Total Quantity: $result');
              }
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Product: ${orders[index].productName}'),
                  subtitle: Text('Quantity: ${orders[index].quantity}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
