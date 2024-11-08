import 'package:flutter/material.dart';

class CustomTextFormfield extends StatelessWidget {
  const CustomTextFormfield({
    super.key,
    this.controller,
    required this.fieldTitle,
    this.validator, this.prefix,
  });
  final TextEditingController? controller;
  final String fieldTitle;
  final String? Function(String?)? validator;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: fieldTitle,
        prefix: prefix,
      ),
    );
  }
}
