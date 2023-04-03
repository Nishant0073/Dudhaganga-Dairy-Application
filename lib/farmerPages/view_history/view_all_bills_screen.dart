import 'package:dudhaganga_app/customWidgets/c_elevated_button.dart';
import 'package:dudhaganga_app/farmerPages/view_history/view_history_model.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

Widget viewAllBillsScreen(BuildContext context, ViewHistoryModelFarmer model) {
  return Scaffold(
    appBar: AppBar(
      title: Text("View All Bills"),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50.0,
                width: 260,
                child: TextField(
                  readOnly: true,
                  onTap: () {
                    model.selectDate(context);
                  },
                  controller: model.monthController,
                  decoration: InputDecoration(
                    label: Text("Select Month"),
                    hintText: "Select Month",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: useLightMode ? lightGray : blackColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: useLightMode ? lightGray : blackColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: useLightMode ? lightGray : blackColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              CElevatedButton(
                  label: "GO",
                  onPress: () {
                    model.onGoPressed(context);
                  }),
            ],
          ),
          // Visibility(
          //   visible: model.isVisiblePdfFile,
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: SingleChildScrollView(
          //       child: SizedBox(
          //         height: 500,
          //         width: double.maxFinite,
          //         child: SfPdfViewer.file(model.billFile),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    ),
  );
}
