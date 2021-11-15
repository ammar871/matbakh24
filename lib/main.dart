// @dart=2.9
import 'package:country_code_picker/country_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:matbahk24/Provider/AuthProvider.dart';
import 'package:matbahk24/Provider/CartProvider.dart';
import 'package:matbahk24/Provider/FieldProvider.dart';
import 'package:matbahk24/Provider/MarketProvider.dart';
import 'package:matbahk24/Provider/OrderProvider.dart';
import 'package:matbahk24/Provider/PaymentProvider.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/screen_examples.dart';

import 'package:matbahk24/theme.dart';
import 'package:matbahk24/ui/main_screens/complete_accounte_screen/complete_accounte_screen.dart';
import 'package:matbahk24/ui/main_screens/login_page/login_screen.dart';
import 'package:matbahk24/ui/main_screens/sign_up/sign_up_screen.dart';
import 'package:matbahk24/ui/main_screens/splash_screen/splash_screen.dart';
import 'package:matbahk24/ui/providers/orderDetail/OrderDetail.dart';

import 'package:matbahk24/ui/user/account_transfer/success_transfer/success_transfer.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal1/add_meal_screen.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal2/add_meal2_screen.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal3/add_meal3_screen.dart';
import 'package:matbahk24/ui/user/add_meal/successAddMeal/success_add_meal_screen.dart';

import 'package:matbahk24/ui/user/pages/cart/cart_screen.dart';
import 'package:matbahk24/ui/user/pages/category/category_screen.dart';
import 'package:matbahk24/ui/user/pages/completd_order/CompleteOrderScreen.dart';
import 'package:matbahk24/ui/user/pages/home_user/home_user_screen.dart';
import 'package:provider/provider.dart';

import 'Provider/AddressProvider.dart';
import 'Provider/FoodProvider.dart';
import 'helpers/constans.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  initFirebaseMessaging();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale("ar"), Locale("en")],
        path: "assets/translations", // <-- change the path of the translation files
        fallbackLocale: Locale("ar"),
        startLocale:Locale("ar") ,
        child: Phoenix(child: MyApp())),
  );
}


initFirebaseMessaging() async {
  await Firebase.initializeApp();
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {

    print("message comes 1");
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  });
}

final GlobalKey<NavigatorState> navigatorKey =
GlobalKey(debugLabel: "Main Navigator");
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("message comes 3");
    pushPage(context: navigatorKey.currentContext, page: OrderDetail(1,KYellowColor));
    print(message.data.values);

  });
}




class MyApp extends StatelessWidget {
  var LanguageDelegates ;
  @override
  Widget build(BuildContext context) {
    if(LanguageDelegates==null)LanguageDelegates = context.localizationDelegates;
    LanguageDelegates.add(CountryLocalizations.delegate);
    return MultiProvider(

      providers: [
        ChangeNotifierProvider<Auth>(create: (context) => Auth()),
        ChangeNotifierProvider<PaymentProvider>(create: (context) => PaymentProvider()),
        ChangeNotifierProvider<FieldProvider>(create: (context) => FieldProvider()),
        ChangeNotifierProvider<FoodProvider>(create: (context) => FoodProvider()),
        ChangeNotifierProvider<AddressProvider>(create: (context) => AddressProvider()),
        ChangeNotifierProvider<CartProvider>(create: (context) => CartProvider()),
        ChangeNotifierProvider<OrderProvider>(create: (context) => OrderProvider()),
        ChangeNotifierProvider<MarketProvider>(create: (context) => MarketProvider()),

      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,

        debugShowCheckedModeBanner: false,
        localizationsDelegates: LanguageDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: theme(),
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          CompleteAccountScreen.id: (context) => CompleteAccountScreen(),
          HomeUserScreen.id: (context) => HomeUserScreen(),
          CategoryScreen.id: (context) => CategoryScreen(),
          CartScreen.id: (context) => CartScreen(),
          CompleteOrderScreen.id: (context) => CompleteOrderScreen(),
          AddMealScreen.id: (context) => AddMealScreen(),
          ScreenExamaples.id: (context) => ScreenExamaples(),
          AddMeal2Screen.id: (context) => AddMeal2Screen(),
          AddMeal3Screen.id: (context) => AddMeal3Screen(),
          SuccessAddMealScreen.id: (context) => SuccessAddMealScreen(),
          SuccessTransfer.id: (context) => SuccessTransfer(),
        },
      ),
    );
  }
}
