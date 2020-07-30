import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:guimyapp/src/Provider/ModelProvider.dart';
import 'package:guimyapp/src/Widgets/BackGroundWidget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String _insertUser = """
  mutation insertUser(\$country : String, \$email: String, \$name: name, \$pass:String, \$phone:String, \$extendphone:String, \$avatar:String) {
  insert_users_one(object:{
    country : \$country
    email: \$email
    name : \$name
    password : \$pass
    phone : \$phone
    extend_phone : \$extendphone
    avatar : \$avatar
  }){
    id
    email
    name
  }
}
  """;

File _image;
File _imageUrl;
class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {

  TextEditingController _fullNameController   = TextEditingController();
  TextEditingController _emailController      = TextEditingController();
  TextEditingController _passController       = TextEditingController();
  String                _countryController    = "PERU";
  String                _extencion    = "+51";
  // String                _avatar    = "";
  TextEditingController _phoneNumber          = TextEditingController();
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
          SafeArea(child: Container(height: 140.0,),),
          Text("Register",style: TextStyle(
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
                _inputImage(),
                _inputNombre(),
                _inputEmail(),
                _inputPass(),
                _inputPais(),
                _inputPhone(),
                //SizedBox(height: 5.0,),
                _botonSingUp(context),
                //Text("¿Olvidaste tu contraseña? ")
                _textoYaTienesCuenta(context),
                //_textoRegistrate(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _inputImage(){
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          _mostrarFoto(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _seleccionarFoto();
                },
                child: Icon(Icons.photo_size_select_large,size: 40.0,),
              ),
              GestureDetector(
                onTap: () {
                  _tomarFoto();
                },
                child: Icon(Icons.camera_enhance,size: 40.0,),
              )
            ],
          )
        ],
      ),
    );
  }

  _mostrarFoto(){
    if(_imageUrl != null){
      return Container();
    }else{
      return ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Image(
          image: AssetImage( _image?.path ?? "lib/src/Sources/loadingimage/no-image.png" ),
          height: 200.0,
          width: 200.0,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  _seleccionarFoto()async{
    final _picker = ImagePicker();
    final PickedFile pickedFile = await _picker.getImage(source: ImageSource.gallery);
    
    _image = File(pickedFile.path);
    
    if(_image != null){
      //limpiez 
    }

    setState(() {
      
    });
  }

  _tomarFoto()async{
    final _picker = ImagePicker();
    final PickedFile pickedFile = await _picker.getImage(source: ImageSource.camera);
    
    _image = File(pickedFile.path);
    
    if(_image != null){
      //limpiez 
    }

    setState(() {
      
    });
  }

  Widget _inputNombre(){
    return Container(
      margin: EdgeInsets.all(8.0),
      child: TextField(
        controller: _fullNameController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0)
          ),
          hintText: "Nombre",
          alignLabelWithHint: false,
          filled: true
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
      ),
    );
  }

  Widget _inputEmail(){
    return Container(
      margin: EdgeInsets.all(8.0),
      child: TextField(
        controller: _emailController,
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
        controller: _passController,
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
  Widget _inputPhone(){
    return Container(
      margin: EdgeInsets.all(8.0),
      child: TextField(
        controller: _phoneNumber,
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0)
          ),
          hintText: "Numero de celular",
          alignLabelWithHint: false,
          filled: true
        ),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
      ),
    );
  }


  Widget _inputPais(){
    // falta controller
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: new Border.all(color: Colors.grey[600],width: 1.0),
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.white,
        
      ),
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.symmetric(vertical: 5.0),
      alignment: Alignment.center,
      child: CountryCodePicker(
        textStyle: TextStyle(fontWeight: FontWeight.normal,fontSize: 25.0,color: Colors.grey[600]),
        onChanged: (x){
          _countryController = x.name;
          _extencion = x.dialCode;
          //print("#############${x.name}");
          return print(x);
        },
           // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
           initialSelection: 'PE',
           favorite: ['+51','PE','+52','MX','+591','BO',],
           // optional. Shows only country name and flag
           showCountryOnly: true,
           // optional. Shows only country name and flag when popup is closed.
           showOnlyCountryWhenClosed: true,
           // optional. aligns the flag and the Text left
           alignLeft: false,
         ),
    );

    
  }

  Widget _botonSingUp(BuildContext context){
    ModelProvider _currentUser = Provider.of<ModelProvider>(context, listen: false); 

    //#######################
    return Mutation(
        options: MutationOptions(
          documentNode: gql(_insertUser), // this is the mutation string you just created
          // you can update the cache based on results
          // update: (Cache cache, QueryResult result) {
          //   return cache;
          // },
          // or do something with the result.data on completion
          onCompleted: (dynamic resultData) async {
            print(" ##**## $resultData");
            Map resultado = resultData;
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('idUser', resultado["insert_users_one"]["id"]);
            print(" ##___## enviando dato a prefs ${resultado["insert_users_one"]["id"]}");
            //_currentUser.userId = resultado["insert_users_one"]["id"];
            // String idUser =  resultData.data["insert_users_one"]["id"].toString();
            // // String idUser2 =  resultData["insert_users_one"]["id"].toString();
            // print("  #### RESULT ### $resultado");
            // // print("  #### RESULT ### ${resultado["insert_users_one"]["id"]}");
            // print("  #### RESULT ### $idUser2");

          },
        ),
        builder: (
          RunMutation runMutation,
          QueryResult result,
        ) {
          
          return InkWell(
            onTap: ()async{

              // print("###########  ${_fullNameController.text}");
              // print("###########  ${_emailController.text}");
              // print("###########  ${_passController.text}");
              // print("###########  ${_countryController.toString()}");
              // print("###########  ${_phoneNumber.text}");

              _currentUser.userName = _fullNameController.text;
              _currentUser.userEmail = _emailController.text;
              _currentUser.userPassword = _passController.text;
              _currentUser.userCountry = _countryController.toString();
              _currentUser.userPhone = _phoneNumber.text;
              _currentUser.extencionPhone = _extencion;
              
              final dato = await _funcionCargarDatos(_currentUser);
              // print("####### dato ### ${dato}");
              _currentUser.userAvatar = dato;


              // print("#############______ ENVIO A GRAPQL ______#############");
              runMutation({
                  "country": _currentUser.userCountry,
                  "email": _currentUser.userEmail,
                  "name": _currentUser.userName,
                  "pass": _currentUser.userPassword,
                  "phone": _currentUser.userPhone,
                  "extendphone": _currentUser.extencionPhone,
                  "avatar": _currentUser.userAvatar
                });


              // if(_image!= null){
              //   _currentUser = await _currentUser.subirImagen(_image);
              // }              
              
              _signUpUser(_emailController.text, _passController.text, context);
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Color.fromRGBO(235,122,39, 1.0),
                
              ),
              child: Text("Register",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),),
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
              alignment: Alignment.center,
            ),
          );
        },
      );
    //#######################
    
  }

  Future<String> _funcionCargarDatos(ModelProvider currentUser)async{

    String valor;

    if(_image!= null){
      valor = await currentUser.subirImagen(_image);
    }else{
      print("####### _image es null");
      valor = "";
    }    
    return valor;
  }

  Widget _textoYaTienesCuenta(BuildContext context){
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ()=>Navigator.pushNamed(context, "/Login"),
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.orange[800]),
            children: [
              TextSpan(text: '¿Ya tienes una cuenta? '),
              TextSpan(text: 'Iniciar Sesion',style: TextStyle(fontWeight: FontWeight.bold)),
            ]
          )
        ),
      ),
    );
  }
}

void _signUpUser(String email, String pass, BuildContext context) async {

  ModelProvider _currentUser = Provider.of<ModelProvider>(context, listen: false);
  try {
    if(await _currentUser.signUpUser(email, pass)){


      // ####################################
      // Mutation(
      //   options: MutationOptions(
      //     documentNode: gql(_insertUser), // this is the mutation string you just created
      //     // you can update the cache based on results
      //     update: (Cache cache, QueryResult result) {
      //       return cache;
      //     },
      //     // or do something with the result.data on completion
      //     onCompleted: (dynamic resultData) {
      //       print(resultData);
      //     },
      //   ),
      //   builder: (
      //     RunMutation runMutation,
      //     QueryResult result,
      //   ) {
      //     print("#############_____________#############");
      //     runMutation({
      //         "country": _currentUser.userCountry,
      //         "email": _currentUser.userEmail,
      //         "name": _currentUser.userName,
      //         "pass": _currentUser.userPassword,
      //         "phone": _currentUser.userPhone
      //       });
      //     return Container();
      //   },
      // );
      // ####################################

      // print("## ${_currentUser.userName}"); 
      // print("## ${_currentUser.userEmail}"); 
      // print("## ${_currentUser.userPassword}"); 
      // print("## ${_currentUser.userCountry}"); 
      // print("## ${_currentUser.userPhone}"); 
      
      Navigator.pushReplacementNamed(context, "/homePage");
    }
  } catch (e) {
    print(e);
  }
}