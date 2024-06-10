import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../global/typedef.dart';
import 'quantity_selector.dart';

class OrderItemBuildWithQuantitySelector extends StatefulWidget {
  const OrderItemBuildWithQuantitySelector({
    Key? key,
    required this.orderItems,
  }) : super(key: key);

  final List<dynamic> orderItems;

  @override
  _OrderItemBuildWithQuantitySelectorState createState() => _OrderItemBuildWithQuantitySelectorState();
}

class _OrderItemBuildWithQuantitySelectorState extends State<OrderItemBuildWithQuantitySelector> {
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
            padding: const EdgeInsets.symmetric(horizontal: Types.paddingLarge, vertical: Types.paddingMedium),
            child: Container(
              height: Types.double120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Types.paddingMedium),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(Types.paddingMedium),
                        child: SizedBox(
                          width: Types.double100,
                          height: Types.double60,
                          child: CachedNetworkImage(
                            imageUrl: widget.orderItems[index]['product_image_list'][0]['image_url'],
                            fit: BoxFit.contain,
                            placeholder: (context, url) => const CupertinoActivityIndicator(),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                      ),
                      Row(
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
                            widget.orderItems[index]['product_name'],
                            maxLines: Types.int2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        Spacer(),

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
