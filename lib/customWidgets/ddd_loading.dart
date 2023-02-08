import 'package:dudhaganga_app/constants.dart';
import 'package:flutter/material.dart';

class DDLoader extends StatelessWidget {
  final bool? loading;
  const DDLoader({this.loading, super.key});

  @override
  Widget build(BuildContext context) {
    return loading ?? false
        ? Container(
            color: appBaseColor.withOpacity(0.1),
            height: ssheight,
            width: sswidth,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            ),
          )
        : Container();
  }
}
