import 'package:csi_app/Main_padeview/PageView.dart';
import 'package:csi_app/Navbar/BottomNavbar.dart';
import 'package:csi_app/Navbar/Navbar.dart';
import 'package:csi_app/Page/Concession/Concession.dart';
import 'package:csi_app/Page/Concession/Inner_Concession/App_request.dart';
import 'package:csi_app/Page/Concession/Inner_Concession/App_status.dart';
import 'package:csi_app/Page/More/More.dart';
import 'package:csi_app/Page/PageView/pageview.dart';
import 'package:csi_app/Page/Students/List.dart';
import 'package:csi_app/Page/profile/profile.dart';
import 'package:csi_app/Providers/NavbarProvider.dart';
import 'package:csi_app/Providers/User.dart';
import 'package:csi_app/animation/Animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=>User_details()),
      ChangeNotifierProvider(create: (_)=>NavbarState())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  MyHomePage(title: 'sad'),
      ),
    );
  }
}
final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1,initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

@override
 Widget build(BuildContext context) {
  final user=Provider.of<User_details>(context);
    final nav=Provider.of<NavbarState>(context);

    return  LayoutBuilder(
      builder:(context,constraints)=>Scaffold(
          body:Center(
                  child: Container(
                    width: double.infinity,
                    height: constraints.maxHeight,
                    color: Color.fromRGBO(103, 5, 121, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                         const Text('DJSCI',style:TextStyle(color:Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        ),
                        ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                        SingleChildScrollView(
                         scrollDirection: Axis.vertical,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: constraints.maxHeight),
                            child: Container(
                              width: constraints.maxWidth,
                              height: constraints.maxHeight-135,
                              child:          Consumer<NavbarState>(
                                      builder: (context, navProvider, child) {
                                        return PageView(
                                          controller: _pageController,
                                          children: [
                                          SwipeableItems(items: items),
                                          list_students(),
                                          Concession(user: user.user,),
                                          profile(user: user.user),
                                          more()
                                          ],
                                        );
                                      },
                                    ),
                            ),
                          ),
                        )
                            ],
                          ),
                      
                     
                      ],
                    ),
                  ),
                ),
          
          bottomNavigationBar: BottomBar(pageController: _pageController,),
        ),
    );
    
  }
}
  

