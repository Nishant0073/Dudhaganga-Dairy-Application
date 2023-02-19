import 'package:flutter/material.dart';

class CElevatedButton extends StatelessWidget {
  final String label;
  final Function onPress;
  const CElevatedButton(
      {super.key, required this.label, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
          const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4))),
        ),
      ),
      onPressed: () => {onPress()},
      child: Text(label),
    );
  }
}
