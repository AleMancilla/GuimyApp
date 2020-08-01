import 'package:flutter/material.dart';

class RestaurantBody extends StatelessWidget {

  final TextStyle _title = TextStyle(color: Colors.orange[700],fontWeight: FontWeight.w600);
  final TextStyle _styleTitle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20.0);
  final TextStyle _styleSubTitle = TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 14.0);
    
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60.0,bottom: 50.0),
      color: Colors.grey[300],
      height: double.infinity,
      // child: _CerrarSesion(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 30.0,),
            _appBody(),
            // Spacer()
            _bodyRestaurant()
          ],
        ),
      ),

    );
  }


  Widget _appBody(){
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      width: double.infinity,
      height: 150.0,
      decoration: BoxDecoration(
        // color: Colors.red,
        gradient: LinearGradient(
          colors: [Colors.red,Colors.red[900]],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter
        ),

      ),alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Bienvenid(a)", style: _styleSubTitle,),
                Text("El Fundo del abuelo", style: _styleTitle, overflow: TextOverflow.ellipsis,),
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50.0,
          )
        ],
      ),
    );
  }


  Widget _bodyRestaurant(){
    return Column(
      children: <Widget>[
        _btnReservar(),
        _conocenos(),
        _categorias(),
        _galeria(),
        _opiniones(),
        _btnOpinar(),
        SizedBox(height: 20.0,)
      ],
    );
  }

  Widget _btnReservar(){
    return Container(
      margin: EdgeInsets.only(left: 20.0,top: 20.0,right: 20.0),
      child: Row(
        children: <Widget>[
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(50.0)
            ),
            padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
            child: Text("Reservar",style: _styleSubTitle,),
          )
        ],
      ),
    );
  }

  Widget _conocenos(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Conocenos",style: _title,),
          Text("Nostrud duis amet ipsum exercitation consequat ut anim sit cupidatat duis eiusmod aliquip magna. Proident commodo nostrud non aliquip minim. Nulla laborum voluptate exercitation adipisicing consectetur do ut ex eiusmod minim excepteur. Eiusmod tempor anim occaecat ipsum minim et excepteur dolor est irure ea incididunt proident velit. Labore quis aliquip laboris eu et dolore nisi ex mollit laboris incididunt. Cupidatat enim do amet in nisi aliqua culpa Lorem occaecat.")
        ],
      ),
    );
  }

  Widget _categorias(){

    final _aux = Card(
                child: Image.asset("lib/src/Sources/categorias/Bebidasyjugos.png"),
                color: Colors.transparent,
                elevation: 0.0,
                margin: EdgeInsets.all(8.0),
              );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text("Categorias",style: _title,),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              SizedBox(width: 12.0,),
              _aux,
              _aux,
              _aux,
              _aux,
              _aux,
              _aux,
              _aux,
              _aux,
              _aux,
              _aux,
            ],
          ),
        )
      ],
    );
  }

  Widget _galeria(){
    final _aux = Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20.0)
          ),
          child:Image.asset("lib/src/Sources/loadingimage/jar-loading.gif",height: 150.0,)
        ),
      ),
    );
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text("Galeria",style: _title,),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              SizedBox(width: 12.0,),
              _aux,
              _aux,
              _aux,
              _aux,
              _aux,
              _aux,
              _aux,
              _aux,
              _aux,
              _aux,
            ],
          ),
        )
      ],
    );
  }

  Widget _opiniones(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Opiniones",style: _title,),
          Column(
            children: <Widget>[
              _Opiniones(),
              _Opiniones(),
              _Opiniones()
            ],
          )
        ],
      ),
    );
  }

  Widget _btnOpinar(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50.0,vertical: 10.0),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: Text("Opinar",style: _styleSubTitle,),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(50.0)
      ),

    );
  }

}

class _Opiniones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0)
      ),
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.all(10.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 80.0,
          minHeight: 50.0
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: Text("Anonimo")),
                Row(
                  children: <Widget>[
                    Icon(Icons.star,color: Colors.orange,),
                    Icon(Icons.star,color: Colors.orange,),
                    Icon(Icons.star,color: Colors.orange,),
                    Icon(Icons.star,color: Colors.orange,),
                    Icon(Icons.star_half,color: Colors.orange,),
                  ],
                ),
              ],
            ),
            Expanded(child: Text("In elit cupidatat magna non sint officia.", overflow: TextOverflow.ellipsis,)),
            Row(
              children: <Widget>[
                Spacer(),
                Text("ver mas..."),
              ],
            )
          ],
        ),
      ),

    );
  }

}