import 'package:flutter/material.dart';
import 'package:order_tracker/order_tracker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final OrderTracker orderTracker = OrderTracker();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(
        orderTracker: orderTracker,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final OrderTracker orderTracker;

  MyHomePage({required this.orderTracker, Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<void> futureData;

  @override
  void initState() {
    super.initState();

    final String productId = 'DNXPL2706203943';

    final Express expressType = Express.expressA;

    futureData = widget.orderTracker.fetchData(
      express: expressType,
      productId: productId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Tracking Example'),
      ),
      body: ListView(),
    );
  }
}
