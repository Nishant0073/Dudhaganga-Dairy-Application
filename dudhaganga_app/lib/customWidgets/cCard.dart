import 'package:dudhaganga_app/constants.dart';
import 'package:flutter/material.dart';

class cCard extends StatelessWidget {
  Widget child;
  cCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(8.0),
      color: themeData.backgroundColor,
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
