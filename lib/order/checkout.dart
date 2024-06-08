import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'dart:convert';

import 'package:flutter/material.dart';

import '../widget/OrderItemBuild.dart';

class OrderItem {
  OrderItem({
    required this.productId,
    required this.productImages,
    required this.unitPrice,
    required this.category,
    this.quantity,
    required this.description,
  });

  late final int productId;
  late final List<String> productImages;
  late final double unitPrice;
  late final String category;
  int? quantity;
  late final String description;

  OrderItem.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productImages = List<String>.from(json['productImages']);
    unitPrice = json['unitPrice'];
    category = json['category'];
    quantity = json['quantity'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['productImages'] = productImages;
    data['unitPrice'] = unitPrice;
    data['category'] = category;
    data['quantity'] = quantity;
    data['description'] = description;
    return data;
  }
}

class Order {
  Order({
    required this.orderId,
    required this.userId,
    this.totalPrice,
    required this.orderItems,
    required this.taxes,
  });

  late final int orderId;
  late final int userId;
  double? totalPrice;
  late final List<OrderItem> orderItems;
  late final double taxes;

  Order.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    userId = json['userId'];
    totalPrice = json['totalPrice'];
    taxes = json['taxes'];
    orderItems = List<OrderItem>.from(
        json['orderItems'].map((productJson) => OrderItem.fromJson(productJson))
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['userId'] = userId;
    data['totalPrice'] = totalPrice;
    data['taxes'] = taxes;
    data['orderItems'] = orderItems.map((product) => product.toJson()).toList();
    return data;
  }
}


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
      appBar: AppBar(
        leading: Icon(Icons.list),
        title: Text("Title"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(Icons.person_2_outlined),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20,),
            child: Icon(Icons.shopping_cart_outlined),
          ),

        ],
      ),

      backgroundColor: Colors.black.withOpacity(0.15),

      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            _orderItemsBuilder()
          ],
        ),
      ),

    );
  }

  Widget _orderItemsBuilder() {
    var order = Order(
      orderId: 1,
      userId: 1,
      // totalPrice: 100.0,
      orderItems: [
        OrderItem(
          productId: 1,
          productImages: ["https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.jumia.com.gh%2Fgeneric-ice-sleeves-outdoor-riding-sun-proof-arm-protection-cover-76281360.html&psig=AOvVaw2FhB8W716c7aITJ5MXfg-G&ust=1717934078306000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOCKyPDry4YDFQAAAAAdAAAAABAE", "image_url_1", "image_url_1"],
          unitPrice: 50.00,
          category: "Product category",
          description: "Description of this product",
        ),
        OrderItem(
          productId: 2,
          productImages: ["image_url_2", "image_url_1", "image_url_1"],
          unitPrice: 100.00,
          category: "Product category",
          description: "Description of this product",
        ),

        OrderItem(
          productId: 3,
          productImages: ["https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*","image_url_1", "image_url_1"],
          unitPrice: 150.00,
          category: "Product category",
          description: "Description of this product",
        ),

        OrderItem(
          productId: 4,
          productImages: ["https://images.unsplash.com/photo-1566958769312-82cef41d19ef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzF8fHByb2R1Y3RzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60", "image_url_1", "image_url_1"],
          unitPrice: 200.00,
          category: "Product category",
          description: "Description of this product",
        ),
      ],
      taxes: 10.00,
    );
    
    var orderItems = order.orderItems;

    return OrderItemBuild(orderItems: orderItems);

  }

}


