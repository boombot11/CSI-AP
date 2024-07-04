import 'package:csi_app/Navbar/Navbar.dart';
import 'package:csi_app/models/User.dart';
import 'package:flutter/material.dart';
const values={
'Name':'Dheer Shah',
'Sap Id':'6003023232',
'From':"Dahisar",
'To':'Vile Parle',
'class':'First Class',
'Duration':'3 Months',
'Status':'Ready to Collect \n B 69 23283232',
};


class Request extends StatefulWidget{

  double width;
  User user;
   Request({super.key, required this.width,required this.user});
State<Request> createState()=> _Request();
}
class _Request extends State<Request> with SingleTickerProviderStateMixin{
    bool _isCollected = false;
  double _buttonWidth = 200;
  bool A=true;
  bool B=false;

  @override
  Widget build(BuildContext context) {
     return Container(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           const Padding(
              padding: EdgeInsets.fromLTRB(0,30,0,80),
              child:  Text('RAILWAY STICKER',
              style: TextStyle(color: Colors.white,
              fontSize: 45
              ),
              ),
            ),
                const Padding(
                  padding:  EdgeInsets.fromLTRB(0,0,0,30),
                  child:  Text('Application Request',
                              style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 30
                              ),),
                ),
            info_container(width: widget.width,user: widget.user,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
          onPressed:(){
            setState(() {
              A=true;
              B=false;
            });
          },
          child: Text('| CLASS'),
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontSize: 16),
              backgroundColor:!A?Colors.grey.shade200:Color.fromRGBO(251, 167, 255, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
                ),
                ElevatedButton(
          onPressed:(){
               setState(() {
              B=true;
              A=false;
            });
          },
          child: Text('|| CLASS'),
          style: ElevatedButton.styleFrom(
            backgroundColor:!B?Colors.grey.shade200:Color.fromRGBO(251, 167, 255, 1),
            textStyle: TextStyle(fontSize: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
                ),
              ],
            ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: _buttonWidth,
                height: 50,
                child: ElevatedButton(
          onPressed:(){},
          child: Text('Submit',style: const TextStyle(fontSize: 16,color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 207, 65, 220),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
                ),
              ),
        )
          ],
        ),
       );
     
  }
}

class info_container extends StatelessWidget{
  double width;
  User user;
  info_container({super.key,required this.width,required this.user});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width:width-40 ,
      height: 255,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white,width: 3),
        borderRadius: BorderRadius.circular(15)
      ),
      child: 
      Padding(
        padding: EdgeInsets.only(left: 15,right: 15,top: 15),
        child: mapper_User(user)),
    
    );
  }
  
 Widget mapper_User(User user) {
  TextStyle a=TextStyle(color: Colors.white,fontSize: 25);
return  Column(
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
  Text('From:',style: a),
  Text(user.from,style:a),
],
    ),
       Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Text('To:',style: a),
  Text(user.to,style:a),
],
    ),
       Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Text('class:',style: a),
  Text(user.lass,style:a),
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
