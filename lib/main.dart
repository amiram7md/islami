import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}