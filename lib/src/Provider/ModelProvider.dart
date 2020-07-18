import 'package:flutter/material.dart';
class ModelProvider extends ChangeNotifier{
  
  int _indexPage = 0;
  int get indexPage => this._indexPage;
  set indexPage(int index){
    this._indexPage=index;
    notifyListeners();
  }
  
}