import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:islami/radios.dart';
import 'main.dart';
import 'radio_response.dart';

class RadioTab extends StatefulWidget {
  @override
  _RadioTabState createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset('assets/images/radio_logo.png'),
          ),
          Expanded(
            flex: 2,
            child: FutureBuilder<RadioResponse>(
              future: getRadios(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: PageScrollPhysics(),
                    itemCount: snapshot.data?.radios?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Center(
                        child: RadioItem(snapshot.data!.radios!.elementAt(index),
                            playAudio , stopAudio)
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('${snapshot.error}'));
                }
                // By default, show a loading spinner.
                return Center(
                    child: CircularProgressIndicator(
                      color: isDarkMode
                          ? MyThemeData.primaryColorDark2
                          : MyThemeData.primaryColor,
                    )
                );
              },
            )
          ),
        ],
      ),
    );
  }
  var audio = AudioPlayer();
  playAudio(url)  {
    audio.stop();
    audio.play(url);
  }
  stopAudio()  {
    audio.pause();
  }


}

 Future<RadioResponse> getRadios()async {
  http.Response response = await http.get(
      Uri.parse('http://api.mp3quran.net/radios/radio_arabic.json'));
  if (response.statusCode == 200) {
    return RadioResponse.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes))) ;
  } else {
    throw Exception('Failed to load radios');
  }
}

class RadioItem extends StatelessWidget{
  Radios radio ;
  Function playAudio ;
  Function stopAudio ;
  RadioItem(this.radio, this.playAudio, this.stopAudio);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                radio.name ?? '' ,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(25),
                child: IconButton(
                  icon: Icon(
                    Icons.pause,
                    size: 35,
                    color: isDarkMode
                        ? MyThemeData.primaryColorDark2
                        : MyThemeData.primaryColor,
                  ),
                  onPressed: (){
                    stopAudio();
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: IconButton(
                  icon: Icon(
                    Icons.play_arrow,
                    size: 35,
                    color: isDarkMode
                        ? MyThemeData.primaryColorDark2
                        : MyThemeData.primaryColor,
                  ),
                  onPressed: (){
                    playAudio(radio.radioUrl);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}