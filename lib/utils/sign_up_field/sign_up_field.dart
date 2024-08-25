


import 'package:flutter/material.dart';
import 'package:manga/utils/constants/colors.dart';

class SignUpField extends StatelessWidget {
  const SignUpField({
    super.key,
    required this.controller,
    required this.title,
    this.required = true, required this.validateText,
  });

  final TextEditingController controller;
  final String title;
  final String validateText;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(color: MyColors.grayColor, fontSize: 18),
            ),
            required
                ? const Icon(
              Icons.star,
              size: 12,
              color: MyColors.mainColor,
            )
                : const Text('')
          ],
        ),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          cursorColor: MyColors.mainColor,
          cursorHeight: 15,
          controller: controller,
          validator: (text) {
            if (required && text!.isEmpty) {
              return validateText;
            }
            return null;
          },
          decoration: const InputDecoration(
            fillColor: Colors.white,
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: MyColors.dotColor)),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: MyColors.mainColor)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: MyColors.mainColor)),
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: MyColors.mainColor)),
          ),
        ),
      ],
    );
  }
}