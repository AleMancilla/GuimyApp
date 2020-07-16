import 'package:flutter/material.dart';
import 'package:guimyapp/src/Pages/AuthUser/LoginUser.dart';
import 'package:guimyapp/src/Pages/SplashPage.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guimy',
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/splash" : (BuildContext context) => SplashPage(),
        "/Login" : (BuildContext context) => LoginUser(),
      },
    );
  }
}