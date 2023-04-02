import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/customWidgets/c_card.dart';
import 'package:dudhaganga_app/customWidgets/c_elevated_button.dart';
import 'package:dudhaganga_app/customWidgets/c_text_field.dart';
import 'package:dudhaganga_app/customWidgets/ddd_loading.dart';
import 'package:dudhaganga_app/milk_buyerpages/view_payments/view_payments_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ViewPaymentsScreenBuyer extends StatefulWidget {
  const ViewPaymentsScreenBuyer({super.key});

  @override
  State<ViewPaymentsScreenBuyer> createState() => _ViewPaymentsScreenState();
}

class _ViewPaymentsScreenState extends State<ViewPaymentsScreenBuyer> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewPaymenetsBuyerModel>.reactive(
        viewModelBuilder: () => ViewPaymenetsBuyerModel(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, child) => _body(context, model));
  }

  _body(BuildContext context, ViewPaymenetsBuyerModel model) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payments"),
      ),
      body: Stack(
        children: [
          Padding(
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
                              },
                            ),
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
                          textInputType: TextInputType.number,
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
                ),
                SizedBox(
                  height: 20.0,
                ),
                Visibility(
                  visible: model.transactions.isNotEmpty,
                  child: Expanded(
                    child: Column(
                      children: [
                        Table(
                          columnWidths: const {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(1),
                            2: FlexColumnWidth(1),
                          },
                          children: getRows(model),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          DDLoader(
            loading: model.isBusy,
          )
        ],
      ),
    );
  }

  getRows(ViewPaymenetsBuyerModel model) {
    List<TableRow> rows = [
      TableRow(
          decoration: BoxDecoration(color: Color.fromARGB(255, 185, 181, 181)),
          children: const [
            TableCell(
              child: Center(
                child: Text(
                  "Date",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TableCell(
              child: Center(
                child: Text(
                  "Amount Paid",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TableCell(
              child: Center(
                child: Text(
                  "Initial Amont",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TableCell(
                child: Center(
                    child: Text("Remaining",
                        style: TextStyle(fontWeight: FontWeight.bold)))),
          ]),
    ];
    rows.addAll(
      model.transactions.map(
        (e) => TableRow(
          decoration: BoxDecoration(color: Color.fromARGB(255, 245, 244, 244)),
          children: [
            TableCell(child: Center(child: Text(e.date.toString()))),
            TableCell(
                child: Center(child: Text("${e.amountPaid.toString()} Rs"))),
            TableCell(
                child:
                    Center(child: Text("${e.initialBalance.toString()} Rs"))),
            TableCell(child: Text("${e.remaningBalance.toString()} Rs")),
          ],
        ),
      ),
    );
    return rows;
  }
}
