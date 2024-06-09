import 'package:flutter/material.dart';

Map<dynamic, dynamic> deliveryKeyList = {
  "delivery" : {
    "delivery_id":1,
    "order_id":1,
    "delivery_date":"03-07-2024",
    "status":"Processing",
    "address":"Street avenue"
      },
};

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
