import 'package:dudhaganga_app/collectorPages/side_bar.dart';
import 'package:dudhaganga_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../customWidgets/c_Card.dart';
import 'package:intl/intl.dart';
import '../customWidgets/c_elevated_Button.dart';

class FarmerMilkDetailPage extends StatefulWidget {
  const FarmerMilkDetailPage({super.key});

  @override
  State<FarmerMilkDetailPage> createState() => _FarmerMilkDetailPageState();
}

class _FarmerMilkDetailPageState extends State<FarmerMilkDetailPage> {
  TextEditingController? DateFromcontroller;
  TextEditingController? DateTocontroller;
  DateTime SelectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    DateFromcontroller = TextEditingController(
        text: DateFormat(' d MMM, ' 'yy').format(SelectedDate));
    DateTocontroller = TextEditingController(
        text: DateFormat(' d MMM, ' 'yy').format(SelectedDate));
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: SelectedDate,
      firstDate: DateTime(2005),
      lastDate: DateTime(2030),
    );
    if (selected != null && selected != SelectedDate) {
      setState(() {
        SelectedDate = selected;
        DateFromcontroller!.text = DateFormat(' d MMM, ' 'yy').format(selected);
      });
    }
  }

  _selectToDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: SelectedDate,
      firstDate: DateTime(2005),
      lastDate: DateTime(2030),
    );
    if (selected != null && selected != SelectedDate) {
      setState(() {
        SelectedDate = selected;

        DateTocontroller!.text = DateFormat(' d MMM, ' 'yy').format(selected);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Milk Detail"),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeCard(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                          child: Text(
                        "From",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      )),
                      SizedBox(width: 10),
                      Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: DateFromcontroller,
                            cursorColor: Colors.black,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: "Date",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              fillColor: Colors.black,
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 2,
                              ),
                            ),
                          )),
                      SizedBox(width: 15),
                      const Expanded(
                          child: Text(
                        "To",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      )),
                      Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: DateTocontroller,
                            cursorColor: Colors.black,
                            style: TextStyle(
                              color: Colors.black,
                              // fontSize: 12,
                            ),
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: "Date",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _selectToDate(context);
                                },
                                child: const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              fillColor: Colors.black,
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 2,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              HomeCard(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.black)),
                                  color: Color.fromARGB(255, 235, 235, 235)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text("Milk Details")),
                              ),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      milkDetailtable(),
                      const SizedBox(
                        height: 27,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Total Litre : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            "5 L",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Total Amount :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            "100 Rs",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget milkDetailtable() {
    return Table(
      columnWidths: {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
      },
      children: const [
        TableRow(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 185, 181, 181)),
            children: [
              TableCell(
                  child: Center(
                      child: Text(
                "Date",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))),
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
        TableRow(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 245, 244, 244)),
            children: [
              TableCell(child: Center(child: Text("17-02-2023"))),
              TableCell(child: Center(child: Text("5"))),
              TableCell(child: Center(child: Text("6.5"))),
              TableCell(child: Center(child: Text("20"))),
              TableCell(child: Center(child: Text("100"))),
            ])
      ],
    );
  }
}
