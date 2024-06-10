import 'package:flutter/material.dart';
import 'package:page/global/typedef.dart';

import '../widget/button_custom.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? _selectedPaymentMethod;
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _submitPayment() {
    if (_formKey.currentState!.validate()) {
      // Process payment based on the selected payment method and card details
      if (_selectedPaymentMethod == 'PayPal') {
        // Handle PayPal payment
        print('PayPal selected');
      } else if (_selectedPaymentMethod == 'Visa' || _selectedPaymentMethod == 'MasterCard') {
        // Handle card payment
        print('Card payment selected');
        print('Card Number: ${_cardNumberController.text}');
        print('Expiry Date: ${_expiryDateController.text}');
        print('CVV: ${_cvvController.text}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Payment Method Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'PayPal',
                  groupValue: _selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value;
                    });
                  },
                ),
                Text('PayPal'),
                SizedBox(width: 20),
                Radio<String>(
                  value: 'Visa',
                  groupValue: _selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value;
                    });
                  },
                ),
                Text('Visa'),
                SizedBox(width: 20),
                Radio<String>(
                  value: 'MasterCard',
                  groupValue: _selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value;
                    });
                  },
                ),
                Text('MasterCard'),
              ],
            ),
            SizedBox(height: 20),
            // Card Details Form
            if (_selectedPaymentMethod != null && _selectedPaymentMethod != 'PayPal')
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _cardNumberController,
                      decoration: InputDecoration(
                        labelText: 'Card Number',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your card number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _expiryDateController,
                            decoration: InputDecoration(
                              labelText: 'Expiry Date',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.datetime,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the expiry date';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 20),

                        Expanded(
                          child: TextFormField(
                            controller: _cvvController,
                            decoration: InputDecoration(
                              labelText: 'CVV',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the CVV';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            // SizedBox(height: Types.),

            Spacer(),
            // Submit Button
            CustomCheckoutButton(buttonText: Types.proceed,height: Types.double60, width: Types.doubleInfinity)
          ],
        ),
      ),
    );
  }
}
