import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'dart:convert';

import 'package:flutter/material.dart';

import '../order/checkout.dart';
class OrderItemBuild extends StatelessWidget {
  const OrderItemBuild({
    super.key,
    required this.orderItems,
  });

  final List<OrderItem> orderItems;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: orderItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                        child: Container(
                          child: CachedNetworkImage(
                            imageUrl: "${orderItems[index].productImages[0]}",
                            fit: BoxFit.contain,
                            width: 100,
                            height: 100,
                            placeholder: (context, url) => Container(height: 5, width: 5, child: CupertinoActivityIndicator()),
                            errorWidget: (context, url, error) => new Icon(Icons.error),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Icon(CupertinoIcons.trash, size: 15,),
                            ),
                            Text("Remove"),
                          ],
                        ),
                      )
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text('Product ID: ${orderItems[index].productId}'),
                        Text('${orderItems[index].description}'),
                        Text('GH₵${orderItems[index].unitPrice.toStringAsFixed(2)}', overflow: TextOverflow
                            .ellipsis,
                          maxLines: 3,),
                        Text('${orderItems[index].category}'),

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