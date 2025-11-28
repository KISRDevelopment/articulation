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
      resizeToAvoidBottomInset: true,
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
  final String sentence;

  const CarouselCard({required this.sentence});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 400,
                    child: Text(
                      sentence,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: 400,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Comment",
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'ادخال',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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

          _commentController.clear();

        }} catch (e) {}


    }
  }


@override
Widget build(BuildContext context) {
  return ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
    child: LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              // keep nice height when keyboard is closed
              minHeight: constraints.maxHeight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // sentence text
                SizedBox(
                  width: 400,
                  child: Text(
                    sentence_content,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // comment field
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: _commentController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "أدخل تعليق",
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // submit button
                SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: _insertComment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'ادخال',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

}





