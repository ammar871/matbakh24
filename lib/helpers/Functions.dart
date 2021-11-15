import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matbahk24/widgets/loading.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'constans.dart';
import 'helpers.dart';

class HelperFunctions {
  static HelperFunctions slt = HelperFunctions();
  notifyUser({context, message, color, bool isNeedPop = false}) {
    Flushbar(
      padding: EdgeInsets.all(30),
      flushbarStyle: FlushbarStyle.GROUNDED,
      flushbarPosition: FlushbarPosition.TOP,
      message: message,
      duration: Duration(seconds: 3),
      backgroundColor: KHomeColor,
      animationDuration: Duration(milliseconds: 400),
      leftBarIndicatorColor: color,
    )..show(context).whenComplete(() {
        if (isNeedPop) pop(context);
      });
  }

  getUserAddress(latitude,longitude) async {//call this async method from whereever you need
    final coordinates = new Coordinates(
        latitude, longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(
        coordinates);
    var first = addresses.first;
    print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
    return "${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName}";
  }


   showDialog(context,child) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 200),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: child
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  Future<dynamic> uploadImage(file, modle, modleId,context) async {
    showLoadingDialog(context);
    final url = "${baseUrl}/image/upload";
    var request = http.MultipartRequest("POST", Uri.parse(url));
    Map<String, String> params = {'modle': modle, };
    if(modleId!=null)params['modleId']=modleId;
    request.fields.addAll(params);
    var multipartFile = await http.MultipartFile.fromPath(
      "file",
      file.path,
    );
    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();
    var postBody = await http.Response.fromStream(response);
    pop(context);
    if (response.statusCode == 200) {
      return postBody.body.toString();
    } else {
      return "a.jpg";
    }
  }

  Future getImage(modle, modleId,context) async {

    final picker = ImagePicker();

    final pickedFile = await picker.getImage(source: ImageSource.gallery,);
    if (pickedFile != null) {
    var  _image = File(pickedFile.path);
   String image = await uploadImage(_image, modle, modleId,context);
   return image;
    } else {
      print('No image selected.');
    }
  }

  openGoogleMapLocation(lat, lng) async {
    String mapOptions = [
      'saddr=${locData.latitude},${locData.longitude}',
      'daddr=$lat,$lng',
      'dir_action=navigate'
    ].join('&');

    final url = 'https://www.google.com/maps?$mapOptions';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
