import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:matbahk24/helpers/constans.dart';

class TextFields extends StatelessWidget {
  final lable;
  final width;
  final int height;
  final int radius;
  final initialValue;
  final int maxLines;
  final keyboard;
  final int horizontalMargin;
  final bgColor;
  final action;
  final expands;
  final maxLength;
  final validator;
  var onChange;
  FocusNode _focus = new FocusNode();
  final suffIcon;
  final icon;
  final bool isHidden;
  final formator;

  TextFields(
      {this.lable,
      this.keyboard,
      this.expands = true,
      this.maxLines = 1,
        this.maxLength = 1000,
      this.initialValue,
      this.action = TextInputAction.done,
      this.onChange,
      this.horizontalMargin = 35,
      this.bgColor = Colors.white,
      this.suffIcon,
      this.radius = 50,
      this.height = 60,
      this.isHidden = false,
      this.icon,
      this.validator,
      this.width,
      this.formator});

  final FocusNode _nodeText = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin.toDouble()),
      height: height.toDouble(),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius.toDouble())),
      child: Theme(
        data: Theme.of(context).copyWith(
          accentColor: KHomeColor,
        ),
        child: TextFormField(
          // focusNode: _focus,
          maxLines: maxLines,
          maxLength: maxLength,

          onChanged: onChange,
          // textInputAction:action,
          textInputAction: TextInputAction.done,

          initialValue: initialValue,
          validator: (v) {
            if (validator != null) validator(v);
            if (v.toString().isEmpty) {
              return "";
            }
            // if (keyboard == TextInputType.number && !isInt(v.toString())) {
            //   return "";
            // }
            return null;
          },
            
          keyboardType: keyboard,
          textAlign: TextAlign.start,
          obscureText: isHidden,
          inputFormatters: (keyboard == TextInputType.number ||
                  keyboard == TextInputType.phone)
              ? [
                  FilteringTextInputFormatter.allow(
                    RegExp("[0-9]"),
                  ),
                  FilteringTextInputFormatter.deny(
                    RegExp("[٠-٩]"),
                  ),
                ]
              : formator,
          decoration: new InputDecoration(
            counterText:'' ,
        counterStyle: TextStyle(fontSize: 1),

        border: new OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius.toDouble()),

    ),
                borderSide: BorderSide(color: Colors.grey, width: 0.2)),
            enabledBorder: new OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(radius.toDouble())),
                borderSide: BorderSide(color: Color(0xFF8A8D90), width: 0.2)),
            errorBorder: new OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(radius.toDouble())),
                borderSide: BorderSide(color: Colors.red, width: 0.8)),
            focusedErrorBorder: OutlineInputBorder(
              
                borderRadius:
                    BorderRadius.all(Radius.circular(radius.toDouble())),
                borderSide: BorderSide(color: Colors.red, width: 0.8)),
            focusedBorder: new OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius.toDouble()),
                ),
                borderSide: BorderSide(color: KHomeColor, width: 0.8)),
            hintStyle: new TextStyle(color: Color(0xFF8A8D90), fontSize: 11),
            hintText: lable,
            labelStyle: new TextStyle(color: Color(0xFF8A8D90), fontSize: 11),
            errorStyle: TextStyle(fontSize: 1,height: 0),
            contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 20)
          ),
        ),
      ),
    );
  }
}
