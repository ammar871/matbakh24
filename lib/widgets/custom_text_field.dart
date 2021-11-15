import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final double hieght;

  final bool? isTextObscured;
  final String? Function(String?)? validator;
  final myTextController;

  CustomTextField(
      {required this.controller,
      required this.hint,
      this.isTextObscured,
      this.validator,
      this.myTextController,
      required this.hieght});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hieght,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(35)),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: (value) {
          return null;
        },

        controller: controller,
        validator: validator,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontFamily: 'home',
          fontSize: 14.5,
          color: const Color(0x99000000),
          height: 2.2,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          hintText: hint,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
