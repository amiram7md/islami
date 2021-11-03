import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/main.dart';

class HadethTab extends StatefulWidget{
  @override
  _HadethTabState createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List <String> tittle = [
  "الحديث الأول","الحديث الثاني", "الحديث الثالث","الحديث الرابع","الحديث الخامس",
  "الحديث السادس","الحديث السابع","الحديث الثامن","الحديث التاسع","الحديث العاشر",
  "الحديث الحادي عشر","الحديث الثاني عشر","الحديث الثالث عشر","الحديث الرابع عشر",
  "الحديث الخامس عشر","الحديث السادس عشر","الحديث السابع عشر","الحديث الثامن عشر",
  "الحديث التاسع عشر","الحديث العشرون","الحديث الواحد والعشرون","الحديث الثاني والعشرون",
  "الحديث الثالث والعشرون","الحديث الرابع والعشرون","الحديث الخامس والعشرون",
  "الحديث السادس والعشرون","الحديث السابع والعشرون","الحديث الثامن والعشرون",
  "الحديث التاسع والعشرون","الحديث الثلاثون","الحديث الواحد والثلاثون",
  "الحديث الثاني والثلاثون","الحديث الثالث والثلاثون","الحديث الرابع والثلاثون",
  "الحديث الخامس والثلاثون","الحديث السادس والثلاثون","الحديث السابع والثلاثون",
  "الحديث الثامن والثلاثون","الحديث التاسع والثلاثون","الحديث الأربعون",
  "الحديث الواحد والأربعون","الحديث الثاني والأربعون","الحديث الثالث والأربعون",
  "الحديث الرابع والأربعون","الحديث الخامس والأربعون","الحديث السادس والأربعون",
  "الحديث السابع والأربعون","الحديث الثامن والأربعون","الحديث التاسع والأربعون",
  "الحديث الخمسون"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/hadeth_logo.png')),
          Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: ListView.separated(
                    itemBuilder: (buildContext, index) {
                      return HadethTittleWidget(tittle[index],index);
                    },
                    separatorBuilder: (buildContext, index) {
                      return Container(
                        height: 1,
                        color: MyThemeData.primaryColor,
                      );
                    },
                    itemCount: tittle.length
                ),
              )
          ),
        ],
      ),
    );
  }
}


class HadethTittleWidget extends StatelessWidget {
  String tittle;
  int index;
  HadethTittleWidget(this.tittle, this.index);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context,
            HadethDetails.routeName,
            arguments: HadethDetailsArgs(tittle, index) );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          tittle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

class HadethDetailsArgs {
  String tittle ;
  int index ;
  HadethDetailsArgs(this.tittle,this.index);
}

class HadethDetails extends StatefulWidget{
  static const String routeName = 'HadethDetails';

  @override
  _HadethDetailsState createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  List<String> hadeth =[];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as HadethDetailsArgs ;
    if(hadeth.isEmpty)
      readHadeth(args.index);
    return Stack(
      children: [
        Image.asset('assets/images/background_screen.png'),
        Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(AppLocalizations.of(context)!.app_tittle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white ,
              borderRadius: BorderRadius.circular(10) ,
            ),
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.all(25),
            child: Column(
                children: [
                  Text(args.tittle ,
                    style: TextStyle(
                        fontSize: 25
                    ),),
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    height: 1,
                    color: MyThemeData.primaryColor,
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      child:
                      hadeth.isEmpty ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                        itemBuilder: (buildContext, index) {
                          return Text(hadeth[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20 ,
                            ),);
                        },
                        itemCount: hadeth.length,
                      ) ,
                    ),
                  ),
                ]
            ),
          ),
        )
      ],
    );
  }

  Future<void> readHadeth (int index) async {
    String fileName = 'assets/files/h${index+1}.txt';
    String fileContent = await rootBundle.loadString(fileName) ;
    List<String> ahadeth = fileContent.split('\n');
    hadeth = ahadeth ;
    setState(() {
    });
  }
}