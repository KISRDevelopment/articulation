import 'package:articulation/screen/options.dart';
import 'package:articulation/screen/options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import '../database/patient_db_helper.dart';
import 'flashCardOption.dart';
import 'options.dart';


class sentence extends StatefulWidget {
  final letter_sentence;
  final cid;


  //final dict;
  const sentence(@required this.letter_sentence, this.cid);

  @override
  _sentenceState createState() => _sentenceState();
}

class _sentenceState extends State<sentence> {
  late String sentence_content;
  late String civilID;
  bool flag = false;

  @override
  void initState(){
    super.initState();
    sentence_content = widget.letter_sentence;
    civilID = widget.cid;
    //sentenceList = sentenceDict[myLetter] ?? [];
  }
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
                
            child: SentenceCarouselCard(sentence: sentence_content, cid: civilID,)
              ),
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
}

class CarouselCard extends StatelessWidget {
  final sentence;

  const CarouselCard({required this.sentence});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: [
            Center(
              child: Container(
                width: 400,
                height: 450,
                  child: Center(
                    child: Text(sentence,
                        style: TextStyle(color: Colors.black,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold),),
                  )),
            ),
            Positioned(
                right: 0.0,
                bottom: 80.0,
                left: 0.0,
                child: Align(
                  child: Container(
                    width: 400,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Comment",
                      ),
                    ),
                  ),
                ),
            ),
            Positioned(
              right: 0.0,
              bottom: 20.0,
              left: 0.0,
              child: Align(
                child: Container(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text('ادخال',  style: TextStyle(fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white
                    )
                  ),
                ),
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}




class SentenceCarouselCard extends StatefulWidget {
  final sentence;
  final cid;
  const SentenceCarouselCard({required this.sentence, this.cid});

  @override
  State<SentenceCarouselCard> createState() => _SentenceCarouselCardState();
}

class _SentenceCarouselCardState extends State<SentenceCarouselCard> {
  TextEditingController _commentController = TextEditingController();
  late final civilID;
  late String sentence_content;

  @override
  void initState(){
    super.initState();
    civilID = widget.cid;
    sentence_content = widget.sentence;
  }

  Future<void> _insertComment() async {
    {
      final comment = _commentController.text;
      print(comment);

      try{
        final patient = await PatientDBHelper.getPatientsByCID(int.parse(civilID));

        if (patient != null) {
          print('patient exist');

          final newComment = { //create new patient
            'civil_id': civilID,
            'sentence': sentence_content,
            'comment': _commentController.text,
          };

          print(newComment);

          await PatientDBHelper.addSentences(newComment);

          final testComment = await PatientDBHelper.getSentencesByCID(int.parse(civilID));
          print('test comment is:');
          print(testComment);

          print('pass add comment');

        }} catch (e) {}


    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: [
            Center(
              child: Container(
                  width: 400,
                  height: 450,
                  child: Center(
                    child: Text(sentence_content,
                      style: TextStyle(color: Colors.black,
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold),),
                  )),
            ),
            Positioned(
              right: 0.0,
              bottom: 80.0,
              left: 0.0,
              child: Align(
                child: Container(
                  width: 400,
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "أدخل تعليق",
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0.0,
              bottom: 20.0,
              left: 0.0,
              child: Align(
                child: Container(
                  width: 400,
                  child: ElevatedButton(
                      onPressed: _insertComment,
                      child: Text('ادخال',  style: TextStyle(fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white
                      )
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}





