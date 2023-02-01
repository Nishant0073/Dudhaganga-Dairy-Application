import 'package:dudhaganga_app/constants.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatefulWidget {
  final Widget child;
  final Color color = themeData.backgroundColor;
  HomeCard({super.key, required this.child});

  @override
  State<HomeCard> createState() => CardState();
}

class CardState extends State<HomeCard> {
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
