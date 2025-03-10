import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/components/functions.dart';
import 'package:islami/providers/themeProvider.dart';
import 'package:islami/themes/appThemes.dart';
import 'package:islami/ui/quraan/suraDetails.dart';
import 'package:provider/provider.dart';

class QuraanScreen extends StatelessWidget {
   QuraanScreen({super.key});

  List<String> listSurasNames=[
    "الفاتحة","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس",
  ];

  List<int> listVersesNumber=[
    7,286,200,176,120,165,206,75,129,109,123,111,43,52,99,128,111,110,98,135,112,78,118,64,77,227,93,88,
    69,60,34,30,73,54,45,83,182,88,75,85,54,53,89,59,37,35,38,29,18,45,60,49,62,55,78,96,29,22,24,13,14,11,11,18,12,12,30,52,52,
    44,28,28,20,56,40,31,50,40,46,42,29,19,36,25,22,17,19,26,30,20,15,21,11,8,5,19,5,8,8,11,11,8,3,9,5,4,6,3,6,3,5,4,5,6
  ];






  @override
  Widget build(BuildContext context) {

    ThemeProvider themeProvider=Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Center(child: Image.asset('assets/images/quraan_image.png')),
          const SizedBox(height: 8,),
          Container(
            width: double.infinity,
            color: themeProvider.currentMode==ThemeMode.dark?AppTheme.secondaryDarkColor:AppTheme.primaryColor,
            height: 3,
          ),
          Container(
            height: 39.07,
            child: Row(
              children: [
                 Expanded(
                  child: Center(
                    child: Text(
                      getLocal(context)!.versesNum,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                Container(
                  width: 3,
                  height: double.infinity,
                  color: themeProvider.currentMode==ThemeMode.dark?AppTheme.secondaryDarkColor:AppTheme.primaryColor,
                ),
                 Expanded(
                  child: Center(
                    child: Text(
                      getLocal(context)!.chapterNAme,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: themeProvider.currentMode==ThemeMode.dark?AppTheme.secondaryDarkColor:AppTheme.primaryColor,
            height: 3,
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context){
                            return SuraDetails(
                              index: index,
                              suraName: listSurasNames[index],
                            );
                          })
                      );
                    },
                    child: Container(
                      height: 39.07,
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                listVersesNumber[index].toString(),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Container(
                            width: 3,
                            height: double.infinity,
                            color: themeProvider.currentMode==ThemeMode.dark?AppTheme.secondaryDarkColor:AppTheme.primaryColor,
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                listSurasNames[index],
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: listSurasNames.length,
            ),
          ),
        ],
      ),
    );
  }
}
