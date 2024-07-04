import 'package:csi_app/Navbar/Navbar.dart';
import 'package:csi_app/models/User.dart';
import 'package:flutter/material.dart';



class Status extends StatefulWidget{

  double width;
  User user;
   Status({super.key, required this.width,required this.user});
State<Status> createState()=> _Status();
}
class _Status extends State<Status> with SingleTickerProviderStateMixin{
    bool _isCollected = false;
  double _buttonWidth = 200;

  void _toggleButton() {
    setState(() {
      _isCollected = !_isCollected;
      _buttonWidth = _isCollected ? 250 : 200; // Increase width on click
    });
  }
  bool clicked=false;


  @override
  Widget build(BuildContext context) {
     return LayoutBuilder(
       builder:(context, constraints) =>Container(
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
                  child:  Text('Application Status',
                              style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 30
                              ),),
                ),
            info_container(width: widget.width,user:widget.user,),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: _buttonWidth,
                height: 50,
                child: ElevatedButton(
          onPressed: _toggleButton,
          child: Text(_isCollected ? 'Collected' : 'Collect'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(251, 167, 255, 1),
            textStyle: TextStyle(fontSize: 16,color: Color.fromARGB(255, 120, 44, 121)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
                ),
              ),
        )
          ],
        ),
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
      height: 300,
      decoration: BoxDecoration(
       color: Color.fromRGBO(157, 21, 188, 1),
        borderRadius: BorderRadius.circular(15)
      ),
      child: 
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
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
  Text('Class:',style: a),
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
       Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Text('Status:',style: a),
  Text(user.status,style:a),
],
    )

  
  ],
);
  }



}
