import 'package:flutter/material.dart';
import 'package:guimyapp/src/Widgets/BackGroundWidget.dart';

class LoginUser extends StatefulWidget {

  @override
  _LoginUserState createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         body: Stack(
           children:[
             
              _createBackground(context),
              _centerPart(context),
           ] 
         ),
      ),
    );

  }
  Widget _createBackground(BuildContext context){
    Size size = MediaQuery.of(context).size;
    Image imagen = Image.asset("lib/src/Sources/Logos/LogoGuimy.png");
    return Stack(
      children: [
        BackGroundWidget(size),
        Container(
          //color: Colors.blue,
          height: 200.0,
          width: double.infinity,
          child: Hero(
            tag: "keyLogo",
            child: Container(
              decoration: BoxDecoration( image:  DecorationImage(image: imagen.image)),
            ),
          )
          
          
          
          //Hero(tag: "keyLogo",child: Image.asset("lib/src/Sources/Logos/LogoGuimy.png"))
        ),

      ],
    );

  }

  Widget _centerPart(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(child: Container(height: 180.0,),),
          Text("Sign in",style: TextStyle(
               color: Color.fromRGBO(235,122,39, 1.0),
               fontSize: 25.0,
               fontWeight: FontWeight.bold,

             ),),
             SizedBox(height: 15.0,),
          Container(
            width: size.width * 0.8,
            //height: size.height * 0.6,
            //color: Colors.blue,
            child: Column(
              children: [
                _inputEmail(),
                _inputPass(),
                //SizedBox(height: 5.0,),
                _botonLogin(),
                //Text("¿Olvidaste tu contraseña? ")
                _textoBajo(),
                _textoRegistrate(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _inputEmail(){
    return Container(
      margin: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0)
          ),
          hintText: "E-mail",
          alignLabelWithHint: false,
          filled: true
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
      ),
    );
  }

  Widget _inputPass(){
    return Container(
      margin: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0)
          ),
          hintText: "Password",
          alignLabelWithHint: false,
          filled: true
        ),
        //keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        textInputAction: TextInputAction.done,
      ),
    );
  }
  
  Widget _botonLogin(){
    return GestureDetector(
      onTap: ()=>Navigator.pushNamed(context, "/homePage"),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Color.fromRGBO(235,122,39, 1.0),
          
        ),
        child: Text("Login",style: TextStyle(
                 color: Colors.white,
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold,

               ),),
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
        alignment: Alignment.center,
      ),
    );
  }

  Widget _textoBajo(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.orange[800]),
          children: [
            TextSpan(text: '¿Olvidaste tu contraseña? '),
            TextSpan(text: 'Recuperala ahora',style: TextStyle(fontWeight: FontWeight.bold)),
          ]
        )
      ),
    );
  }
  Widget _textoRegistrate(BuildContext context){
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ()=>Navigator.pushNamed(context, "/Register"),
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.orange[800]),
            children: [
              TextSpan(text: '¿No tienes una Cuenta? '),
              TextSpan(text: 'Registrate',style: TextStyle(fontWeight: FontWeight.bold)),
            ]
          )
        ),
      ),
    );
  }
}