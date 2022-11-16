import 'package:dudhaganga_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CTextField extends StatefulWidget {
  String label;
  String? hintText;
  String? validatorText;
  Function? onChange = null;
  Function? onSave = null;
  String? Function(String?)? validator;
  CTextField({
    super.key,
    required this.label,
    this.hintText,
    this.validatorText,
    this.onChange,
    this.onSave,
    this.validator,
  });

  @override
  State<CTextField> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) =>
            widget.onChange == null ? null : widget.onChange!(value),
        validator: widget.validator == null
            ? (value) {
                if (value == null || value.isEmpty) {
                  return widget.validatorText;
                }
                return null;
              }
            : widget.validator,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.fromLTRB(10, 5, 5, 10),
          label: Text(widget.label),
          hintText: widget.hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: useLightMode ? light_gray : black_color,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
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
