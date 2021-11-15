import 'package:flutter/cupertino.dart';
import 'package:matbahk24/Provider/AuthProvider.dart';
import 'package:matbahk24/helpers/Functions.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/add_meal/successAddMeal/success_add_meal_screen.dart';
import 'package:matbahk24/widgets/loading.dart';
import 'package:http/http.dart' as http;

class FoodProvider extends ChangeNotifier{
  addFood({context, params}) async {
    params['lat']=locData.latitude.toString();
    params['lng']=locData.longitude.toString();
    showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    final url = "$baseUrl/food/add";
    final response = await http.post(Uri.parse(url), body: params,headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
     await getUserDetail(context:context,status: 1);
      pop(context);
      pushPage(context: context,page:SuccessAddMealScreen());
    } else {
      pop(context);
    }
    notifyListeners();
  }
  deleteFood({context, params}) async {
    showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    final url = "$baseUrl/food/delete";
    final response = await http.post(Uri.parse(url), body: params,headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      pop(context);
      HelperFunctions.slt.notifyUser(context: context,message: "تم بنجاح");
    } else {
      pop(context);
    }
    notifyListeners();
  }

  deletePhoto({context, id}) async {
    showLoadingDialog(context);
    // final headers = {
    //   'Authorization': token,
    // };
    final url = "$baseUrl/image/delete";
    final response = await http.post(Uri.parse(url), body: {"id":id.toString()});
    print(response.body);
    if (response.statusCode == 200) {
      pop(context);
    } else {
      pop(context);
    }
  }
}