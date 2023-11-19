import 'package:flutter/material.dart';

class ProductInfo extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductInfo({super.key, required this.product});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
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
            backgroundColor: Colors.purple.shade800,
          ),
          const SliverPadding(
            padding: EdgeInsets.only(
              top: 28,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 650,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Info Of this Product',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(
                              height: 28,
                            ),
                            Text(
                              'From: ${widget.product['from']['name']}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              'To: ${widget.product['to']['name']}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              'Sender Tel: ${widget.product['from']['tel']}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              'Receiver Tel: ${widget.product['to']['tel']}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              'Product Type: ເຄື່ອງຂະໜາດໃຫຍ່',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              'Status: ຮອດລູກຄ້າແລ້ວ',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
