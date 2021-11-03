import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/main.dart';

class QuranTab extends StatefulWidget {
  @override
  _QuranTabState createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<String> names = [
    "الفاتحه", "البقرة", "آل عمران", "النساء", "المائدة", "الأنعام",
    "الأعراف", "الأنفال", "التوبة", "يونس", "هود", "يوسف", "الرعد",
    "إبراهيم", "الحجر", "النحل", "الإسراء", "الكهف", "مريم", "طه",
    "الأنبياء", "الحج", "المؤمنون", "النّور", "الفرقان", "الشعراء",
    "النّمل", "القصص", "العنكبوت", "الرّوم", "لقمان", "السجدة", "الأحزاب",
    "سبأ", "فاطر", "يس", "الصافات","ص", "الزمر", "غافر", "فصّلت", "الشورى",
    "الزخرف", "الدّخان", "الجاثية", "الأحقاف", "محمد", "الفتح", "الحجرات",
    "ق", "الذاريات", "الطور", "النجم", "القمر", "الرحمن", "الواقعة",
    "الحديد", "المجادلة", "الحشر", "الممتحنة", "الصف", "الجمعة", "المنافقون",
    "التغابن", "الطلاق", "التحريم", "الملك", "القلم", "الحاقة", "المعارج",
    "نوح", "الجن", "المزّمّل", "المدّثر", "القيامة", "الإنسان", "المرسلات",
    "النبأ", "النازعات", "عبس", "التكوير", "الإنفطار", "المطفّفين", "الإنشقاق",
    "البروج", "الطارق", "الأعلى", "الغاشية", "الفجر", "البلد", "الشمس",
    "الليل", "الضحى", "الشرح", "التين", "العلق", "القدر", "البينة", "الزلزلة",
    "العاديات", "القارعة", "التكاثر", "العصر", "الهمزة", "الفيل", "قريش",
    "الماعون", "الكوثر", "الكافرون", "النصر", "المسد", "الإخلاص", "الفلق", "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/quran_logo.png')),
          Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: ListView.separated(
                    itemBuilder: (buildContext, index) {
                      return SuraNameWidget(names[index], index);
                    },
                    separatorBuilder: (buildContext, index) {
                      return Container(
                        height: 1,
                        color: MyThemeData.primaryColor,
                      );
                    },
                    itemCount: names.length
                ),
              )
          ),
        ],
      ),
    );
  }
}

class SuraNameWidget extends StatelessWidget {
  String suraName;
  int index;
  SuraNameWidget(this.suraName, this.index);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context,
            SuraDetails.routeName,
        arguments: SuraDetailsArgs(suraName, index) );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          suraName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

class SuraDetails extends StatefulWidget {
  static const String routeName = 'SuraDetails';

  @override
  _SuraDetailsState createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> ayat =[];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs ;
    if(ayat.isEmpty)
      readSura(args.index);
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
                Text('سورة ' + args.suraName ,
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
                      ayat.isEmpty ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemBuilder: (buildContext, index) {
                       return Text(ayat[index],
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontSize: 20 ,
                       ),);
                       },
                      itemCount: ayat.length,
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

  Future<void> readSura (int index) async {
    String fileName = 'assets/files/${index+1}.txt';
    String fileContent = await rootBundle.loadString(fileName) ;
    List<String> verses = fileContent.split('\n\r');
    ayat = verses;
    setState(() {
    });
  }
}

class SuraDetailsArgs {
  String suraName ;
  int index ;
  SuraDetailsArgs(this.suraName , this.index);
}