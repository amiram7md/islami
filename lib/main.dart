import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/HadethTab.dart';
import 'package:islami/QuranTab.dart';
import 'package:islami/RadioTab.dart';
import 'package:islami/SebhaTab.dart';
import 'package:islami/SettingsTab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      iconTheme: IconThemeData(
        color: Colors.black ,
        size: 20
      ),
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
        iconTheme: IconThemeData(
            color: Colors.black ,
            size: 20
        ),
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

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('ar'),

      routes: {
        MyHomePage.routeName : (BuildContext)=> MyHomePage(),
        SuraDetails.routeName : (BuildContext)=> SuraDetails(),
        HadethDetails.routeName : (BuildContext)=> HadethDetails(),

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
        Image.asset('assets/images/background_screen.png' ,
          fit: BoxFit.fill,
        width: double.infinity,),
        Scaffold(
            appBar: AppBar(
              title: Center(
                  child: Text(AppLocalizations.of(context)!.app_tittle ,
                    style: TextStyle(
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
                      AssetImage('assets/images/quran_icon.png' ,)
                    ),
                    label: AppLocalizations.of(context)!.quran,
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/hadeth_icon.png'),
                    ),
                    label: AppLocalizations.of(context)!.hadeth,
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/sebha_icon.png'),
                    ),
                    label: AppLocalizations.of(context)!.sebha,
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/radio_icon.png'),
                    ),
                    label: AppLocalizations.of(context)!.radio,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings,
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