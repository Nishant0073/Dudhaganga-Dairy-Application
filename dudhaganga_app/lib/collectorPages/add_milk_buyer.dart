import 'package:dudhaganga_app/constants.dart';
import 'package:dudhaganga_app/customWidgets/cElevatedButton.dart';
import 'package:dudhaganga_app/customWidgets/cTextField.dart';
import 'package:flutter/material.dart';

class AddMilkBuyer extends StatefulWidget {
  const AddMilkBuyer({super.key});

  @override
  State<AddMilkBuyer> createState() => _AddMilkBuyer();
}

class _AddMilkBuyer extends State<AddMilkBuyer> {
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
            title: const Text('Add Milk Buyer'),
            content: Text("Click OK button to Add Milk Buyer"),
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
        title: Text('Add Milk Buyer'),
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
