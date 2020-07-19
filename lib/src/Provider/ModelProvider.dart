import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ModelProvider extends ChangeNotifier{
  
  int _indexPage = 0;
  int get indexPage => this._indexPage;
  set indexPage(int index){
    this._indexPage=index;
    notifyListeners();
  }

  // Current State User
  String _uid;
  String _email;

  String get uid => this._uid;
  String get email => this._email;

  FirebaseAuth _auth = FirebaseAuth.instance;

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
  
}