import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


class ModelProvider extends ChangeNotifier{
  
  int _indexPage = 0;
  int get indexPage => this._indexPage;
  set indexPage(int index){
    this._indexPage=index;
    notifyListeners();
  }

  //##################### auth ########################33
  // Current State User
  String _uid;
  String _email;

  String get uid => this._uid;
  String get email => this._email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartUp()async{
    String retVal = "error";
    try {
      FirebaseUser _firebaseUser = await _auth.currentUser();
      _uid = _firebaseUser.uid;
      _email = _firebaseUser.email;
      retVal = "success";
    } catch (e) {
      print("nuevo error encontrado en $e");
    }
    return retVal;
  }

  Future<String> signOut()async{
    String retVal = "error";
    try {
      await _auth.signOut();
      _uid = null;
      _email = null;
      retVal = "success";
    } catch (e) {
      print("nuevo error encontrado en $e");
    }
    return retVal;
  }

  //#############################################33

  Future<bool> signUpUser (String email, String password) async {
    bool retVal = false;

    try {
      AuthResult _authResult = 
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if(_authResult.user != null){
        retVal = true;
      }
    } catch (e) {
      print("Error encontrado en $e");
    }
    return retVal;
  }
  
  Future<bool> loginUser (String email, String password) async{
    bool retVal = false;

    try {
      AuthResult _authResult = 
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(_authResult.user != null){
        _uid = _authResult.user.uid;
        _email = _authResult.user.email;
        retVal = true;
      }
    } catch (e) {
      print("Error encontrado en $e");
    }
    return retVal;
  }



  // ################################################################
  // ############     RESERVADO PARA DATOS DE USUARIO   #############
  // ################################################################

  String _userName ; 
  String _userEmail ;
  String _userPassword ;
  String _userCountry ;
  String _userPhone;

  String _extencionPhone ;
  String _userAvatar;
  //


  String get userAvatar => this._userAvatar;
  String get userPhone => this._userPhone;

  String get userName => this._userName;
  String get userEmail => this._userEmail;
  String get userPassword => this._userPassword;
  String get userCountry => this._userCountry;

  String get extencionPhone => this._extencionPhone;
  set extencionPhone(String number){
    this._extencionPhone = number;
  }

  Future<String> subirImagen(File imagen)async{
    final url = Uri.parse("https://api.cloudinary.com/v1_1/guimyapp/image/upload?upload_preset=ezacjkrt");
    final mineType = mime(imagen.path).split("/"); // image/jpg
    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );

    final file = await http.MultipartFile.fromPath(
      "file", 
      imagen.path,
      contentType: MediaType(mineType[0],mineType[1])
    );

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);
    if(resp.statusCode != 200 && resp.statusCode != 201){
      print("Algo salio mal");
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);
    print(respData);
    return respData['secure_url'];
  }


  set userAvatar(String url){
    this._userAvatar = url;
    print(this._userAvatar);
  }

  

  set userName(String userName){
    this._userName = userName;
    //notifyListeners();
  }
  set userEmail(String userEmail){
    this._userEmail = userEmail;
    //notifyListeners();
  }
  set userPassword(String userPassword){
    this._userPassword = userPassword;
    //notifyListeners();
  }
  set userCountry(String userCountry){
    this._userCountry = userCountry;
    //notifyListeners();
  }

  set userPhone(String phone){
    this._userPhone = phone;
    // notifyListeners();
  }
    
  
}