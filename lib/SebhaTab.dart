import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/main.dart';

class SebhaTab extends StatefulWidget {
  @override
  _SebhaTabState createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0 ;
  int counter = 0 ;
  int index = 0 ;
  List <String> tasbeh = [
    "سبحان الله", "الحمد لله", "الله أكبر", "لا اله الا الله"
  ];
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return  Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional.topCenter ,
              children:[
                Container(
                  margin: EdgeInsets.only(bottom: 95 , left: 50),
                    child: Image.asset(
                        isDarkMode ? 'assets/images/sebha_logo1_dark.png'
                        : 'assets/images/sebha_logo1.png'
                    )
                ),
                Container(
                  margin: EdgeInsets.only(top: 80),
                  child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                          isDarkMode ? 'assets/images/sebha_logo2_dark.png'
                          : 'assets/images/sebha_logo2.png'
                      )
                  ),
                ),
              ]
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
          margin: EdgeInsets.all(25),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Center(
                    child: Text(AppLocalizations.of(context)!.sebha_count ,
                      style: TextStyle(
                          fontSize: 25 ,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDarkMode ? Color.fromARGB(255, 21, 27, 48)
                            : Color.fromARGB(255, 207, 185, 151)
                         ,
                        borderRadius: BorderRadius.circular(15) ,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 20),
                      child: Text('$counter' ,
                        style: TextStyle(
                            fontSize: 25 ,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          isDarkMode ? MyThemeData.primaryColorDark2
                          : MyThemeData.primaryColor,) ,
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),),
                      ),
                      child: Text(tasbeh[index] ,
                        style: TextStyle(
                          fontSize: 25 ,
                          fontWeight: FontWeight.bold ,
                        ),
                      ),
                      onPressed: (){
                        onButtonClick() ;
                      },
                    ),
                  ),
                ),
              ]
          ),
          ),
        ),
      ],
    );
  }
  void onButtonClick () {
    if (counter <33) {
      counter++;
      setState(() {
        angle += 20 ;
      });
    } else {
      if (index < tasbeh.length-1){
        index ++ ;
        counter = 0 ;
        setState(() {
          angle += 20 ;
        });
      } else {
          index = 0 ;
          counter = 0 ;
          setState(() {
            angle += 20 ;
          });
      }
    }
  }
}
