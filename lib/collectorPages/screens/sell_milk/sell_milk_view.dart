import 'package:dudhaganga_app/collectorPages/screens/sell_milk/sell_milk_model.dart';
import 'package:dudhaganga_app/customWidgets/ddd_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../../customWidgets/c_elevated_button.dart';
import '../../../customWidgets/c_text_field.dart';
import '../../../models/milk_buyer.dart';

class SellMilk extends StatefulWidget {
  final MilkBuyer milkBuyer;
  const SellMilk({super.key, required this.milkBuyer});

  @override
  State<SellMilk> createState() => _SellMilkState();
}

class _SellMilkState extends State<SellMilk> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SellMilkModel>.reactive(
        viewModelBuilder: () => SellMilkModel(),
        onViewModelReady: (model) => model.init(widget.milkBuyer),
        builder: (context, model, child) => _body(context, model));
  }

  Widget _body(BuildContext context, SellMilkModel model) {
    final formKey = GlobalKey<FormState>();
    final formKeyRate = GlobalKey<FormState>();
    List<Widget> pages = [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 25.0, right: 10),
        child: Form(
          key: formKey,
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
                    model.milkBuyer?.name ?? "Milk Buyer Name",
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
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${'rate'.tr} :",
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
                    "${model.rate.toString()} Rs",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontFamily: "Poppins",
                      fontSize: 17,
                    ),
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
                textInputType: TextInputType.number,
                textEditingController: model.textEditingControllerWeight,
                validator: (value) {
                  print(value);
                  if (value == null || value.isEmpty) {
                    return "Please add weight";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SizedBox(
                  width: double.infinity,
                  child: CElevatedButton(
                    label: 'milk_reading_submit'.tr,
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        model.sellMilk(context);
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SizedBox(
                  width: double.infinity,
                  child: CElevatedButton(
                    label: 'change_rate'.tr,
                    onPress: () {
                      model.nextPage();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(24),
        child: Form(
          key: formKeyRate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CTextField(
                label: "enter_rate".tr,
                validatorText: "enter_rate".tr,
                hintText: "enter_rate".tr,
                textInputType: TextInputType.number,
                textEditingController: model.textEditingControllerRate,
                validator: (value) {
                  print(value);
                  if (value == null || value.isEmpty) {
                    return "Please add rate";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SizedBox(
                  width: double.infinity,
                  child: CElevatedButton(
                    label: 'change_rate'.tr,
                    onPress: () {
                      if (formKeyRate.currentState!.validate()) {
                        model.prevPage(true, context);
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SizedBox(
                  width: double.infinity,
                  child: CElevatedButton(
                    label: "go_back".tr,
                    onPress: () {
                      model.prevPage(false, context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Sell Milk"),
      ),
      body: Stack(
        children: [
          PageView(
            controller: model.pageController,
            physics: NeverScrollableScrollPhysics(),
            children: pages,
          ),
          DDLoader(
            loading: model.isBusy,
          ),
        ],
      ),
    );
  }
}
