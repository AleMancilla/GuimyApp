import 'package:flutter/material.dart';

class LoginUser extends StatefulWidget {

  @override
  _LoginUserState createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         child: Hero(tag: "keyLogo",child: Image.asset("lib/src/Sources/Logos/LogoGuimy.png")),
       ),
    );
  }
}