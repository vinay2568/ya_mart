import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ya_mart/Screens/Customer/AuthenticationScreens/SignIn_Screen.dart';
import 'package:ya_mart/Screens/Customer/Categories/categories_screen.dart';
import 'package:ya_mart/Screens/Customer/Home/home_screen.dart';
import 'package:ya_mart/Screens/Splash/splash_screen.dart';
import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/bank_screen.dart';
import 'package:ya_mart/utils/app_modal.dart';



Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token=prefs.getString('access_token')??'';
  if(token!='')
  {
    print(token);
    AppModel.setTokenValue(token.toString());
  }

  runApp( MyApp(token.toString()));
}

class MyApp extends StatelessWidget {
  final String token;
  MyApp(this.token);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      SplashScreen(token),
    );
  }
}
