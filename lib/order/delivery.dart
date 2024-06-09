import 'package:flutter/material.dart';
import '../global/typedef.dart';
import '../widget/appbar.dart';
import '../widget/button_checkout.dart';
import '../widget/textformfield_withvalidator.dart';
import 'manage.dart';

Map<dynamic, dynamic> deliveryKeyList = {
  "delivery" : {
    "delivery_id":1,
    "order_id":1,
    "country":"",
    "city":"",
    "town":"",
    "postal_address":"",
  },
};

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _townController = TextEditingController();
  final TextEditingController _postalAddressController = TextEditingController();

  @override
  void dispose() {
    _countryController.dispose();
    _cityController.dispose();
    _townController.dispose();
    _postalAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: Types.deliveryPage,
        leadingIcon: Icons.list,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Types.double20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: Types.double15),
                child: CustomValidatedTextFormField(
                  labelText: Types.country,
                  controller: _countryController,
                  validatorErrorMessage: Types.pleaseEnterACountry,
                ),
              ),
              // SizedBox(height: Types.double15),
              Padding(
                padding: const EdgeInsets.only(bottom: Types.double15),
                child: CustomValidatedTextFormField(
                  labelText: Types.city,
                  controller: _cityController,
                  validatorErrorMessage: Types.pleaseEnterACity,
                ),
              ),
              // SizedBox(height: Types.double15),
              Padding(
                padding: const EdgeInsets.only(bottom: Types.double15),
                child: CustomValidatedTextFormField(
                  labelText: Types.town,
                  controller: _townController,
                  validatorErrorMessage: Types.pleaseEnterATown,
                ),
              ),
              // SizedBox(height: Types.double15),
              CustomValidatedTextFormField(
                labelText: Types.postalAddress,
                controller: _postalAddressController,
                validatorErrorMessage: Types.pleaseEnterAPostalAddress,
              ),
              // SizedBox(height: Types.double15),
              Spacer(),
              CustomCheckoutButton(buttonText: Types.proceedToPayment,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, save the inputs to the deliveryKeyList
                    setState(() {
                      deliveryKeyList["delivery"]["country"] = _countryController.text;
                      deliveryKeyList["delivery"]["city"] = _cityController.text;
                      deliveryKeyList["delivery"]["town"] = _townController.text;
                      deliveryKeyList["delivery"]["postal_address"] = _postalAddressController.text;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ManagePage()),
                    );

                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text('Delivery details saved')),
                    // );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
