import 'package:dudhaganga_app/constants.dart';
import 'package:flutter/material.dart';

class cCard extends StatefulWidget {
  Widget child;
  Color color = themeData.backgroundColor;
  cCard({super.key, required this.child});

  @override
  State<cCard> createState() => _cCardState();
}

class _cCardState extends State<cCard> {
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(8.0),
      color: Theme.of(context).backgroundColor,
      elevation: 12.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.child,
      ),
    );
  }
}
