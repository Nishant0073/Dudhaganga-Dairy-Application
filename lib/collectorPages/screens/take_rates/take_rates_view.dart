import 'package:dudhaganga_app/collectorPages/screens/take_rates/take_rates_model.dart';
import 'package:dudhaganga_app/customWidgets/c_card.dart';
import 'package:dudhaganga_app/customWidgets/c_elevated_button.dart';
import 'package:dudhaganga_app/customWidgets/ddd_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../../constants.dart';

class TakeRatesView extends StatefulWidget {
  const TakeRatesView({super.key});

  @override
  State<TakeRatesView> createState() => _TakeRatesView();
}

class _TakeRatesView extends State<TakeRatesView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TakeRatesModel>.reactive(
        viewModelBuilder: () => TakeRatesModel(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, child) => _body(context, model));
  }

  Widget _body(BuildContext context, TakeRatesModel model) {
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
                  children: [
                    const Text(
                        "In order to add rates first upload the rates csv file:"),
                    const SizedBox(
                      height: 20,
                    ),
                    model.isDataImported == false
                        ? InkWell(
                            onTap: () {
                              model.onUploadTap();
                            },
                            child: HomeCard(
                              child: SizedBox(
                                width: W(context) * 95,
                                child: Image.asset(
                                  "assets/images/upload.png",
                                ),
                              ),
                            ),
                          )
                        : SizedBox(
                            width: W(context) * 95,
                            child: HomeCard(
                              child: Image.asset(
                                "assets/images/upload_done.png",
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 10,
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
        bottomNavigationBar: model.isDataImported == true
            ? CElevatedButton(
                label: "Continue",
                onPress: () {
                  model.checkIsFileUploaded(context);
                },
              )
            : null);
  }
}
