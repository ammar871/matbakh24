import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matbahk24/Model/Driver.dart';
import 'package:matbahk24/Model/Field.dart';
import 'package:matbahk24/Model/Market.dart';
import 'package:matbahk24/Model/User.dart';
import 'package:matbahk24/helpers/Functions.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/driver/home_provider/home_driver_screen.dart';
import 'package:matbahk24/ui/main_screens/validate_number/validte_number_screen.dart';
import 'package:matbahk24/ui/providers/home_provider/home_provider_screen.dart';
import 'package:matbahk24/ui/user/UserAddress/MapScreen.dart';
import 'package:matbahk24/ui/user/account_transfer/first_page/Accounttransfer.dart';
import 'package:matbahk24/ui/user/account_transfer/success_transfer/success_transfer.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';
import 'package:matbahk24/widgets/loading.dart';

import 'FieldProvider.dart';
class Auth extends ChangeNotifier {
  var code;
  checkUser({phone, context,onComplete}) async {
    showLoadingDialog(context);
    var jsoMap = Map();
    print(phone);
    jsoMap['phone'] = phone;
    // notifyListeners();
    final url = "$baseUrl/auth/check-username";
    final response = await http.post(Uri.parse(url), body: jsoMap);
    print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      pop(context);
      onComplete(data['status'],data["code"]);
      code = data["code"];
    } else {
      print(response.body);
      pop(context);
    }
    notifyListeners();
  }

  login({phone, code, context, onFaild}) async {
    showLoadingDialog(context);
    var jsoMap = Map();
    jsoMap['userName'] = phone;
    jsoMap['code'] = code;
    notifyListeners();
    final url = "$baseUrl/auth/confirm-code";
    final response = await http.post(Uri.parse(url), body: jsoMap);
    if (response.statusCode == 200) {
      pop(context);
      checkAuthintication(response, context);
    } else {
      pop(context);
      onFaild();
    }
  }

  checkAuthintication(response, context) async {
    final data = jsonDecode(response.body);
    token = "Bearer " + data["token"];
    currentUser = User.fromJson(data);

    if(data['market']!=null) currentUser.market = Market.fromJson(data['market']);
    if(data['driver']!=null) currentUser.driver = Driver.fromJson(data['driver']);
    await saveToken();
    await getUserDetail(status: 1);

    if(data['user']['role']=="user"){
      if(currentUser.addresses.isNotEmpty){
        replacePage(context: context, page: NavigationPage());
      }else{
        replacePage(context: context, page: MapScreen(1));
      }
    }else if(data['user']['role']=="driver"){
      replacePage(context: context, page: HomeDriverScreen());
    }else if(data['user']['role']=="provider"){

      if(currentUser.market==null){
        await getFields();
        replacePage(context: context, page: AccountTransfer());
      }else
      replacePage(context: context, page: HomeProviderScreen());
    }
  }

  getFields() async {
    final url = "$baseUrl/get-home";
    final response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {

      fields=[];
      final data= jsonDecode(response.body);
      data['fields'].forEach((e){
        fields.add(Field.fromJson(e));
      });

    } else {
    }
  }

 registerUser({context,userToRegister,type}) async {
   var jsonMap = Map();
   jsonMap['userName'] = userToRegister.userName;
   jsonMap['fullName'] = userToRegister.fullName;
   jsonMap['email'] = userToRegister.email;

    if(type==2){
      jsonMap['identityNumber'] = userToRegister.identityNumber;
     if(userToRegister.identityImage!=null) jsonMap['identityImage'] = userToRegister.identityImage;
      jsonMap['ibanNumber'] = userToRegister.ibanNumber;
      if(userToRegister.profileImage!=null) jsonMap['profileImage'] = userToRegister.profileImage;
    }

   jsonMap['role'] = type==1?"user":"provider";
   final url = "$baseUrl/auth/signup";
   final response = await http.post(Uri.parse(url), body: jsonMap);
   print(response.body);
   if (response.statusCode == 200) {
         pop(context);
         final data= jsonDecode(response.body);
         code = data["code"];
         pushPage(context: context,page: ValidateNumberScreen(username: userToRegister.userName, code: data['code'].toString(),));
   } else {
     pop(context);
   }
 }

  registerDriver({context, userToRegister,type}) async {
    var jsonMap = Map();
    jsonMap['userName'] = userToRegister.userName;
    jsonMap['fullName'] = userToRegister.fullName;
    jsonMap['email'] = userToRegister.email;
    jsonMap['role'] = "driver";
    jsonMap['ibanNumber'] = userToRegister.ibanNumber;
    jsonMap['identityNumber'] = userToRegister.identityNumber;
    jsonMap['profileImage'] = userToRegister.profileImage;
    jsonMap['identityImage'] = userToRegister.identityImage;
    jsonMap['carImage'] = userToRegister.carImage;
    final url = "$baseUrl/auth/driver-signup";
    final response = await http.post(Uri.parse(url), body:jsonMap);
    print(response.body);
    if (response.statusCode == 200) {
      pop(context);
      final data= jsonDecode(response.body);
      code = data["code"];
      pushPage(context: context,page: ValidateNumberScreen(username: userToRegister.userName, code: data['code'].toString(),));
    } else {
      pop(context);
    }
  }
  validate({userToValidate,context,type}) async {
    if((type==3)&&(userToValidate.profileImage==null||userToValidate.ibanNumber==null||userToValidate.identityNumber==null||userToValidate.identityImage==null)){
      if(type==3&&userToValidate.carImage==null){
        HelperFunctions.slt.notifyUser(context: context,message: "الرجاء إدخال كامل البيانات والصور المطلوبة",color: Colors.red);

        return;
      }
      HelperFunctions.slt.notifyUser(context: context,message: "الرجاء إدخال كامل البيانات والصور المطلوبة",color: Colors.red);
      return;
    }
    showLoadingDialog(context);
    var jsoMap = Map();
    jsoMap['userName'] = userToValidate.userName;
    jsoMap['email'] = userToValidate.email;
    final url = "$baseUrl/auth/validate";
    final response = await http.post(Uri.parse(url), body: jsoMap);
    print(response.body);
    if (response.statusCode == 200) {
      pop(context);
      if(response.body=="success"){
        if(type==1||type==2){
          registerUser(context: context,userToRegister: userToValidate,type: type);
        }else{
          registerDriver(context: context,userToRegister: userToValidate,type: type);
        }
      }else{
        HelperFunctions.slt.notifyUser(context: context,message: response.body.toString(),color: Colors.red);
      }
    } else {
      pop(context);
    }
  }


  updateMarket({context, params}) async {
    showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    final url = "$baseUrl/market/update";
    final response = await http.post(Uri.parse(url), body: params,headers: headers);
    print(response.body);
    pop(context);

    if (response.statusCode == 200) {
      getUserDetail(context:context,status:1);
      pushPage(context: context,page:SuccessTransfer());
    } else {
      // pop(context);
    }
    notifyListeners();
  }
  registerMarket({context, params}) async {
    showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    final url = "$baseUrl/market/add";
    final response = await http.post(Uri.parse(url), body: params,headers: headers);
    print(response.body);
    pop(context);

    if (response.statusCode == 200) {
      getUserDetail(context:context,status:1);
      pushPage(context: context,page:SuccessTransfer());
    } else {
      // pop(context);
    }
  }

}



UpdateDeviceToken() async {
  await Firebase.initializeApp();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String? firetoken = await _firebaseMessaging.getToken();
  var jsoMap = Map();
  jsoMap['token'] = firetoken;
  jsoMap['userId'] = currentUser.id.toString();
  final headers = {"Authorization": token};
  final url = "$baseUrl/auth/update-deviceToken";
  final response =
  await http.post(Uri.parse(url), body: jsoMap, headers: headers);
  print(response.body);
  if (response.statusCode == 200) {
  } else {
    print(response.body);
  }
}

getUserDetail({context, status}) async {
  if(status==0) showLoadingDialog(context);
  var jsoMap = Map();
  jsoMap['id'] = currentUser.id;
  final url = "$baseUrl/auth/user/detail";
  final response = await http.post(Uri.parse(url), body: jsoMap);
  print(response.body);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    currentUser = User.fromJson(data);
    print(currentUser.fullName);
    UpdateDeviceToken();

  } else {
    signOut(ctx:context);
  }
  if(status==0) pop(context);

}