import 'package:csi_app/Page/Concession/Inner_Concession/App_request.dart';
import 'package:csi_app/Page/Concession/Inner_Concession/App_status.dart';
import 'package:csi_app/Providers/NavbarProvider.dart';
import 'package:csi_app/Providers/User.dart';
import 'package:csi_app/animation/Animation.dart';
import 'package:csi_app/models/User.dart';
import 'package:flutter/material.dart';


class Concession extends StatefulWidget{
  User user;
 Concession({super.key,required this.user});

State<Concession> createState()=>_Concession();
}

class _Concession extends State<Concession>{
  bool load=false;
   @override
  void initState() {
   
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
       Future.delayed(const Duration(milliseconds: 1500),(){
    setState(() {
      load=true;
    });
  });
    });
  }
  @override
  Widget build(BuildContext context) {
     return load?LayoutBuilder(
       builder:(context, constraints) =>Container(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           const Padding(
              padding: EdgeInsets.fromLTRB(0,10,0,80),
              child:  Text('RAILWAY STICKER',
              style: TextStyle(color: Colors.white,
              fontSize: 45
              ),
              ),
            ),
                const Padding(
                  padding:  EdgeInsets.fromLTRB(0,0,0,30),
                  child:  Text('Railway Concession',
                              style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 30
                              ),),
                ),
            
              ButtonProvider(user: widget.user,start: Icons.request_page, end: Icons.navigate_next, text: 'Application Status', constraints: constraints.maxWidth),
              ButtonProvider(user: widget.user,start: Icons.request_page, end: Icons.navigate_next, text: 'Application Request', constraints: constraints.maxWidth)
             
       
               
         
             
          ],
        ),
       ),
     ):square();
  }
}

class ButtonProvider extends StatelessWidget{
  String text;
  IconData start;
  IconData end;
  double constraints;
  User user;
   ButtonProvider({required this.user,super.key,required this.start,required this.end,required this.text,required this.constraints});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
              onTap: (){
            if(text=='Application Status') 
          Navigator.of(context).push(
            MaterialPageRoute<void>(
      builder: (BuildContext context) => App_Status(user: user),
    ),
          );
          else{
              Navigator.of(context).push(
            MaterialPageRoute<void>(
      builder: (BuildContext context) => App_Request(user: user),
    ),
          );
          }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:10),
                child: Container(
                       width: constraints-30,
                       decoration: BoxDecoration(
                        border: Border.all(color: Colors.white,width: 3),
                        borderRadius: BorderRadius.circular(25)
                       ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(start,color:Colors.white,size: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(text,style: TextStyle(
                      color: Colors.white,fontSize: 26,
                    ),),
                  ),
                  Icon(end,color: Colors.white,size: 30,)
                ],
                ),
                          ),
              ),
            );
  }

}