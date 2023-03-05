import 'package:dudhaganga_app/select_user/select_user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../constants.dart';

class SelectUserScreen extends StatefulWidget {
  const SelectUserScreen({super.key});

  @override
  State<SelectUserScreen> createState() => _SelectUserScreen();
}

class _SelectUserScreen extends State<SelectUserScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectUserViewModel>.reactive(
      viewModelBuilder: () => SelectUserViewModel(),
      onViewModelReady: (model) => model.init(context),
      builder: (context, model, child) => _body(context, model),
    );
  }

  _body(BuildContext context, SelectUserViewModel model) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 19, 202, 59),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "I Am a",
                textAlign: TextAlign.center,
                style: splashScreenTitle,
              ),
            ),
            Center(
              child: DropdownButton<dynamic>(
                  icon: Icon(
                    Icons.keyboard_double_arrow_down,
                    color: Colors.white,
                    size: 35,
                  ),
                  itemHeight: null,
                  dropdownColor: appBaseColor,
                  hint: Text(
                    "Select user",
                    style: TextStyle(color: Colors.white),
                  ),
                  key: UniqueKey(),
                  style: TextStyle(
                      fontFamily: "Poppins",
                      backgroundColor: appBaseColor,
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                  value: model.selectedUser,
                  items: model.users.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (value) {
                    model.selectUser(value);
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () => model.onTap(context),
        child: Container(
          color: appBaseColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PhysicalModel(
              borderRadius: BorderRadius.circular(8.0),
              color: Theme.of(context).colorScheme.background,
              elevation: 12.0,
              child: Icon(
                Icons.navigate_next_rounded,
                weight: 400.0,
                size: 50.0,
                color: appBaseColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
