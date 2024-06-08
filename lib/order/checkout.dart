import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page/widget/CustomAppBar.dart';

import '../widget/OrderItemBuild.dart';

Map<dynamic, dynamic> checkoutKeyList = {
  "order" : {
    "order_id":1,
    "user_id":1,
    "total_price":0.00,
    "tax":10.00,
    "item_list":[
      {
        "product_id":1,
        "quantity":0,
        "product_name":"Nike Air Force 1",
        "category": "Footwears",
        "unit_price": 200.0,
        "description":"Description of the foot ware",
        "product_image_list": [
          {
            "image_url":"https://images.unsplash.com/photo-1566958769312-82cef41d19ef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzF8fHByb2R1Y3RzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
          },
          {
            "image_url":"https://images.unsplash.com/photo-1566958769312-82cef41d19ef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzF8fHByb2R1Y3RzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",

          }
        ]
      },

      {
        "product_id":2,
        "quantity":0,
        "product_name":"Samsung S22 Ultra",
        "category": "Computing",
        "unit_price": 5000.0,
        "description":"Description of S22 Ultra",
        "product_image_list": [
          {
            "image_url":"https://images.unsplash.com/photo-1566958769312-82cef41d19ef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzF8fHByb2R1Y3RzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
          },
          {
            "image_url":"https://images.unsplash.com/photo-1566958769312-82cef41d19ef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzF8fHByb2R1Y3RzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",

          }
        ]
      },


    ]
  }
};


class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Custom App Bar',
        leadingIcon: Icons.menu,
        actionIcons: [Icons.search, Icons.person, Icons.shopping_cart],
      ),

      backgroundColor: Colors.black.withOpacity(0.15),

      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            _productItemListVertical()
          ],
        ),
      ),

    );
  }

  Widget _productItemListVertical() {


    List<dynamic> itemList = checkoutKeyList["order"]["item_list"];

    return OrderItemBuild(orderItems: itemList);

  }

}


