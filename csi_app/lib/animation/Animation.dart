import 'dart:math';

import 'package:flutter/material.dart';

class square extends StatefulWidget{
  const square({super.key});
State<square> createState()=>_square();
}
class _square extends State<square>with SingleTickerProviderStateMixin{

  late AnimationController _controller;

late Animation<double> _animation;
 

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

  _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  _controller.forward();
  _controller.addStatusListener((value) {
    print(_controller.value);
   });
   _controller.repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return
   AnimatedBuilder(
    animation: _animation,
    builder:(context,child)=>
      Transform.rotate(
      angle: pi*_controller.value,
       child: (
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           (
            Container(
              child: LargerSquare(),
            )
           ),
         ],
       )
       ),)
    
   );
  }

}

class LargerSquare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(22, 10),
      child: Container(
        width: 150.0, // Width of the larger square container
        height: 150.0, // Height of the larger square container
        child: const Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 10),child: Square(color: Color.fromARGB(255, 168, 32, 192),)),
                  Square(color: Color.fromARGB(255, 168, 32, 192),),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:10.0),
                  child: Square(color: Color.fromARGB(255, 168, 32, 192),),
                ),
                Square(color: Color.fromARGB(255, 168, 32, 192),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class Square extends StatelessWidget {
 
  final Color color;

  const Square({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
   Container(
        width: 50.0, // Width of the individual square
        height: 50.0, // Height of the individual square
        color: color,
     
    );
     
  }
}