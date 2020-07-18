import 'package:flutter/material.dart';
import 'package:guimyapp/src/Pages/AuthUser/LoginUser.dart';
import 'package:guimyapp/src/Pages/AuthUser/RegisterUser.dart';
import 'package:guimyapp/src/Pages/SplashPage.dart';
import 'package:guimyapp/src/Provider/ModelProvider.dart';
import 'package:guimyapp/src/Templates/HomePage.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => new ModelProvider(),
      child: MaterialApp(
        title: 'Guimy',
        debugShowCheckedModeBanner: false,
        initialRoute: "/splash",
        routes: {
          "/splash"   : (BuildContext context) => SplashPage(),
          "/Login"    : (BuildContext context) => LoginUser(),
          "/Register" : (BuildContext context) => RegisterUser(),
          "/homePage" : (BuildContext context) => HomePage()
        },
      ),
    );
  }
}