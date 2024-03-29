import 'package:dudhaganga_app/collectorPages/screens/take_readings/take_readings_model.dart';
import 'package:dudhaganga_app/customWidgets/ddd_loading.dart';
import 'package:dudhaganga_app/models/farmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dudhaganga_app/customWidgets/c_elevated_button.dart';
import 'package:dudhaganga_app/customWidgets/c_text_field.dart';
import 'package:stacked/stacked.dart';

class MilkReadingScreen extends StatefulWidget {
  final Farmer? farmer;
  const MilkReadingScreen(this.farmer, {super.key});

  @override
  State<MilkReadingScreen> createState() => _MilkReadingScreenState();
}

class _MilkReadingScreenState extends State<MilkReadingScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TakeReadingModel>.reactive(
        viewModelBuilder: () => TakeReadingModel(),
        onViewModelReady: (model) => model.init(widget.farmer, context),
        builder: (context, model, child) => _body(context, model));
  }

  Widget _body(BuildContext context, TakeReadingModel model) {
    return Scaffold(
      appBar: AppBar(
        title: Text("milk_reading_add_reading".tr),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 25.0, right: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${'milk_reading_name'.tr} :",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontFamily: "Poppins",
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        model.farmer?.name ?? "Farmer Name",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontFamily: "Poppins",
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${'milk_reading_time'.tr} :",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontFamily: "Poppins",
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        DateTime.now().hour < 15
                            ? "milk_reading_morning".tr
                            : 'add_milk_buyer_evening'.tr,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontFamily: "Poppins",
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${'select_milk_type'.tr} :",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontFamily: "Poppins",
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      DropdownButton(
                        value: model.selectedAnimal,
                        items: model.animals.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            model.selectedAnimal = value;
                          });

                          print(model.selectedAnimal);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CTextField(
                    label: "milk_reading_quantity".tr,
                    validatorText: "milk_reading_quantity_liter".tr,
                    hintText: "milk_reading_quantity_liter".tr,
                    textInputType: TextInputType.number,
                    textEditingController: model.textEditingControllerWeight,
                    validator: (value) {
                      print(value);
                      if (value == null || value.isEmpty) {
                        return "Please add weight";
                      }
                      return "";
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CTextField(
                    label: "milk_reading_fat".tr,
                    validatorText: "milk_reading_enter_fat".tr,
                    hintText: "milk_reading_enter_fat".tr,
                    textEditingController: model.textEditingControllerFat,
                    textInputType: TextInputType.number,
                    validator: (value) {
                      print(value);
                      if (value == null || value.isEmpty) {
                        return "Please add fat";
                      }
                      return "";
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CElevatedButton(
                    label: 'milk_reading_submit'.tr,
                    onPress: () {
                      model.saveDetails(context);
                    },
                  ),
                ],
              ),
            ),
            DDLoader(
              loading: model.isBusy,
            ),
          ],
        ),
      ),
    );
  }
}
