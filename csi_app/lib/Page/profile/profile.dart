import 'package:csi_app/animation/Animation.dart';
import 'package:csi_app/models/User.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget{
   User user;
   profile({super.key,required this.user});
 
State<profile> createState()=> _profile();
}
class _profile extends State<profile>{
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
    return load?Padding(
      padding: EdgeInsets.only(top: 100,left: 25,right: 25),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.white,
                width: 2,
              )
            ),
            child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.purple,width: 3)
                    ),
                  ),
                  Text(widget.user.name ,style: TextStyle(color: Colors.white,fontSize: 35),),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Profile_map(widget.user)),
                ]),
            ),
          ),
             Padding(
              padding: EdgeInsets.only(top: 20),
               child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                         onPressed: (){},
                         child: Text('Logout',style: const TextStyle(fontSize: 25,color: Colors.white)),
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Color.fromARGB(255, 218, 59, 194),
                           shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                           ),
                         ),
                  ),
                  ElevatedButton(
                         onPressed: (){},
                         child: Text('Delete Account',style: const TextStyle(fontSize: 25,color: Colors.white)),
                         style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 218, 59, 194),
                           shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                           ),
                         ),
                  ),
                  ],
                  ),
             )
        ],
      ),
    ):square();
  }

Widget Profile_map(User user){
   TextStyle a=TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w800);
return Column(
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Text('Sap Id:',style: a),
  Text(user.id,style:a),
],
    ),
       Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Text('Year',style: a),
  Text(user.year,style:a),
],
    ),
       Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Text('Date of Birth:',style: a),
  Text(user.dob,style:a),
],
    ),
       Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Text('Department:',style: a),
  Text(user.department,style:a),
],
    ),
       Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Text('Duration:',style: a),
  Text(user.duration,style:a),
],
    ),

  ],
);
}
}