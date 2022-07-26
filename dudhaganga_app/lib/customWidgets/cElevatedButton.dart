import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CElevatedButton extends StatelessWidget {
  String label;
  Function onPress;
  CElevatedButton({super.key, required this.label, required this.onPress});

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
