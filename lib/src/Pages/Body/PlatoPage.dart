import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatoPage extends StatefulWidget {
  @override
  _PlatoPageState createState() => _PlatoPageState();
}

class _PlatoPageState extends State<PlatoPage> {

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
  ]);
    super.initState();
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          color: Colors.green,
          child: Text("Hola MundoMundial"),
        ),
      ),
    );
  }
}