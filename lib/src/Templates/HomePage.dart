import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guimyapp/src/Pages/Body/CuponBody.dart';
import 'package:guimyapp/src/Pages/Body/HomeBody.dart';
import 'package:guimyapp/src/Pages/Body/LocarionBody.dart';
import 'package:guimyapp/src/Pages/Body/NotificationBody.dart';
import 'package:guimyapp/src/Pages/Body/PerfilBody.dart';
import 'package:guimyapp/src/Pages/Body/RankCupBody.dart';
import 'package:guimyapp/src/Pages/Body/RankUserBody.dart';
import 'package:guimyapp/src/Pages/Body/RegaloBody.dart';
import 'package:guimyapp/src/Pages/Body/StarBody.dart';
import 'package:guimyapp/src/Provider/ModelProvider.dart';
import 'package:guimyapp/src/Widgets/AppBarWidgetP.dart';
import 'package:guimyapp/src/Widgets/BottomBarWidget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final int index = Provider.of<ModelProvider>(context).indexPage;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              _returnPage(index),
              Positioned(child: AppBarWidgetP(),top: 0.0,left: 0.0,),
              Positioned(child: BottomBarWidget(),bottom: 0.0,left: 0.0,),
              //Text("#######$index"),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          elevation: 5.0,
          onPressed: (){},
          backgroundColor: Colors.white,
          child: FaIcon(FontAwesomeIcons.qrcode,color: Colors.red,),
        ),
        //bottomNavigationBar: BottomBarWidget(),
      ),
    );
  }

  Widget _returnPage(int index){
    switch (index) {
      case 0:
        return HomeBody();
        break;
      case 1:
        return StarBody();
        break;
      case 3:
        return LocationBody();
        break;
      case 4:
        return RankCupBody();
        break;
      case 5:
        return RegaloBody();
        break;
      case 6:
        return CuponBody();
        break;
      case 7:
        return NotificationBody();
        break;
      case 8:
        return PerfilBody();
        break;
      case 9:
        return RankUserBody();
        break;
      default:
        return HomeBody();
    }
  }
}