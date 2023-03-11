// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class AddFarmerToFirebase {
  late String _name;
  late String _phoneNumber;
  late bool _cow;
  late bool _buffalo;
  late bool _morning;
  late bool _evening;

  AddFarmerToFirebase(String name, String phoneNumber, bool cow, bool buffalo,
      bool morning, bool evening) {
    print('DONE 0');
    _name = name;
    _phoneNumber = phoneNumber;
    _cow = cow;
    _buffalo = buffalo;
    _morning = morning;
    _evening = evening;
  }

  Future<bool> addNewFarmer() async {
    String path = "/Dairy/Dudhaganga/Farmers/";
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(path);
    try {
      await collectionReference.doc(_phoneNumber).set({
        "name": _name,
        "phoneNumber": _phoneNumber,
        "cow": _cow,
        "buffalo": _buffalo,
        "morning": _morning,
        "evening": _evening,
      });
      createFinanceAccount(_phoneNumber);
    } catch (e) {
      print("Error while adding farmer:$e");
      return false;
    }
    return true;
  }

  void createFinanceAccount(String phoneNumber) async {
    String path = "/Dairy/Dudhaganga/Farmers/$phoneNumber/finance/";
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(path);
    try {
      await collectionReference.doc("amount").set(
        {
          "balance": 0,
        },
      );
    } catch (e) {
      print("createFinanceAccount() $e");
    }
  }
}
