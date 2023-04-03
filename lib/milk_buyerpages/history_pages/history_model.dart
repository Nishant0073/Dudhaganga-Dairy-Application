import 'dart:io';
import 'dart:math';
import 'package:dudhaganga_app/models/milk_buyer.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../collectorPages/screens/view_history/pdf_viewer.dart';
import '../../constants.dart';
import '../../models/milk_record.dart';
import '../../services/records.dart';
import '../../services/sell_milk.dart';

class HistoryModelBuyer extends BaseViewModel {
  String? phoneNumber;
  MilkBuyer? milkBuyer;
  List<SellRecord>? srecords = [];
  TextEditingController monthController = TextEditingController();
  final List<String> months =
      List.generate(12, (index) => (index + 1).toString().padLeft(2, '0'));
  bool isVisiblePdfFile = false;
  late String cmonth;
  late String cyear;
  late File billFile;
  // ignore: prefer_typing_uninitialized_variables
  late var font;
  // ignore: prefer_typing_uninitialized_variables
  late var ttf;

  DateTime? selectedDate;
  init() async {
    setBusy(true);
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/bill.pdf';
    billFile = File(path);

    print(billFile);
    final mainPrefs = await SharedPreferences.getInstance();
    phoneNumber = mainPrefs.getString(userCn);
    // print("$phoneNumber ${milkBuyer?.name}");
    milkBuyer = await getMilkBuyer(phoneNumber);
    srecords = await getMilkRecordsOfEachBuyer(phoneNumber ?? "0");
    for (var i in srecords ?? []) {
      print(i.date);
    }

    font = await rootBundle.load("assets/fonts/Poppins-Regular.ttf");
    ttf = Font.ttf(font);
    setBusy(false);
    notifyListeners();
  }

  void selectDate(BuildContext context) async {
    selectedDate = await showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    );

    monthController.text =
        "${(selectedDate?.month.toString() ?? "1").tr} ${selectedDate?.year.toString()}";
    notifyListeners();
  }

  void onGoPressed(BuildContext context) {
    if (selectedDate?.month == null || selectedDate?.year == null) {
      Fluttertoast.showToast(msg: "Please select valid month and year");
      return;
    }
    setBusy(true);
    isVisiblePdfFile = false;

    cmonth = (selectedDate?.month.toString() ?? "");
    if (cmonth.length == 1) {
      cmonth = "0$cmonth";
    }
    cyear = (selectedDate?.year.toString() ?? "");
    cyear = cyear.substring(2, 4);

    List<SellRecord> currentMonthBill = [];

    for (var e in srecords ?? []) {
      List<String> sdate = e.date.split("-");
      String smonth = sdate[1];
      String syear = sdate[2];

      if (cyear == syear && cmonth == smonth) {
        currentMonthBill.add(e);
      }
    }

    if (currentMonthBill.isEmpty) {
      Fluttertoast.showToast(msg: "No records found in this month!");
    } else {
      generatePDFSell(currentMonthBill, context);
    }

    setBusy(false);
  }

  String getfiveDigitString(String string) {
    if (string.length >= 7) return string.substring(0, 7);
    return string;
  }

  void generatePDFSell(
      List<SellRecord> currentMonthBill, BuildContext context) async {
    final pdf = pw.Document();
    double valueTotal = 0;
    double weightTotal = 0;
    for (var i in currentMonthBill) {
      valueTotal += double.parse(i.value ?? "0");
      weightTotal += double.parse(i.weight ?? "0");
    }

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  "${'milk_buyer'.tr}.: ${milkBuyer?.name}\n",
                  style: pw.TextStyle(
                    font: ttf,
                  ),
                ),
                pw.SizedBox(height: 10.0),
                pw.Text(
                  "${'month_year'.tr}: ${(selectedDate?.month.toString() ?? "1").tr} $cyear\n",
                  style: pw.TextStyle(
                    font: ttf,
                  ),
                ),
                pw.SizedBox(height: 20.0),
                pw.Table(children: getDataSell(currentMonthBill)),
                pw.SizedBox(height: 20.0),
                pw.Text(
                  "\n${'total_bill_price'.tr}: Rs.${getfiveDigitString(valueTotal.toString())}\n",
                  style: pw.TextStyle(
                    font: ttf,
                  ),
                ),
                pw.SizedBox(height: 10.0),
                pw.Text(
                  "${'total_milk_collected'.tr}: $weightTotal Kg",
                  style: pw.TextStyle(
                    font: ttf,
                  ),
                ),
              ],
            ),
          ); // Center
        },
      ),
    ); // Page

    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    final String dir = (await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS));

    final String path =
        '$dir/bill${milkBuyer?.name?.replaceAll(" ", '')}-$cyear-$cmonth-${Random().nextInt(100000)}.pdf';
    final File file = File(path);
    await file.writeAsBytes(await pdf.save());
    billFile = file;
    isVisiblePdfFile = true;
    print("FILE SAVED");
    Fluttertoast.showToast(
        msg: "File Saved at $path", toastLength: Toast.LENGTH_LONG);
    // ignore: use_build_context_synchronously
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PdfViewerScreen(file: file)));
    notifyListeners();
  }

  getDataSell(List<SellRecord> currentMonthBill) {
    List<pw.TableRow> currentBill = [
      pw.TableRow(
        children: [
          pw.Text(
            "date".tr,
            style: pw.TextStyle(
              font: ttf,
              fontBold: Font.timesBold(),
            ),
          ),
          pw.Text(
            "time".tr,
            style: pw.TextStyle(
              font: ttf,
              fontBold: Font.timesBold(),
            ),
          ),
          pw.Text(
            "litre".tr,
            style: pw.TextStyle(
              font: ttf,
              fontBold: Font.timesBold(),
            ),
          ),
          pw.Text(
            "rate".tr,
            style: pw.TextStyle(
              font: ttf,
              fontBold: Font.timesBold(),
            ),
          ),
          pw.Text(
            "total".tr,
            style: pw.TextStyle(
              font: ttf,
              fontBold: Font.timesBold(),
            ),
          ),
        ],
      )
    ];

    currentBill.addAll(currentMonthBill
        .map((e) => pw.TableRow(children: [
              pw.Text(
                e.date.toString(),
                style: pw.TextStyle(
                  font: ttf,
                ),
              ),
              pw.Text(
                e.time.toString() == "morning" ? "morning".tr : "evening".tr,
                style: pw.TextStyle(
                  font: ttf,
                ),
              ),
              pw.Text(
                getfiveDigitString(
                  e.weight.toString(),
                ),
                style: pw.TextStyle(
                  font: ttf,
                ),
              ),
              pw.Text(
                "${getfiveDigitString(e.rate.toString())} Rs",
                style: pw.TextStyle(
                  font: ttf,
                ),
              ),
              pw.Text(
                "${getfiveDigitString(e.value.toString())} Rs",
                style: pw.TextStyle(
                  font: ttf,
                ),
              ),
            ]))
        .toList());
    return currentBill;
  }
}
