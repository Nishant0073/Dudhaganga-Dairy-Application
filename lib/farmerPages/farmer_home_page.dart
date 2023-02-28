import 'package:dudhaganga_app/collectorPages/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../customWidgets/c_card.dart';
import './farmer_milk_details.dart';

class FarmerHomePage extends StatefulWidget {
  const FarmerHomePage({super.key});

  @override
  State<FarmerHomePage> createState() => _FarmerHomePageState();
}

class _FarmerHomePageState extends State<FarmerHomePage> {
  TextEditingController? dateFormController;
  TextEditingController? dateToController;
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    dateFormController = TextEditingController(
        text: DateFormat('EEE,MMM,d, ' 'yy').format(selectedDate));
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2005),
      lastDate: DateTime(2030),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        dateFormController!.text =
            DateFormat('EEE,MMM,d, ' 'yy').format(selected);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('side_bar_home'.tr),
      ),
      drawer: SideNevigationBar(),
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
                        "Date",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      )),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: dateFormController,
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
                        ),
                      )
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
                            "Todays Milk",
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
                                child: Center(child: Text("Morning")),
                              ),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      TableData(),
                      const SizedBox(
                        height: 20,
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
                                child: Center(child: Text("Evening")),
                              ),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      TableData(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              HomeCard(
                child: GestureDetector(
                    child: ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: const Icon(
                            Icons.edit_note,
                            size: 45.0,
                          )),
                      title: Text('Milk Total'.tr,
                          style: const TextStyle(
                            fontSize: 20.0,
                          )),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FarmerMilkDetailPage()));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget TableData() {
    return Table(
      children: const [
        TableRow(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 185, 181, 181)),
            children: [
              TableCell(
                  child: Center(
                      child: Text(
                "Cattle",
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
              TableCell(child: Center(child: Text("Cow"))),
              TableCell(child: Center(child: Text("2L"))),
              TableCell(child: Center(child: Text("6.5"))),
              TableCell(child: Center(child: Text("20"))),
              TableCell(child: Center(child: Text("100"))),
            ])
      ],
    );
  }
}
