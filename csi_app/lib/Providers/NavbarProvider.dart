import 'package:flutter/material.dart';

class NavbarState extends ChangeNotifier{
  var key=0;
  ChangeKey(value){
    key=value;
    notifyListeners();
  }
}