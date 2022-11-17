import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dudhaganga_app/constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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
    print("DONE! 1");
    try {
      await collectionReference.doc(_phoneNumber).set({
        "name": _name,
        "phone_number": _phoneNumber,
        "cow": _cow,
        "buffalo": _buffalo,
        "morning": _morning,
        "evening": _evening,
      });
      print("DONE! 2");
    } catch (e) {
      print("Error while adding farmer:$e");
      return false;
    }
    return true;
  }
}
