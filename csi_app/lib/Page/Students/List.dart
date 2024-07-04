import 'dart:math';

import 'package:csi_app/animation/Animation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class list_students extends StatefulWidget{
  const list_students({super.key});
State<list_students> createState()=>_list_students();

}
class _list_students extends State<list_students>{
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
    return 
          load?ListView(
        children: [
          MenuItemWidget(icon: Icons.event, label: 'Events'),
          MenuItemWidget(icon: Icons.question_answer, label: 'Quiz'),
          MenuItemWidget(icon: Icons.poll, label: 'Poll'),
          MenuItemWidget(icon: Icons.book, label: 'Protocol'),
          MenuItemWidget(icon: Icons.description, label: 'TECHx'),
        ],
          ):square();
        
  }

}

class MenuItemWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  MenuItemWidget({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
              end: Alignment.centerRight,
           stops: [
                0.3,
                0.4,
                0.99
              ],
              colors: [
               Colors.grey.shade700,
               Color.fromARGB(255, 92, 90, 90),
               Colors.black
              ],

          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top:20.0,bottom: 20.0,right: 20.0),
          child: ListTile(
            leading:Stack(
              children: [
                Transform.translate(offset: Offset(-5, -10),
                child: Transform.rotate(angle: pi/6,
                child: Container(
                  width:50,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                     color: Colors.grey.shade400,
                     border: Border.all(
                      color: Colors.white,
                      width:4 ,
                     )
                  ),
                  child: Text(''),
                ),),
                ),
               Container(
                  width:60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                     color: Colors.black87,
                     border: Border.all(
                      color: Colors.white,
                      width:4 ,
                     )
                  ),
                  child: Icon(icon,color: Colors.white,),
                ),
              ],
            ),
            title: Text(
              label,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}