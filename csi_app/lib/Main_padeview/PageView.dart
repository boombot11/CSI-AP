import 'package:csi_app/Navbar/Navbar.dart';
import 'package:csi_app/Page/Concession/Concession.dart';
import 'package:csi_app/Page/More/More.dart';
import 'package:csi_app/Page/PageView/pageview.dart';
import 'package:csi_app/Page/Students/List.dart';
import 'package:csi_app/Page/profile/profile.dart';
import 'package:csi_app/Providers/NavbarProvider.dart';
import 'package:csi_app/animation/Animation.dart';
import 'package:csi_app/main.dart';
import 'package:csi_app/models/User.dart';
import 'package:flutter/material.dart';

class Page_view extends StatefulWidget {
  User user;
  NavbarState nav;

  Page_view({super.key,required this.nav,required this.user});
  @override
  _PageViewState createState() => _PageViewState();
}

class _PageViewState extends State<Page_view> {
  PageController _pageController = PageController();
 late int _currentIndex = widget.nav.key;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder
    (
      builder:(context,constraints)=> Container(
        child: Column(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
               square(),
               list_students(),
               Concession(user:widget.user,),
               profile(user: widget.user),
               more()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
