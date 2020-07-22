import 'package:flutter/material.dart';
class RetosProgress extends StatelessWidget {
  final String title;
  final String progress;
  final int porcentageProg;

  const RetosProgress({@required this.title,@required this.progress, this.porcentageProg = 0}) ;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double _width = size.width-40;
    return Container(
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$title", style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold),),
              Text("100 pts", style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 18.0),)
            ],
          ),
          Stack(
            children: [
              Positioned(
                left: 0.0,
                child: Container(
                  width: (_width/100)*porcentageProg,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(color: Colors.red),
                    color: Colors.red
                  ),
                  alignment: Alignment.center,
                  child: Text(""),
                ),
              ),
              Container(
                width: _width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(color: Colors.red),
                  color: Colors.transparent
                ),
                alignment: Alignment.center,
                child: Text("$progress"),
              )
            ],
          )
        ],
      ),
    );
  }
}