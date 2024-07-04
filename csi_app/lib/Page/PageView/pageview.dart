import 'package:csi_app/animation/Animation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';



class SwipeableItems extends StatefulWidget {
  final List<String> items;
 
  const SwipeableItems({super.key, required this.items});

  @override
  _SwipeableItemsState createState() => _SwipeableItemsState();
}

class _SwipeableItemsState extends State<SwipeableItems> {
  PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;
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

    return load?Stack(
      children:[Positioned(
        top: 0,
        left: -30,
        child: Container(
          height: 700,
          width: 500,
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: widget.items.length,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      double value = 1.0;
                      if (_pageController.position.haveDimensions) {
                        value = _pageController.page! - index;
                        value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                      }
                      return Center(
                        child: SizedBox(
                          height: Curves.easeOut.transform(value) * 400,
                          width: Curves.easeOut.transform(value) * 300,
                          child: child,
                        ),
                      );
                    },
                    child:  ListView(
                            children:[ Container(
                              
                              decoration: BoxDecoration(
                                color:Color.fromRGBO(103, 5, 121, 1),
                                borderRadius:  const BorderRadius.only(
                                  topLeft: Radius.circular(60),
                                  bottomRight: Radius.circular(60),
                                  topRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25)
                                ),
                                border: Border.all(
                                  color: Colors.white,width: 3,
                                )
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 140,
                                    decoration: BoxDecoration(
                                                          color: Colors.white60,
                                                          border: Border.all(color: Colors.white,width: 4),
                                                          borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(60),
                                                          ),
                                                        )
                                  ),
                                const Padding(
        
                                   padding:  EdgeInsets.only(left: 10,bottom: 5),
                                   child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('DJASCII 24',
                                                               style:TextStyle(color: Colors.white,
                                                 fontWeight: FontWeight.w800,
                                                 fontSize: 40,
                                         ) ,),
                                        Text('Venue: Dj Sanghvi',
                                                               style:TextStyle(color: Colors.white,
                                                               fontWeight: FontWeight.w800,
                                                               fontSize: 18,
                                                               ) ,),
                                     Text(' The departments of Computer Enginnering and information technology is hosting a national level project competition on April 5th',
                           style:TextStyle(color: Colors.white70,
                                 fontWeight: FontWeight.w200,
                                         fontSize: 18,
                                         ) ,)
                                      ],
                                    ),
                                 ),
                         
                                ],
                              ),
                            ),
                            
                        ],
                          )
                  );
                },
              ),
           
            
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.items.length, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      width:  _currentPage == index ?16.0:8.0,
                      height: _currentPage == index ? 16.0:8.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white,width: 4),
                       shape: BoxShape.circle,
                        color: _currentPage == index ? Colors.blueAccent : Colors.grey,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
      ],
    ):square();
  }
}

class BlurredItem extends StatelessWidget {
  final String text;

  const BlurredItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // Adjust the width as needed
      height: 400,
          child: Container(
            alignment: Alignment.center,
            color: Colors.black.withOpacity(0),
            child: Text(
              text,
              style: TextStyle(color: Colors.white.withOpacity(1), fontSize: 15),
            ),
          ),
       
    );
  }
}