import 'package:dudhaganga_app/collectorPages/screens/view_payments/view_payments_model.dart';
import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/customWidgets/c_card.dart';
import 'package:dudhaganga_app/customWidgets/c_elevated_button.dart';
import 'package:dudhaganga_app/customWidgets/c_text_field.dart';
import 'package:dudhaganga_app/models/farmer.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ViewPaymentsScreen extends StatefulWidget {
  final Farmer? farmer;
  const ViewPaymentsScreen({this.farmer, super.key});

  @override
  State<ViewPaymentsScreen> createState() => _ViewPaymentsScreenState();
}

class _ViewPaymentsScreenState extends State<ViewPaymentsScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewPaymenetsModel>.reactive(
        viewModelBuilder: () => ViewPaymenetsModel(),
        onViewModelReady: (model) => model.init(widget.farmer),
        builder: (context, model, child) => _body(context, model));
  }

  _body(BuildContext context, ViewPaymenetsModel model) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payments"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: H(context) / 6,
              width: double.infinity,
              child: HomeCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pending Amount",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${model.pendingAmount.toString().length >= 6 ? model.pendingAmount.toString().substring(0, 6) : model.pendingAmount.toString()} Rs",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Visibility(
                      visible: (model.pendingAmount ?? 0.0) > 0.0,
                      child: SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: CElevatedButton(
                            label: "Pay Amount",
                            onPress: () {
                              model.onPayAmountPressed();
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Visibility(
              visible: model.isShowRez,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50.0,
                    width: W(context) / 2.5,
                    child: CTextField(
                      label: "Enter amount",
                      textEditingController: model.amountController,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                    width: W(context) / 2.5,
                    child: CElevatedButton(
                      label: "Enter amount",
                      onPress: () {
                        model.openCheckout();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
