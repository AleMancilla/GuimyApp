import 'package:flutter/material.dart';
import 'package:guimyapp/src/Pages/Body/ConsultasMensajerias/ItemMensajeria.dart';

class MensajeriaBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ItemMensajeria(),
          ItemMensajeria(),
          ItemMensajeria(),
          ItemMensajeria(),
        ],
      ),
    );
  }
}