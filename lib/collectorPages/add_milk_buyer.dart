import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/customWidgets/cElevatedButton.dart';
import 'package:dudhaganga_app/customWidgets/cTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMilkBuyer extends StatefulWidget {
  const AddMilkBuyer({super.key});

  @override
  State<AddMilkBuyer> createState() => _AddMilkBuyer();
}

class _AddMilkBuyer extends State<AddMilkBuyer> {
  final _formKey = GlobalKey<FormState>();
  bool cow = false;
  bool buffalo = false;
  bool morning = false;
  bool evening = false;
  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('add_milk_buyer_add_buyer'.tr),
            content: Text('add_milk_buyer_click_button'.tr),
            actions: <Widget>[
              TextButton(
                child: Text('add_milk_buyer_cancel'.tr),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('add_milk_buyer_ok'.tr),
                onPressed: () {
                  Navigator.of(context).pop();
                  FocusScope.of(context).unfocus();
                  _formKey.currentState?.reset();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('add_milk_buyer_customer_added'.tr),
                      duration: Duration(seconds: 3),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('add_milk_buyer_add_buyer'.tr),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CTextField(
                    label: "add_milk_buyer_name".tr,
                    validatorText: "add_milk_buyer_enter_name".tr,
                    hintText: 'add_milk_buyer_name_here'.tr,
                  ),
                  const SizedBox(height: 20.0),
                  CTextField(
                    label: 'add_milk_buyer_phone_no'.tr,
                    hintText: 'Eg. 9192939495',
                  ),
                  const SizedBox(height: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'add_milk_buyer_select_time'.tr,
                        style: themeData.textTheme.bodyLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: morning,
                                onChanged: (bool? newValue) {
                                  setState(
                                    () {
                                      morning = newValue!;
                                    },
                                  );
                                },
                                shape: const CircleBorder(),
                              ),
                              Text(
                                "add_milk_buyer_morning".tr,
                                style: themeData.textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: evening,
                                onChanged: (bool? newValue) {
                                  setState(
                                    () {
                                      evening = newValue!;
                                    },
                                  );
                                },
                                shape: const CircleBorder(),
                              ),
                              Text(
                                "add_milk_buyer_evening".tr,
                                style: themeData.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  CElevatedButton(
                    label: 'add_customer'.tr,
                    onPress: () {
                      _showMyDialog();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
