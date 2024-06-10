import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../global/typedef.dart';
import 'quantity_selector.dart';

class OrderItemBuildWiththoutQuantitySelector extends StatefulWidget {
  const OrderItemBuildWiththoutQuantitySelector({
    Key? key,
    required this.orderItems,
  }) : super(key: key);

  final List<dynamic> orderItems;

  @override
  _OrderItemBuildState createState() => _OrderItemBuildState();
}

class _OrderItemBuildState extends State<OrderItemBuildWiththoutQuantitySelector> {
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          'GH₵${widget.orderItems[index]['unit_price']}',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        Text(
                          'Qty ${widget.orderItems[index]['quantity']}',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),

                        Spacer(),

                        // QuantitySelector(quantityNotifier: quantityNotifier),

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
