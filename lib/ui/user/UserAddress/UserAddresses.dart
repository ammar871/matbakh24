import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Address.dart';
import 'package:matbahk24/Provider/AddressProvider.dart';
import 'package:matbahk24/helpers/Functions.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/UserAddress/MapScreen.dart';
import 'package:matbahk24/widgets/Texts.dart';
import 'package:provider/provider.dart';
class UserAdresses extends StatefulWidget {
  const UserAdresses({Key? key}) : super(key: key);

  @override
  State<UserAdresses> createState() => _UserAdressesState();
}
class _UserAdressesState extends State<UserAdresses> {

  var _addressProvider ;

  @override
  Widget build(BuildContext context) {
    if(_addressProvider==null){
      _addressProvider =
          Provider.of<AddressProvider>(context);
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: KYellowColor,
        title:   Text(
            "عناوين التوصيل",
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 18,
              color: Colors.black,
            )),

      ),
      bottomSheet: Container(
        height: 100,
        child: InkWell(
          onTap: () async {
           await pushPage(context: context,page: MapScreen((){


           }));

           setState(() {

           });

          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Texts(
                title: ' +   إضافة عنوان جديد',
                fSize: 22,
                weight: FontWeight.w400,
                color:KHomeColor,
              ),
            ),
          ),
        ),
      ),
      body:   ListView.builder(
        padding: EdgeInsets.only(left: 18,top: 19,right: 18,bottom: 200),
          itemCount: currentUser.addresses.length,
          itemBuilder: (ctx, i) {
            Address address = currentUser.addresses[i];
            return InkWell(
              onTap: (){
                HelperFunctions.slt.openGoogleMapLocation(address.lat, address.lng);
              },
              child: Container(
                height: 190,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.2,color: Colors.green)
                ),
                margin: EdgeInsets.all(20),
                width: double.infinity,

                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.network(
                          'https://maps.googleapis.com/maps/api/staticmap?zoom=18&size=600x300&maptype=roadmap&markers=${address.lat.toString()},${address.lng.toString()}&key=AIzaSyDFZhFfswZpcjeUDYm6C7H46JLdSonK0f4',
                          height: 120,
                          width: screenWidth,
                          fit: BoxFit.cover,
                        )),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                Image.asset(
                                  'assets/images/pin.png',
                                  height: 30,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 13,
                                ),
                                Texts(
                                  title: address.lable,
                                  fSize: 22,
                                  color: Colors.black,
                                  weight: FontWeight.w300,
                                ),
                              ],),

                            ],
                          ),

                       if(currentUser.addresses.length>1)   TextButton(
                            onPressed: (){
                              _addressProvider.deleteAddress(context, address.id.toString()
                              );
                            },
                            child: Text(
                              "حذف العنوان".tr(),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                                decoration: TextDecoration.underline,

                                fontWeight: FontWeight.normal,
                              ),

                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
