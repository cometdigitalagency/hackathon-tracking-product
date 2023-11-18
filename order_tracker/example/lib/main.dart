import 'package:flutter/material.dart';
import 'package:order_tracker/order_tracker.dart';

import 'page/tracking_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // The order tracker
  final OrderTracker orderTracker = OrderTracker();
  late Future<Map<String, dynamic>> fetchData;
  final TextEditingController productIdController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

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
      print(data);
    } catch (error) {
      // print('Error: $error');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                "Ha-Dee Delivery",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            centerTitle: false,
            floating: true,
            titleSpacing: 0,
            shadowColor: Colors.transparent,
            expandedHeight: 426,
            backgroundColor: Colors.purple.shade800,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 64,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter Product ID or scan Barcode',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 7,
                              bottom: 40,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 49,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: TextField(
                                        controller: productIdController,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(14),
                                  width: 50,
                                  height: 49,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.white,
                                  ),
                                  child: Image.asset("assets/qr.png"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                _trackProduct();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              child: Text(
                                'Track Product',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.only(
              top: 32,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'My Products',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Container(
                height: 174,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, 0),
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Example',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        Container(
                          height: 31,
                          width: 78,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Delivery.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'In Transit',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        Text(
                          'Last Update: 68 hours ago',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2.5),
                            child: const LinearProgressIndicator(
                              value: 0.8,
                              color: Colors.purple,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 68,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'More Details',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }))
        ],
      ),
    );
  }
}
