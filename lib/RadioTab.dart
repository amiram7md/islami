import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class RadioTab extends StatefulWidget{
  @override
  _RadioTabState createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Image.asset('assets/images/radio_logo.png'),
          ),
          Center(
              child: Text('إذاعة القرآن الكريم',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(25),
                  child: Icon(Icons.arrow_back_ios_outlined),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  child: Icon(Icons.arrow_left_outlined),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  child: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}