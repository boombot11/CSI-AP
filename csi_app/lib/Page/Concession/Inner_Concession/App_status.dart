import 'package:csi_app/Navbar/Navbar.dart';
import 'package:csi_app/Page/Concession/Concession.dart';
import 'package:csi_app/Page/Concession/Inner_Concession/Status.dart';
import 'package:csi_app/Providers/NavbarProvider.dart';
import 'package:csi_app/models/User.dart';
import 'package:flutter/material.dart';


class App_Status extends StatefulWidget{
  User user;
   App_Status({super.key,required this.user});

State<App_Status> createState()=>_App_Status();
}

class _App_Status extends State<App_Status>{
   @override
  Widget build(BuildContext context) {
  
    return LayoutBuilder(
      builder:(context, constraints) =>  Scaffold(
        appBar: AppBar(
    
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
          title: Text('dsa'),
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            color:  Color.fromRGBO(103, 5, 121, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                 Text('DJSCI',style:TextStyle(color:Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w900,
                ),
                ),
            
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Status(width:constraints.maxWidth,user: widget.user,),
                    ],
                  ),
              
             
              ],
            ),
          ),
        ),
     
      ),
    );
  }

}
