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
  //#############################################33

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
  
}