import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController? controller;
  final bool obscureText;
  final IconData? suffixIcon;

  const InputTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: Icon(icon),
        hintText: hintText,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
    );
  }
}
