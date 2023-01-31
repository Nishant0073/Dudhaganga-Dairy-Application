import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dudhaganga_app/customWidgets/cElevatedButton.dart';
import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/customWidgets/cTextField.dart';

class MilkReading extends StatelessWidget {
  final int index;
  MilkReading(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("milk_reading_add_reading".tr),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 25.0, right: 10),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'milk_reading_name'.tr,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontFamily: "Poppins",
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Ram Mane",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontFamily: "Poppins",
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'milk_reading_time'.tr,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontFamily: "Poppins",
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "milk_reading_morning".tr,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontFamily: "Poppins",
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CTextField(
                label: "milk_reading_quantity".tr,
                validatorText: "milk_reading_quantity_liter".tr,
                hintText: "milk_reading_quantity_liter".tr,
              ),
              SizedBox(
                height: 15,
              ),
              CTextField(
                  label: "milk_reading_fat".tr,
                  validatorText: "milk_reading_enter_fat".tr,
                  hintText: "milk_reading_enter_fat".tr),
              SizedBox(
                height: 15,
              ),
              CElevatedButton(
                label: 'milk_reading_submit'.tr,
                onPress: () {},
              ),
            ],
          ),
        ));
  }
}
