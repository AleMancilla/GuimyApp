import 'package:flutter/material.dart';
import 'package:guimyapp/src/Widgets/TargetIntercambio.dart';
class RegaloBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 60.0,bottom: 50.0),
      color: Colors.grey[300],
      height: double.infinity,
      // child: _CerrarSesion(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.0,),
            Row( 
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20.0,),
                Image(image: AssetImage("lib/src/Sources/iconsCoins/guimiCoin.png"),width: 50.0,),
                SizedBox(width: 10.0,),
                Text("0",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold,fontSize: 35.0),)
              ],
            ),
            SizedBox(height: 20.0,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TargetIntercambio(icon: "15descuento",promo: "15% descuento",),
                    TargetIntercambio(icon: "bebida",promo: "1 bebida gratis"),
                    TargetIntercambio(icon: "postre",promo: "1 postre gratis"),
                  ],
                ),
                SizedBox(height: 30.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TargetIntercambio(icon: "bebidaAlcoholica",promo: "1 bebida alcoholica"),
                    TargetIntercambio(icon: "Envio",promo: "1 envio gratis"),
                    TargetIntercambio(icon: "25Descuento",promo: "25% descuento"),
                  ],
                )
              ],
            ),
            Divider(),
            SizedBox(height: 30.0,),
          ],
        ),
      ),

    );
  }
}