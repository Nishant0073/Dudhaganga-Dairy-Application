import 'dart:typed_data';
import 'package:dudhaganga_app/app/db_sql.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../constants.dart';
import '../../../models/rate.dart';

class TakeRatesModel extends BaseViewModel {
  FilePickerResult? rateFile;
  bool isDataImported = false;
  init() {
    isDataImported = false;
    notifyListeners();
  }

  void onUploadTap() async {
    try {
      FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
        allowMultiple: false,
        withData: true,
      );

      /// file might be picked
      print(pickedFile?.files.first);
      if (pickedFile != null) {
        Uint8List? bytes = pickedFile.files.single.bytes;
        Excel excel = Excel.decodeBytes(bytes ?? []);
        print("HERE");
        List<Rate> rates = [];
        for (var table in excel.tables.keys) {
          print(table); //sheet Name

          Sheet sheetObject = excel[table];
          List<double> snf = [];
          for (int row = 0; row < sheetObject.maxRows; row++) {
            double fat = 0;
            for (int col = 0; col < sheetObject.row(row).length; col++) {
              //  ${sheetObject.row(row).elementAt(i)?.value}");
              if (row == 0) {
                if (col != 0) {
                  snf.add(sheetObject.row(row).elementAt(col)?.value);
                } else {
                  snf.add(0);
                }
              }
              if (col == 0 && row != 0) {
                fat = (sheetObject.row(row).elementAt(col)?.value).toDouble();
              } else {
                if (col != 0 && row != 0) {
                  rates.add(
                    Rate(
                      fat: fat,
                      snf: snf[col],
                      value: (sheetObject.row(row).elementAt(col)?.value)
                          .toDouble(),
                    ),
                  );
                }
              }
            }
          }
        }
        for (Rate rate in rates) {
          DbManager().insertModel(rate);
        }
        if (rates.isNotEmpty) {
          isDataImported = true;
        }
        notifyListeners();
      }
    } catch (e) {
      print("Read rate File: some error occured $e");
      snackbarService.showSnackbar(message: "Unable to load data from file.");
    }
  }

  void checkIsFileUploaded(BuildContext context) {
    if (isDataImported) {
      Navigator.of(context).pop();
    }
  }
}
