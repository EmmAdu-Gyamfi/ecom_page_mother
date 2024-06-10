import 'package:flutter/material.dart';
import 'package:page/order/payment.dart';

import '../global/typedef.dart';
import '../widget/appbar.dart';
import '../widget/button_custom.dart';
import '../widget/order_item_build_with_quantity_selector.dart';
import '../widget/order_item_build_withthout_quantity_selector.dart';

Map<dynamic, dynamic> checkoutKeyList = {
  "order" : {
    "order_id":12213645,
    "user_id":1,
    "total_price":5000.00,
    "tax":10.00,
    "item_list":[
      {
        "product_id":1,
        "quantity":1,
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
        "quantity":1,
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



Map<dynamic, dynamic> deliveryKeyList = {
  "delivery" : {
    "delivery_id":1,
    "order_id":12213645,
    "country":"Ghana",
    "city":"Accra",
    "town":"Madina",
    "postal_address":"AC-123-1234",
  },
};


class ManagePage extends StatefulWidget {
  const ManagePage({super.key});

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  static const String currency = "GH₵";
  double get subtotal {
    double sum = 0.0;
    List<dynamic> itemList = checkoutKeyList["order"]["item_list"];
    for (var item in itemList) {
      sum += item["unit_price"];
    }
    return sum;
  }

  double get tax {
    return checkoutKeyList["order"]["tax"];
  }

  double get total {
    return subtotal + tax;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(Types.opacityLowExtra),
      appBar: AppBarCustom(title: Types.managePage, leadingIcon: Icons.list,),
      body: Container(
        height: Types.doubleInfinity,
        width: Types.doubleInfinity,
        child: Column(
          children: [
            _productItemListVertical(),
            Expanded(
              child: Container(
                width: Types.doubleInfinity,
                // height: Types.double160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Types.double10),
                  color: Types.colourApp
                ),
                child: Padding(
                  padding: const EdgeInsets.all(Types.double20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(Types.subTotal),
                          Spacer(),
                          Text("$currency${subtotal.toStringAsFixed(2)}"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(Types.shipping),
                          Spacer(),
                          Text("$currency${tax.toStringAsFixed(Types.int2)}"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(Types.total),
                          Spacer(),
                          Text("$currency${total.toStringAsFixed(Types.int2)}"),
                        ],
                      ),
                      Spacer(),

                      CustomCheckoutButton(buttonText: Types.proceedToPayment,height: Types.double60, width: Types.doubleInfinity, onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PaymentPage()),
                        );
                      },)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _productItemListVertical() {


    List<dynamic> itemList = checkoutKeyList["order"]["item_list"];

    return OrderItemBuildWiththoutQuantitySelector(orderItems: itemList);

  }
}
