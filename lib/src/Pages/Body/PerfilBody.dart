import 'package:flutter/material.dart';
import 'package:guimyapp/src/Provider/ModelProvider.dart';
import 'package:guimyapp/src/root/root.dart';
import 'package:provider/provider.dart';

class PerfilBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Center(
        child: GestureDetector(
          onTap: ()async{
          ModelProvider _currentUser = Provider.of<ModelProvider>(context, listen: false);
          String verif = await _currentUser.signOut();
          //Provider.of<ModelProvider>(context,listen: false).signOut();
          if(verif == "success"){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>OurRoot()), (route) => false);
          }
        },
        child: Container(
          width: 50.0,
          height: 50.0,
          color: Colors.red,
        ),
        ),
      ),
    );
  }
}