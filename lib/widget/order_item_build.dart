import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../global/typedef.dart';
import 'quantity_selector.dart';

class OrderItemBuild extends StatefulWidget {
  const OrderItemBuild({
    super.key,
    required this.orderItems,
  });

  final List<dynamic> orderItems;

  @override
  OrderItemBuildState createState() => OrderItemBuildState();
}

class OrderItemBuildState extends State<OrderItemBuild> {
  late ValueNotifier<int?> quantityNotifier;

  @override
  void initState() {
    super.initState();
    quantityNotifier = ValueNotifier<int?>(null);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.orderItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Container(
              height: Types.containerRespMaxHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: Types.sizeWidthSmall,
                          height: Types.sizeHeightSmall,
                          child: CachedNetworkImage(
                            imageUrl: widget.orderItems[index]['product_image_list'][0]['image_url'],
                            fit: BoxFit.contain,
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(Icons.delete),
                          Text("Remove"),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: Types.paddingSmall),
                          child: Text(
                            widget.orderItems[index]['description'],
                            maxLines: Types.int2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          'GH₵${widget.orderItems[index]['unit_price'].toStringAsFixed(Types.int2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),

                        const Spacer(),
                        QuantitySelector(quantityNotifier: quantityNotifier),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
