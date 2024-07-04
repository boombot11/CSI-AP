import 'package:csi_app/Providers/NavbarProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Icon> icons=[
  Icon(Icons.home,color: Colors.white,size: 45),
  Icon(Icons.directions_railway_filled,color: Colors.white,size: 45),
  Icon(Icons.menu_book,color: Colors.white,size: 45),
  Icon(Icons.person,color: Colors.white,size: 45),
  Icon(Icons.more_horiz_sharp,color: Colors.white,size: 45)
];
List<String> labels=[
'Home','Students','Railway','Profile','More'
];
class BottomBar extends StatelessWidget{
  final PageController pageController;

  BottomBar({super.key,required this.pageController});

List<BottomNavigationBarItem> list=[];


  @override
  Widget build(BuildContext context) {
  final navProvider = Provider.of<NavbarState>(context);
  for(int i=0;i<5;i++){
  final a=items(icon: const Icon(Icons.abc));
  list.add(
    BottomNavigationBarItem(icon: a.icons(navProvider.key,i,icons[i]),label:labels[i],backgroundColor: Color.fromRGBO(214, 28, 223, 1)),
  );
  }
 return BottomNavigationBar(
  currentIndex: navProvider.key,
selectedItemColor: Colors.white70,
unselectedItemColor: Colors.white70,
showSelectedLabels: true,
showUnselectedLabels: true,
 selectedLabelStyle: const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w900,
  fontSize: 14,
 ),
onTap: (value)=>{
  navProvider.ChangeKey(value),
  pageController.jumpToPage(value),
},  
items: 
list.map((item) => item).toList()
);
  }

}
class items extends BottomNavigationBarItem{

  items({required super.icon});
  Widget icons(index,i,icons){
    if(index==i){
      return IconProvider(mode:1,icon:icons);
    }
   else {
 return IconProvider(mode: 0,icon:icons);
   }
  }
}
class IconProvider extends StatefulWidget{
  int mode;
  Icon icon;
   IconProvider({super.key,required this.mode,required this.icon});
  @override
 State<IconProvider> createState()=> _IconProvider();
}
class _IconProvider extends State<IconProvider>{
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
             if(widget.mode==1) Transform.translate(
              offset: Offset(0, -4),
               child: Container(
                height: 45,
                width: 40,
                        decoration: BoxDecoration(
                           color: Colors.grey.shade50.withOpacity(0.3),
                           border:const Border(
                top: BorderSide(color: Colors.white, width: 3)
                           ),
                           borderRadius:const BorderRadius.vertical(
                bottom: Radius.elliptical(15, 25),
                           ),
                         ),
                         child: Transform.translate(
                          offset: Offset(-1.3,-2),
                          child: widget.icon),
                       ),
             ),
         if(widget.mode==0)Container(
          child: widget.icon,
         )
      ],
    );
  }

}