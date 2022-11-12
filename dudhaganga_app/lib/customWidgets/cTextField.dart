import 'package:dudhaganga_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CTextField extends StatelessWidget {
  String label;
  String? hintText;
  String? validatorText;
  Function? onChange = null;
  Function? onSave = null;
  CTextField({
    super.key,
    required this.label,
    this.hintText,
    this.validatorText,
    this.onChange,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.0,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) => onChange == null ? null : onChange!(value),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorText;
          }
          return null;
        },
        decoration: InputDecoration(
          label: Text(label),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: useLightMode ? light_gray : black_color,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: useLightMode ? light_gray : black_color,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
