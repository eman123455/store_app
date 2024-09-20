import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.hinttext, required this.onChange ,this.type});
  final String hinttext;
  Function(String)? onChange;
  TextInputType? type;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hinttext,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
      ),
    );
  }
}
