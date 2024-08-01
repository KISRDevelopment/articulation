import 'package:flutter/material.dart';
import 'singleFlipCard.dart';
import 'flashcardWord.dart';
import 'options.dart';

class flashCard extends StatefulWidget {
  final letter;
  const flashCard(@required this.letter);

  @override
  _flashCardState createState() => _flashCardState();
}

class _flashCardState extends State<flashCard> {
  late List dict;
  bool flag = false;
  bool medial = false;
  bool end = false;
  late String letters;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        child:  Stack(
          children: [
            GestureDetector(
              child: Container(
                margin: EdgeInsets.all(10),
                width: 50,
                height: 50,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(360)
                  ),
                ),
                child: Icon(Icons.arrow_back_ios, size: 50),
              ),
              onTap: (){
                Navigator.of(context).pop(
                );
              },
            ),
            Center(
              child: Container(
                //color: Colors.white,
                width: 700,
                height: 700,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)
                  ),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(widget.letter, style: TextStyle(fontSize: 70),),

                        )),
                    Container(
                      height: 100,
                      // color: Colors.grey[300],
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [

                          GestureDetector(
                            child: Container(
                              height: 100,
                              width: 250,
                              child: Center(child: Text("بداية الكلمة", style: TextStyle(fontSize: 50, color: flag ? Colors.white : Colors.grey), )),
                              decoration: BoxDecoration(
                                color: flag ? Colors.grey : Colors.grey[100],
                                borderRadius: BorderRadius.all(Radius.circular(20)
                                ),
                              ),

                            ),
                            onTap: (){
                              setState(() {

                                flag = !flag;

                                if(medial == true){
                                  medial = !medial;
                                }else if(end == true){
                                  end = !end;
                                }
                                letters = widget.letter;
                                dict = showPosition('begin');



                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      //color: Colors.grey[300],
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Container(
                              height: 100,
                              width: 250,
                              child: Center(child: Text("وسط الكلمة", style: TextStyle(fontSize: 50, color: medial ? Colors.white : Colors.grey))),
                              decoration: BoxDecoration(
                                color: medial ? Colors.grey : Colors.grey[100],
                                borderRadius: BorderRadius.all(Radius.circular(20)
                                ),
                              ),),
                            onTap: (){
                              setState(() {
                                medial = !medial;

                                if(flag == true){
                                  flag = !flag;
                                }else if(end == true){
                                  end = !end;
                                }
                                letters = widget.letter;
                                dict = showPosition('medial');



                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      // color: Colors.grey[300],
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Container(
                              height: 100,
                              width: 250,
                              child: Center(child: Text("آخر الكلمة", style: TextStyle(fontSize: 50, color: end ? Colors.white : Colors.grey))),
                              decoration: BoxDecoration(
                                color: end ? Colors.grey : Colors.grey[100],
                                borderRadius: BorderRadius.all(Radius.circular(20)
                                ),
                              ),),
                            onTap: (){
                              setState(() {
                                end = !end;

                                if(medial == true){
                                  medial = !medial;
                                }else if(flag == true){
                                  flag = !flag;
                                }
                                letters = widget.letter;

                                dict = showPosition('end');



                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedCrossFade(
              firstChild: Container(
                margin: EdgeInsets.only(top: 250, left: 950, right: 10, bottom: 10),
                width: 70,
                height: 70,


              ),
              secondChild: Container(
                margin: EdgeInsets.only(top: 250, left: 950, right: 10, bottom: 10),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(50)
                  ),
                ),
                child: GestureDetector(child: Center(
                    child: Text("ابدأ", style: TextStyle(
                        color: Colors.black, fontSize: 35)
                    )
                ),
                  onTap:(){
                    //dict = showPosition('begin');
                    Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => flashCardWord(dict),
                        )
                    );
                  }
                ),
              ),
              crossFadeState: (flag||medial||end) ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 500),
            ),
            AnimatedCrossFade(
              firstChild: Container(
                margin: EdgeInsets.only(top: 350, left: 950, right: 10, bottom: 10),
                width: 70,
                height: 70,
              ),
                secondChild: Container(
                  margin: EdgeInsets.only(top: 350, left: 950, right: 10, bottom: 10),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(360)
                    ),
                  ),
                  child: Icon(Icons.view_list, size: 50.0),
                ),
              crossFadeState: (flag||medial||end) ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 500),
            ),
            Container(
              margin: EdgeInsets.only(top: 750, left: 1000, right: 10, bottom: 10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(360)
                ),
              ),
              child: Icon(Icons.settings),
            ),
          ],
        ),
      ),
      );
    //);
  }
  showPosition(pos){
    switch(pos){
      case 'begin':
        dict = showLetterBegin(letters);
        return dict;
      case 'medial':
        dict = showLetterMed(letters);
        return dict;
      case 'end':
        dict = showLetterEnd(letters);
        return dict;
      default:
        break;
    }
  }
  showLetterBegin(pos){
    switch(pos){
      case 'أ':
        dict = PicturesOptions.picListBeginAlf;
        return dict;
      case 'ث':
        dict = PicturesOptions.picListBeginTh;
        return dict;
      case 'ت':
        dict = PicturesOptions.picListBeginTaa;
        return dict;
      case 'ب':
        dict = PicturesOptions.picListBeginBaa;
        return dict;
      case 'ج':
        dict = PicturesOptions.picListBeginJa;
        return dict;
      case 'ح':
        dict = PicturesOptions.picListBeginHa;
        return dict;
      case 'خ':
        dict = PicturesOptions.picListBeginKha;
        return dict;
      case 'د':
        dict = PicturesOptions.picListBeginDa;
        return dict;
      case 'ذ':
        dict = PicturesOptions.picListBeginTha;
        return dict;
      case 'ر':
        dict = PicturesOptions.picListBeginRa;
        return dict;
      case 'ز':
        dict = PicturesOptions.picListBeginZa;
        return dict;
      case 'س':
        dict = PicturesOptions.picListBeginSa;
        return dict;
      case 'ش':
        dict = PicturesOptions.picListBeginSha;
        return dict;
      case 'ص':
        dict = PicturesOptions.picListBeginSsa;
        return dict;
      case 'ض':
        dict = PicturesOptions.picListBeginTtha;
        return dict;
      case 'ط':
        dict = PicturesOptions.picListBeginTta;
        return dict;
      case 'ظ':
        dict = PicturesOptions.picListBeginZha;
        return dict;
      case 'ع':
        dict = PicturesOptions.picListBeginAa;
        return dict;
      case 'غ':
        dict = PicturesOptions.picListBeginGha;
        return dict;
      case 'ف':
        dict = PicturesOptions.picListBeginFa;
        return dict;
      case 'ق':
        dict = PicturesOptions.picListBeginQa;
        return dict;
      case 'ك':
        dict = PicturesOptions.picListBeginKa;
        return dict;
      case 'ل':
        dict = PicturesOptions.picListBeginLa;
        return dict;
      case 'م':
        dict = PicturesOptions.picListBeginMa;
        return dict;
      case 'ن':
        dict = PicturesOptions.picListBeginNa;
        return dict;
      case 'ه':
        dict = PicturesOptions.picListBeginHuh;
        return dict;





      default:
        break;
    }
  }
  showLetterMed(pos){
    switch(pos){
      case 'أ':
        dict = PicturesOptions.picListMedAlf;
        return dict;
      case 'ث':
        dict = PicturesOptions.picListMedTh;
        return dict;
      case 'ت':
        dict = PicturesOptions.picListMedTaa;
        return dict;
      case 'ب':
        dict = PicturesOptions.picListMedBaa;
        return dict;
      case 'ج':
        dict = PicturesOptions.picListMedJa;
        return dict;
      case 'ح':
        dict = PicturesOptions.picListMedHa;
        return dict;
      case 'خ':
        dict = PicturesOptions.picListMedKha;
        return dict;
      case 'د':
        dict = PicturesOptions.picListMedDa;
        return dict;
      case 'ذ':
        dict = PicturesOptions.picListMedTha;
        return dict;
      case 'ر':
        dict = PicturesOptions.picListMedRa;
        return dict;
      case 'ز':
        dict = PicturesOptions.picListMedZa;
        return dict;
      case 'س':
        dict = PicturesOptions.picListMedSa;
        return dict;
      case 'ش':
        dict = PicturesOptions.picListMedSha;
        return dict;
      case 'ص':
        dict = PicturesOptions.picListMedSsa;
        return dict;
      case 'ض':
        dict = PicturesOptions.picListMedTtha;
        return dict;
      case 'ط':
        dict = PicturesOptions.picListMedTta;
        return dict;
      case 'ظ':
        dict = PicturesOptions.picListMedZha;
        return dict;

      case 'ع':
        dict = PicturesOptions.picListMedAa;
        return dict;
      case 'غ':
        dict = PicturesOptions.picListMedGha;
        return dict;
      case 'ف':
        dict = PicturesOptions.picListMedFa;
        return dict;
      case 'ق':
        dict = PicturesOptions.picListMedQa;
        return dict;
      case 'ك':
        dict = PicturesOptions.picListMedKa;
        return dict;
      case 'ل':
        dict = PicturesOptions.picListMedLa;
        return dict;
      case 'م':
        dict = PicturesOptions.picListMedMa;
        return dict;
      case 'ن':
        dict = PicturesOptions.picListMedNa;
        return dict;
      case 'ه':
        dict = PicturesOptions.picListMedHuh;
        return dict;

      default:
        break;
    }
  }
  showLetterEnd(pos){
    switch(pos){
      case 'أ':
        dict = PicturesOptions.picListEndAlf;
        return dict;
      case 'ث':
        dict = PicturesOptions.picListEndTh;
        return dict;
      case 'ت':
        dict = PicturesOptions.picListEndTaa;
        return dict;
      case 'ب':
        dict = PicturesOptions.picListEndBaa;
        return dict;
      case 'ج':
        dict = PicturesOptions.picListEndJa;
        return dict;
      case 'ح':
        dict = PicturesOptions.picListEndHa;
        return dict;
      case 'خ':
        dict = PicturesOptions.picListEndKha;
        return dict;
      case 'د':
        dict = PicturesOptions.picListEndDa;
        return dict;
      case 'ذ':
        dict = PicturesOptions.picListEndTha;
        return dict;
      case 'ر':
        dict = PicturesOptions.picListEndRa;
        return dict;
      case 'ز':
        dict = PicturesOptions.picListEndZa;
        return dict;
      case 'س':
        dict = PicturesOptions.picListEndSa;
        return dict;
      case 'ش':
        dict = PicturesOptions.picListEndSha;
        return dict;
      case 'ص':
        dict = PicturesOptions.picListEndSsa;
        return dict;
      case 'ض':
        dict = PicturesOptions.picListEndTtha;
        return dict;
      case 'ط':
        dict = PicturesOptions.picListEndTta;
        return dict;
      case 'ظ':
        dict = PicturesOptions.picListEndZha;
        return dict;
      case 'ع':
        dict = PicturesOptions.picListEndAa;
        return dict;
      case 'غ':
        dict = PicturesOptions.picListEndGha;
        return dict;
      case 'ف':
        dict = PicturesOptions.picListEndFa;
        return dict;
      case 'ق':
        dict = PicturesOptions.picListEndQa;
        return dict;
      case 'ك':
        dict = PicturesOptions.picListEndKa;
        return dict;
      case 'ل':
        dict = PicturesOptions.picListEndLa;
        return dict;
      case 'م':
        dict = PicturesOptions.picListEndMa;
        return dict;
      case 'ن':
        dict = PicturesOptions.picListEndNa;
        return dict;
      case 'ه':
        dict = PicturesOptions.picListEndHuh;
        return dict;



      default:
        break;
    }
  }




}
