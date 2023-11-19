import 'package:example/page/expressmodel.dart';
import 'package:example/page/product_info.dart';
import 'package:flutter/material.dart';
import 'package:order_tracker/order_tracker.dart';

void main() {
  runApp(const MyApp());
}

const List<String> list = <String>['ExpressA', 'ExpressB'];

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
  // The use package tracker
  final OrderTracker orderTracker = OrderTracker();
  ExpressModel product = ExpressModel();
  final TextEditingController productIdController = TextEditingController();
  String dropdownValue = list.first;

  @override
  void initState() {
    super.initState();
  }

  void _productInfo() async {
    final String enteredProductId = productIdController.text;

    try {
      final data = await orderTracker.fetchData(
        express: Express.expressA,
        productId: enteredProductId,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductInfo(
            product: data,
          ),
        ),
      );
      // print(data);
    } catch (error) {
      // print('Error: $error');
    }
  }

  void _trackProduct() async {
    final String enteredProductId = productIdController.text;

    try {
      final data = await orderTracker.fetchData(
        express: Express.expressA,
        productId: enteredProductId,
      );

      product = ExpressModel.fromJson(data);
      setState(() {});
      // print(data);
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
            floating: false,
            titleSpacing: 0,
            shadowColor: Colors.transparent,
            expandedHeight: 280,
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
                              top: 0,
                              bottom: 20,
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
                                  width: 120,
                                  height: 49,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.white,
                                  ),
                                  child: DropdownButton<String>(
                                    value: dropdownValue,
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    onChanged: (String? value) {
                                      // This is called when the user selects an item.
                                      setState(() {
                                        dropdownValue = value!;
                                      });
                                    },
                                    items: list.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
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
              top: 12,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                GestureDetector(
                  onTap: () {
                    _productInfo();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Container(
                      height: 600,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'ສະຖານະ ພັດສະດຸຂອງທ່ານ',
                            style: TextStyle(fontSize: 24),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (product.trackings != null)
                                SingleChildScrollView(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: product.trackings!.length,
                                      itemBuilder: (context, index) {
                                        final item = product.trackings![index];
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('${item.title}',
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text('${item.date}',
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                              '${item.description}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color: Colors.black,
                                                  ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                              height: 35,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(2.5),
                                                child:
                                                    const LinearProgressIndicator(
                                                  value: 1,
                                                  color: Colors.purple,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
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
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
