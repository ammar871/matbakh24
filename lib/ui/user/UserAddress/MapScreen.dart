import 'dart:async';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:matbahk24/Provider/AddressProvider.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatelessWidget {
  var latitude;
  var longitude;
  var lable;
  var state;

  MapScreen(this.state);

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(locData.latitude ?? 22, locData.longitude ?? 39),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      target: LatLng(locData.latitude ?? 22, locData.longitude ?? 39),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  void setInitialLocation() async {
    CameraPosition cPosition = CameraPosition(
      zoom: 19,
      target: LatLng(locData.latitude ?? 33, locData.longitude ?? 29),
    );
    final GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(cPosition))
        .then((value) {});
  }

  var _addressProvider ;

  @override
  Widget build(BuildContext context) {
    if(_addressProvider==null){
      _addressProvider =
          Provider.of<AddressProvider>(context);
    }
    return Scaffold(
      backgroundColor: Color(0xFFEAEAEA),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        title: Container(
          color: CupertinoColors.white,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "اختر موقع".tr(),
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  pop(context);
                },
                icon: Icon(
                  Icons.close_sharp,
                  size: 25,
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 270.0),
            child:GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              myLocationButtonEnabled: true,
              buildingsEnabled: true,
              compassEnabled: true,
              indoorViewEnabled: true,
              mapToolbarEnabled: true,
              rotateGesturesEnabled: true,
              scrollGesturesEnabled: true,
              tiltGesturesEnabled: true,
              trafficEnabled: true,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              myLocationEnabled: true,
              onCameraMove: (object)  {
              latitude = object.target.latitude;
              longitude = object.target.longitude;
            },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                setInitialLocation();
              },
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 150),
              child: Image.asset(
                'assets/images/pin.png',
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 260,
              child: Column(
                children: [
                  Container(
                    height: 130,
                    width: double.infinity,
                    margin: EdgeInsets.all(18),
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/pin.png',
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "اختر موقع".tr(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                        Divider(),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'رقم المنزل / العمارة / الشقة'.tr(),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintStyle: TextStyle(fontSize: 12),
                          ),
                          onChanged: (v){
                            lable=v.toString();
                          },
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () async {

                     await _addressProvider.addAddress(state,context: context,lable:lable,lat: latitude,lng: longitude );

                    },
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      color: KHomeColor,
                      child: Center(
                        child: Text(
                          "تآكيد الموقع".tr(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

