import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    this.onChanged
  }) : super(key: key);
  final String hint;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(label: Text(hint)),
      ),
    );
  }
}
