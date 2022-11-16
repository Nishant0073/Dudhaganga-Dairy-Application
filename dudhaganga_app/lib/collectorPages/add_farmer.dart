import 'package:dudhaganga_app/collectorPages/database_pages/db_add_farmer.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String name;
  late String phoneNumber;
  bool cow = false;
  bool buffalo = false;
  bool morning = false;
  bool evening = false;
  bool milkTypeWarn = false;
  bool milkTimeWarn = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add Farmer'),
            content: const Text("Click OK button to Add Farmer"),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: const Text('OK'),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    FocusScope.of(context).unfocus();
                    if (this._formKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                      AddFarmerToFirebase addFarmerToFirebase =
                          AddFarmerToFirebase(name, phoneNumber, cow, buffalo,
                              morning, evening);
                      // try {
                      await addFarmerToFirebase.addNewFarmer().then((value) {
                        const snackBar = SnackBar(
                          content: Text("Farmer Added Successfully!"),
                          duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        setState(() {
                          loading = false;
                          _formKey.currentState!.reset();
                          cow = false;
                          morning = false;
                          evening = false;
                          buffalo = false;
                        });

                        return null;
                      }).catchError((error) {
                        print('MY ERROR: $error');
                        const snackBar = SnackBar(
                          content: Text("Unable to add Customer!"),
                          duration: Duration(seconds: 3),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        setState(() {
                          loading = false;
                        });
                      });
                    }
                  }),
            ],
          );
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Add farmer'),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Padding(
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
                        validatorText: "Please Enter name!",
                        hintText: 'Enter name here...',
                        onChange: (value) {
                          name = value;
                        },
                        onSave: (value) {
                          name = value;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      CTextField(
                        label: 'Phone Number',
                        hintText: 'Eg. 9192939495',
                        onChange: (value) {
                          phoneNumber = value;
                        },
                        validator: (String? value) {
                          String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                          RegExp regExp = new RegExp(pattern);
                          if (value == null) {
                            return 'Please enter mobile number';
                          } else if (!regExp.hasMatch(value) ||
                              value.length != 10) {
                            return 'Please enter valid mobile number';
                          }
                          return null;
                        },
                        onSave: (value) {
                          phoneNumber = value;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                              milkTypeWarn = false;
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
                                              milkTypeWarn = false;
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
                          milkTypeWarn
                              ? const Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: const Text(
                                    "*Milk type required!",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              : const Text(
                                  '',
                                  style: TextStyle(fontSize: 0),
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
                                              milkTimeWarn = false;
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
                                              milkTimeWarn = false;
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
                              milkTimeWarn
                                  ? const Text(
                                      "*Time of milk is required!",
                                      style: TextStyle(color: Colors.red),
                                    )
                                  : const Text(
                                      '',
                                      style: TextStyle(fontSize: 0),
                                    ),
                            ],
                          ),
                        ],
                      ),
                      CElevatedButton(
                        label: 'Add Farmer',
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            if (!cow && !buffalo) {
                              setState(() {
                                milkTypeWarn = true;
                              });
                            } else if (!morning && !evening) {
                              setState(() {
                                milkTimeWarn = true;
                              });
                            } else {
                              _showMyDialog();
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(),
        ],
      ),
    );
  }
}
