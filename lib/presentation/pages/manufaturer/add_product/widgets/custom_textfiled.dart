import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.onChanged,
      this.isParagarph = false})
      : super(key: key);
  final String hint;
  final TextEditingController controller;
  final bool isParagarph;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: onChanged,
        keyboardType: isParagarph ? TextInputType.multiline : null,
        maxLines: isParagarph ? 3 : null,
        maxLength: isParagarph ? 200 : null,
        controller: controller,
        decoration: InputDecoration(labelText: hint),
      ),
    );
  }
}
