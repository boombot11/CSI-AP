import 'package:flutter/material.dart';
import '../models/User.dart';
class User_details extends ChangeNotifier{
User user=User.fromMap({
'Name':'Dheer Shah',
'Sap Id':'6003023232',
'From':"Dahisar",
'To':'Vile Parle',
'class':'First Class',
'Duration':'3 Months',
'Status':'Ready to Collect \n B 69 23283232',
'year':'2',
'Dob':'2004-08-25',
'Department':'CS'
});

SetUser(token){
  user=token;
  notifyListeners();
}
}