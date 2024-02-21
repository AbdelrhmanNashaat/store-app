import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? hint;
  Icon? icon;
  bool? obscurerText;
  Function(String)? onChanged;
  TextInputType? textInputType;
  CustomTextField({
    Key? key,
    required this.hint,
    required this.onChanged,
    this.icon,
    this.obscurerText = false,
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      obscureText: obscurerText!,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
