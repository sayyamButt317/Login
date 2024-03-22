import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    this.cursorColor = Colors.black,
    this.labelText,
    this.hintText,
    this.labelStyle,
    this.prefixIcon,
    this.enabledBorder,
    this.focusedBorder,
    required InputDecoration decoration,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Color? cursorColor;
  final String? labelText;
  final String? hintText;
  final TextStyle? labelStyle;
  final IconData? prefixIcon;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: cursorColor ,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        labelStyle: labelStyle ??
            const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
        prefixIcon: prefixIcon != null
            ? Icon(
          prefixIcon,
          color: Colors.black,
          size: 18,
        )
            : null,
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
      ),
    );
  }
}
