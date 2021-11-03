import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/HadethTab.dart';
import 'package:islami/QuranTab.dart';
import 'package:islami/RadioTab.dart';
import 'package:islami/SebhaTab.dart';
import 'package:islami/SettingsTab.dart';

void main() {
  runApp(MyApp());
}

class MyThemeData {
  static const Color primaryColor = Color.fromARGB(255, 183, 147, 95) ;
  static final ThemeData lightTheme = ThemeData(
    primaryColor: MyThemeData.primaryColor ,
    scaffoldBackgroundColor: Colors.transparent ,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent ,
      elevation: 0 ,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
  ) ;
  static final ThemeData darkTheme = ThemeData(
    primaryColor: MyThemeData.primaryColor ,
    scaffoldBackgroundColor: Colors.transparent ,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent ,
      elevation: 0 ,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
  ) ;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      routes: {
        MyHomePage.routeName : (BuildContext)=> MyHomePage(),
      },
      initialRoute: MyHomePage.routeName ,
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String routeName ='MyHomePage';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex =0 ;
  List <Widget> viewTab = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/background_screen.png'),
        Scaffold(
            appBar: AppBar(
              title: Center(
                  child: Text('Islami' , style: TextStyle(
                    color: Colors.black ,
                    fontSize: 30 ,
                  ),),
              ),
            ),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: MyThemeData.primaryColor),
              child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: (index){
                  currentIndex=index ;
                  setState(() {

                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/quran_icon.png')
                    ),
                    label: 'Quran',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/hadeth_icon.png'),
                    ),
                    label: 'Hadeth',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/sebha_icon.png'),
                    ),
                    label: 'Sebha',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/radio_icon.png'),
                    ),
                    label: 'Radio',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings)
                    ,
                    label: 'Settings',
                  ),
                ],
              ),
            ),
            body: Container(
              child: viewTab[currentIndex],
            ),
        ),
      ],
    );
  }
}