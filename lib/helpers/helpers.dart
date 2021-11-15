import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:matbahk24/Model/Field.dart';
import 'package:matbahk24/Model/User.dart';
import 'package:matbahk24/Provider/AuthProvider.dart';
import 'package:matbahk24/Provider/FieldProvider.dart';
import 'package:matbahk24/ui/driver/home_provider/home_driver_screen.dart';
import 'package:matbahk24/ui/main_screens/login_page/login_screen.dart';
import 'package:matbahk24/ui/providers/home_provider/home_provider_screen.dart';
import 'package:matbahk24/ui/user/UserAddress/MapScreen.dart';
import 'package:matbahk24/ui/user/account_transfer/first_page/Accounttransfer.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';
import 'package:matbahk24/widgets/CustomNamedPageTransition.dart';

getCounts() async {
  print('counts');
  final url = "$baseUrl/user/counts";
  final body = {"userId": currentUser.id};
  final response = await http.post(Uri.parse(url), body: body);
  print("counnts : " + response.body);
  final data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    messagesCount.value = (int.parse(data.toString().split(',')[0]));
    notificationsCount.value = (int.parse(data.toString().split(',')[1]));
  } else {}
}

String timeToPmAm(String time) {
  return DateFormat('yyyy-MM-dd  hh:mm a', 'en').format(DateTime.parse(time));
}

pushPage({context, page}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
  // Navigator.push(context,
  //     new MyCustomRoute (widget:page));
}

late String currentLocal;
LocationData locData = LocationData.fromMap({});
getLocation() async {
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  locData = await location.getLocation();
  print(locData.latitude.toString() + " lat:");
}

bool isChat = false;
var translator;

User currentUser = User();
final notificationsCount = ValueNotifier<int>(0);
final messagesCount = ValueNotifier<int>(0);
String token = "";
late String isFirstLaunch;

late String lang;
tran(str) async {
  var traString = await translator.translate(str, from: 'ar', to: 'en');
  print("transs : " + " " + traString);
  return traString.text;
}

saveToken() {
  final storage = new FlutterSecureStorage();
  storage.write(key: 'token', value: token);
  storage.write(key: 'id', value: currentUser.id);
  storage.write(key: 'role', value: currentUser.role);
}

saveValue(key, value) {
  final storage = new FlutterSecureStorage();
  storage.write(key: key, value: value);
}

isRegistered() {
  return (token != "");
}

signOut({ctx, page}) async {
  final storage = new FlutterSecureStorage();

  token = "";
  await storage.delete(key: "token");
  await storage.delete(key: "id");
  replacePage(context: ctx, page: LoginScreen());
}

removeToken() async {
  final storage = new FlutterSecureStorage();

  await storage.delete(key: "token");
}

isFirst() {
  return isFirstLaunch == null;
}

getBaseUrl() async {
  final url = "https://www.appweb.website/tall3at/public/api/base-url";
  final response = await http.get(Uri.parse(url));
  print(response.body);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    baseUrl = data.toString().split("#")[1];
    filesUrl = data.toString().split("#")[1] + "/uploads/";
  } else {}
}

readToken() async {
  // await getBaseUrl();
  try {
    final storage = new FlutterSecureStorage();
    token = (await storage.read(key: "token"))!;
    currentUser.id = (await storage.read(key: "id"))!;
    currentUser.role = (await storage.read(key: "role"))!;
    print("token : $token");
    await getUserDetail(status: 1);
  } catch (e) {}
}

replacePage({context, page}) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => page));
}

final defaultShadow = BoxShadow(
  color: Colors.black.withOpacity(0.1),
  spreadRadius: 1,
  blurRadius: 1,
  offset: Offset(0, 1), // changes position of shadow
);

pop(context) {
  Navigator.of(context).pop();
}

popMultiplePages(context, count) {
  for (int i = 0; i < count; i++) {
    Navigator.of(context).pop();
  }
}
checkUserRole(context) async {
  if (currentUser.role == "user") {
    if (currentUser.addresses.isNotEmpty) {
      replacePage(context: context, page: NavigationPage());
    } else {
      await getLocation();
      pushPage(context: context, page: MapScreen(1));
    }
  } else if (currentUser.role == "driver") {
    replacePage(context: context, page: HomeDriverScreen());
  } else if (currentUser.role == "provider") {
    await getFields();
    if (currentUser.market == null) {
      replacePage(context: context, page: AccountTransfer());
    } else
      replacePage(context: context, page: HomeProviderScreen());
  }
}



getFields() async {
  final url = "$baseUrl/get-home";
  final response = await http.get(Uri.parse(url));
  print(response.body);
  if (response.statusCode == 200) {
    fields = [];
    final data = jsonDecode(response.body);
    data['fields'].forEach((e) {
      fields.add(Field.fromJson(e));
    });
  } else {}
}

String featchedCode = "";
var baseUrl = "https://app.matbakh24.com";
var filesUrl = "https://app.matbakh24.com/uploads/";
String userRole = 'user';
var screenWidth;
var screenHeight;
//
// bool isTablet() {
//   final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
//   return data.size.shortestSide > 600;
// }
