import 'package:csi_app/Navbar/BottomNavbar.dart';
import 'package:csi_app/Providers/NavbarProvider.dart';
import 'package:csi_app/Providers/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Navbar extends StatefulWidget{
   final PageController pageController;
  Navbar({super.key,required this.pageController});
@override
State <Navbar> createState()=>_Navbar();
}
class _Navbar extends State<Navbar>{

  @override
  Widget build(BuildContext context) {
   
     return BottomBar(pageController: widget.pageController,);
    
  }

}