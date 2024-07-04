import 'package:flutter/material.dart';
List<IconData> icons=[
  Icons.handshake_rounded,
  Icons.notifications,
  Icons.laptop,
  Icons.people,
];
List<String> labels=[
  'Sponsers','Notices','DJS-CSI','DJS-CSI Team'
];
class more extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:200.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DualButton(icons[0], icons[1], labels[0], labels[1]),
         const Padding(padding: EdgeInsets.symmetric(vertical: 25),
          child: Text('ABOUT', style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.w800),),
          ),
          DualButton(icons[2], icons[3], labels[2], labels[3])
        ],
      ),
    );
  }

}
Widget DualButton(IconData a,IconData b,String first,String second){
  TextStyle styles=TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w700);
return Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Container(
      alignment: Alignment.center,
      decoration:BoxDecoration(
        border: Border.all(color: Colors.white60,width: 2),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end:Alignment.bottomRight,
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
        borderRadius: BorderRadius.circular(26)
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(a,color: Colors.white),
            Text(first,style: styles,)
          ],
        ),
      ),
    ),
    Container(
      alignment: Alignment.center,
      decoration:BoxDecoration(
        border: Border.all(color: Colors.white60,width: 2),
          gradient: LinearGradient(
          begin: Alignment.topLeft,
          end:Alignment.bottomRight,
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
        borderRadius: BorderRadius.circular(26)
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(b,color: Colors.white),
            Text(second,style: styles,)
          ],
        ),
      ),
    )
  ],
);
} 