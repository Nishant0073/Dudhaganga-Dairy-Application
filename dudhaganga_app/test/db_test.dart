import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';

Future<bool> testFirebase() async {
  final firestore = FakeFirebaseFirestore();
  String path = "/Dairy/Farmer/8329060009/";
  try {
    await firestore.collection(path).add({
      "name": 'Nishant',
      "phone_number": 8239060009,
      "cow": false,
      "buffalo": true,
      "morning": true,
      "evening": true,
    });
  } catch (e) {
    return false;
  }
  return true;
}

Future<void> main() async {
  await Firebase.initializeApp();
  test('Testing add farmer', () {
    expect(testFirebase(), true);
  });
}
