import 'package:flutter/material.dart';

import '../global/typedef.dart';

class QuantitySelector extends StatefulWidget {
  final ValueNotifier<int?> quantityNotifier;

  const QuantitySelector({required this.quantityNotifier});

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantityNotifier.value ?? Types.int1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            if (quantity > Types.int1) {
              setState(() {
                quantity--;
                widget.quantityNotifier.value = quantity;
              });
            }
          },
        ),
        Text(
          quantity.toString(),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              quantity++;
              widget.quantityNotifier.value = quantity;
            });
          },
        ),
      ],
    );
  }
}
