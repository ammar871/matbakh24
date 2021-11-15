import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/widgets/default_button.dart';
import 'package:matbahk24/widgets/loading.dart';
import 'package:matbahk24/widgets/textfields.dart';

class ContactUs extends StatelessWidget {
  final color;
  ContactUs(this.color);
  String message="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30,right: 25,left: 25),
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
              IconButton(
                  onPressed: () {
                    pop(context);
                  },
                  icon: Icon(Icons.close,size: 30,)),

              Container(
                  height: 70,
                  width: 70,
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 0.2,color: KBluColor)
                  ),

                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('assets/images/applogo.png',height: 50,width: 50,fit: BoxFit.cover,))
              ),
              SizedBox(width: 70,)
        ],
      ),

              SizedBox(height: 70,),

              TextFields(
                  lable: "اكتب هنا نص رسالتك",
                  maxLines: 10,
                  horizontalMargin: 0,
                  onChange: (v) {
                    message = v.toString();

                  },
                  radius: 27,
                  height: 400),
              SizedBox(
                height: 30,
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 5, left: 25, right: 25),
                  child: DefaultButton(
                      height: 50,
                      text: "إرسال الرسالة".tr(),
                      onPress: () {



                          if(message.trim()!=""){
                            showLoadingDialog(context);
                            Future.delayed(const Duration(milliseconds: 1000), () {

                              pop(context);
                              showGeneralDialog(
                                barrierLabel: "Barrier",
                                barrierDismissible: false,
                                barrierColor: Colors.black.withOpacity(0.5),
                                transitionDuration: Duration(milliseconds: 400),
                                context: context,
                                pageBuilder: (_, __, ___) {
                                  return AlertDialog(
                                    backgroundColor: Colors.transparent,

                                    contentPadding: EdgeInsets.all(0),
                                    content: Container(
                                      height: 340,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        color: color,

                                        borderRadius: BorderRadius.circular(30),

                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 30,),

                                          Container(
                                            height:70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(width: 3,color: Colors.green),
                                                borderRadius: BorderRadius.circular(100)

                                            ),
                                            child: Icon(Icons.check,color: Colors.green,size: 55,),
                                          ),
                                          SizedBox(height: 15,),
                                          Text(
                                            "شكرا لك !".tr(),
                                            style: TextStyle(
                                              fontFamily: 'home',
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              letterSpacing: 0.15000000953674317,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Text(
                                              "تم إرسال رسالتك ، سيتم التواصل معكم في أقرب وقت ممكن".tr(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'home',
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,

                                                color: Colors.black,
                                                letterSpacing: 0.15000000953674317,
                                              ),
                                            ),
                                          ),
                                          Container(
                                              width: 100,
                                              child: DefaultButton(

                                                  height: 35,

                                                  text: "حسنا".tr(),
                                                  onPress: () {

                                                    pop(context);
                                                    pop(context);

                                                  },
                                                  color: Colors.black,
                                                  colorText: Colors.white)),



                                        ],
                                      ),
                                    ),
                                  );
                                },
                                transitionBuilder: (_, anim, __, child) {
                                  return SlideTransition(
                                    position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
                                    child: child,
                                  );
                                },
                              );
                            });

                          }


                      },
                      color: color,
                      colorText: Colors.white)),
              SizedBox(
                height: 70,
              ),
            ],
          )),
    );
  }
}
