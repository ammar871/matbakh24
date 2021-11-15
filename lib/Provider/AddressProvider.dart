import 'package:flutter/cupertino.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/UserAddress/UserAddresses.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';
import 'package:matbahk24/widgets/loading.dart';
import 'package:http/http.dart' as http;
import 'AuthProvider.dart';
class AddressProvider extends ChangeNotifier{
  addAddress(state,{lat,lng,lable,context}) async {
    showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    var jsoMap = Map();
    jsoMap['lat'] = lat.toString();
    jsoMap['lng'] = lng.toString();
    jsoMap['lable'] = lable ?? "unknown";
    final url = "$baseUrl/address/add";
    final response = await http.post(Uri.parse(url), body: jsoMap,headers: headers);
    if (response.statusCode == 200) {
     await getUserDetail(context: context,status: 1);
     if(state == 1){
       pop(context);
       pushPage(context: context,page: NavigationPage());

     }else{
       popMultiplePages(context,3);

       pushPage(context: context,page: UserAdresses());
     }

    } else {
    }
  }

  deleteAddress(context, id) async {
    showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    var jsoMap = Map();

    jsoMap['id'] = id.toString();
    final url = "$baseUrl/address/delete";
    final response = await http.post(Uri.parse(url),body: jsoMap,headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      await getUserDetail(context: context,status: 1);
      pop(context);
      pop(context);
      pushPage(context: context,page: UserAdresses());
    } else {
      pop(context);
    }
  }

}