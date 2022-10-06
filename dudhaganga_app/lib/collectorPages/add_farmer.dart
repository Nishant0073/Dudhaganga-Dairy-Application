import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/customWidgets/cElevatedButton.dart';
import 'package:dudhaganga_app/customWidgets/cTextField.dart';
import 'package:flutter/material.dart';

class AddFarmer extends StatefulWidget {
  const AddFarmer({super.key});

  @override
  State<AddFarmer> createState() => _AddFarmerState();
}

class _AddFarmerState extends State<AddFarmer> {
  final _formKey = GlobalKey<FormState>();
  bool cow = false;
  bool buffalo = false;
  bool morning = false;
  bool evening = false;
  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add Farmer'),
            content: Text("Click OK button to Add Farmer"),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  FocusScope.of(context).unfocus();
                  _formKey.currentState?.reset();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Customer Added successfully "),
                      duration: Duration(seconds: 3),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Add farmer'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CTextField(
                    label: "Name",
                    validatorText: "Please Enter name:",
                    hintText: 'Enter name here...',
                  ),
                  const SizedBox(height: 20.0),
                  CTextField(
                    label: 'Phone Number',
                    hintText: 'Eg. 9192939495',
                  ),
                  const SizedBox(height: 20.0),
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select type of milk:',
                            style: themeData.textTheme.bodyLarge,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: cow,
                                    onChanged: (bool? newValue) {
                                      setState(
                                        () {
                                          cow = newValue!;
                                        },
                                      );
                                    },
                                    shape: CircleBorder(),
                                  ),
                                  Text(
                                    "Cow",
                                    style: themeData.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: buffalo,
                                    onChanged: (bool? newValue) {
                                      setState(
                                        () {
                                          buffalo = newValue!;
                                        },
                                      );
                                    },
                                    shape: CircleBorder(),
                                  ),
                                  Text(
                                    "Buffalo",
                                    style: themeData.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select time of milk:',
                            style: themeData.textTheme.bodyLarge,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: morning,
                                    onChanged: (bool? newValue) {
                                      setState(
                                        () {
                                          morning = newValue!;
                                        },
                                      );
                                    },
                                    shape: const CircleBorder(),
                                  ),
                                  Text(
                                    "Morning",
                                    style: themeData.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: evening,
                                    onChanged: (bool? newValue) {
                                      setState(
                                        () {
                                          evening = newValue!;
                                        },
                                      );
                                    },
                                    shape: const CircleBorder(),
                                  ),
                                  Text(
                                    "Evening",
                                    style: themeData.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  CElevatedButton(
                    label: 'Add Farmer',
                    onPress: () {
                      _showMyDialog();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
