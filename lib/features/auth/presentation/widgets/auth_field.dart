import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObsecureText;
  const AuthField({super.key, required this.hintText, this.isObsecureText = false, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscuringCharacter: "*",
      obscureText: isObsecureText,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return '$hintText is missing!';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
