import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dudhaganga_app/models/farmer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:stacked/stacked.dart';
import '../../../models/transaction.dart';
import '../../../services/firebase_payment.dart';

class ViewPaymenetsModel extends BaseViewModel {
  Farmer? farmer;
  bool isShowRez = false;
  double? pendingAmount = 0;
  List<AmountTransaction> transactions = [];

  Razorpay? _razorpay;

  TextEditingController amountController = TextEditingController();
  init(Farmer? farmerTmp) async {
    setBusy(true);
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    farmer = farmerTmp;
    pendingAmount = await getFarmerPendingAmount(farmer?.phoneNumber ?? "0000");
    await getTransactionHistory(farmer?.phoneNumber ?? "0000");
    notifyListeners();
    setBusy(false);
  }

  void onPayAmountPressed() {
    isShowRez = true;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay?.clear();
  }

  void openCheckout() async {
    if (double.parse(amountController.text.toString()) >
        (pendingAmount?.toDouble() ?? 0)) {
      Fluttertoast.showToast(
          msg: "Amount should be less than ${pendingAmount?.toDouble()}");
      return;
    }
    print(
        "Enterd amount is: ${double.parse(amountController.text.toString())}");
    var options = {
      'key': 'rzp_test_NNbwJ9tmM0fbxj',
      'amount': double.parse(amountController.text.toString()) * 100,
      'name': farmer?.name,
      'description': 'Payment',
      'prefill': {'contact': farmer?.phoneNumber, 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm', 'gpay'],
      }
    };

    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    deductAmountFromFirebaseAccount();
    Fluttertoast.showToast(msg: "SUCCESS: ${response.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("ERROR: ${response.message}");
    Fluttertoast.showToast(
      msg: "ERROR: ${response.code} - ${response.message}",
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EXTERNAL_WALLET: ${response.walletName}");
  }

  void deductAmountFromFirebaseAccount() async {
    try {
      // /Dairy/Dudhaganga/Farmers/8329060009/transactions/
      String path = "/Dairy/Dudhaganga/Farmers/${farmer?.phoneNumber}/finance/";
      String pathTracnsaction =
          "Dairy/Dudhaganga/Farmers/${farmer?.phoneNumber}/transactions/";
      print(path);
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection(path);
      CollectionReference collectionReferenceTransaction =
          FirebaseFirestore.instance.collection(pathTracnsaction);
      final snapShot =
          await FirebaseFirestore.instance.collection(path).doc("amount").get();
      if (snapShot.exists) {
        print(snapShot.data());
        double prevValue = snapShot["balance"].toDouble();
        double value = double.parse(amountController.text);
        print("VALUE IS: $value");
        await collectionReference.doc("amount").set(
          {
            "balance": prevValue - value,
          },
          SetOptions(merge: false),
        );
        await collectionReferenceTransaction.doc().set({
          "amountPaid": getfiveDigitString(
              double.parse(amountController.text).toString()),
          "date":
              DateFormat('yyyy-MM-dd H:m').format(DateTime.now()).toString(),
          "remaningBalance": getfiveDigitString((prevValue - value).toString()),
          "initialBalance": getfiveDigitString(prevValue.toString()),
        });
        print("Amount updated from $prevValue to ${value + prevValue}");
      }
    } catch (e) {
      print(e);
    }
  }

  getTransactionHistory(String phoneNumber) async {
    String path = "/Dairy/Dudhaganga/Farmers/$phoneNumber/transactions/";
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(path);
    QuerySnapshot querySnapshot = await collectionReference.get();

    var allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    for (var i in allData) {
      print(i);
      transactions.add(AmountTransaction.fromJson(i as Map<String, dynamic>));
    }
    transactions.sort(((a, b) => DateFormat("yyyy-MM-dd H:m")
        .parse(a.date ?? "12/12/12 12:22")
        .compareTo(
            DateFormat("yyyy-MM-dd H:m").parse(b.date ?? "12/12/12 12:22"))));
    transactions = List.from(transactions.reversed);
    notifyListeners();
  }

  String getfiveDigitString(String string) {
    if (string.length >= 6) return string.substring(0, 6);
    return string;
  }
}
