import 'package:dudhaganga_app/collectorPages/screens/view_history/view_history_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget viewAllRecordsScreen(BuildContext context, ViewHistoryModel model) {
  return Scaffold(
    appBar: AppBar(
      title: Text('view_All_recrods'.tr),
    ),
    body: Column(
      children: [
        Table(
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(1),
          },
          children: getRows(model),
        ),
      ],
    ),
  );
}

getRows(ViewHistoryModel model) {
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
                "Time",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          TableCell(
            child: Center(
              child: Text(
                "Cattle",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          TableCell(
              child: Center(
                  child: Text("Litre",
                      style: TextStyle(fontWeight: FontWeight.bold)))),
          TableCell(
              child: Center(
                  child: Text("Fat",
                      style: TextStyle(fontWeight: FontWeight.bold)))),
          TableCell(
              child: Center(
                  child: Text("Rate",
                      style: TextStyle(fontWeight: FontWeight.bold)))),
          TableCell(
              child: Center(
                  child: Text("Total",
                      style: TextStyle(fontWeight: FontWeight.bold))))
        ]),
  ];
  rows.addAll(model.records?.map(
        (e) => TableRow(
          decoration: BoxDecoration(color: Color.fromARGB(255, 245, 244, 244)),
          children: [
            TableCell(child: Center(child: Text(e.date.toString()))),
            TableCell(child: Center(child: Text(e.time.toString()))),
            TableCell(child: Center(child: Text(e.animal.toString()))),
            TableCell(
                child: Center(
                    child: Text(getfiveDigitString(e.weight.toString())))),
            TableCell(
                child:
                    Center(child: Text(getfiveDigitString(e.fat.toString())))),
            TableCell(
                child:
                    Center(child: Text(getfiveDigitString(e.rate.toString())))),
            TableCell(
                child: Center(
                    child: Text(getfiveDigitString(e.value.toString())))),
          ],
        ),
      ) ??
      []);
  return rows;
}

String getfiveDigitString(String string) {
  if (string.length >= 5) return string.substring(0, 5);
  return string;
}
