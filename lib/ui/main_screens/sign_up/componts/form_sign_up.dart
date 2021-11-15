import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/main_screens/validate_number/validte_number_screen.dart';
import 'package:matbahk24/widgets/default_button.dart';

class FormSignUp extends StatefulWidget {
  @override
  _FormSignUpState createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  final _formKey = GlobalKey<FormState>();

  late String codeCountry;
  late String phone;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: KTextColor.withOpacity(.5)),
                ),
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CircleAvatar(
                          radius: 20.0,
                          child: Image.asset("assets/images/flag.png"),
                        )),
                    Text(
                      'السعودية +965',
                      style: TextStyle(
                        fontFamily: 'home',
                        fontSize: 16,
                        color: const Color(0xff878787),
                        letterSpacing: 0.8,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildTextFieldPhone(),
              SizedBox(
                height: 20,
              ),
              DefaultButton(
                colorText: Color(0xffffffff),
                height: 50,
                text: "التالى ".tr(),
                onPress: () {
                  Navigator.of(context).pushNamed(ValidateNumberScreen.id);
                },
                color: KHomeColor,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }

  Container buildTextFieldPhone() {
    return Container(
      height: 50,
      child: TextFormField(
        onSaved: (newValue) => phone = newValue!,
        keyboardType: TextInputType.phone,
        onChanged: (value) {
          setState(() {
            phone = value;
          });
          return null;
        },
        validator: (value) {
          return null;
        },
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: "home", fontSize: 15, color: KTextColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintText: "رقم الجوال ".tr(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
