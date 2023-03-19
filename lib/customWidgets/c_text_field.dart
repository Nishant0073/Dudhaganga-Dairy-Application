import 'package:dudhaganga_app/constants.dart';
import 'package:flutter/material.dart';

class CTextField extends StatefulWidget {
  final String label;
  final String? hintText;
  final String? validatorText;
  final Function? onChange;
  final Function? onSave;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  const CTextField({
    super.key,
    required this.label,
    this.hintText,
    this.validatorText,
    this.onChange,
    this.onSave,
    this.validator,
    this.textEditingController,
    this.textInputType,
  });

  @override
  State<CTextField> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        keyboardType: widget.textInputType ?? TextInputType.text,
        controller: widget.textEditingController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) =>
            widget.onChange == null ? null : widget.onChange!(value),
        validator: widget.validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return widget.validatorText;
              }
              return null;
            },
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.fromLTRB(10, 5, 5, 10),
          label: Text(widget.label),
          hintText: widget.hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: useLightMode ? lightGray : blackColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: useLightMode ? lightGray : blackColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: useLightMode ? lightGray : blackColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
