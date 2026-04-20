import 'package:articulation/screen/options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import '../database/patient_db_helper.dart';
import 'flashCardOption.dart';
import 'options.dart';


class Word extends StatefulWidget {
  final cid;
  final dict;
  const Word(this.dict, this.cid);

  @override
  _WordState createState() => _WordState();
}

class _WordState extends State<Word> {
  bool flag = false;
  late String civilID;

  @override
  void initState(){
    super.initState();
    civilID = widget.cid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.red[50],
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
                child: CarouselSlider(
                  items: widget.dict.map<Widget>((pictureOptions) =>
                      CarouselCard(picturesOptions: pictureOptions, cid: civilID,)).toList(),
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    onPageChanged: (position,reason){

                    },
                    enableInfiniteScroll: false,
                  ),


                ),
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


class CarouselCard extends StatefulWidget {
  final PicturesOptions picturesOptions;
  final cid;
  const CarouselCard({required this.picturesOptions, this.cid});

  @override
  State<CarouselCard> createState() => _CarouselCardState();
}

class _CarouselCardState extends State<CarouselCard> {
  TextEditingController _commentController = TextEditingController();
  late PicturesOptions pictureOption_content;
  late String civilID;

  @override
  void initState(){
    super.initState();
    pictureOption_content = widget.picturesOptions;
    civilID = widget.cid;
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
            'word': pictureOption_content.word,
            'comment': _commentController.text,
          };

          print(newComment);

          await PatientDBHelper.addWords(newComment);

          final testComment = await PatientDBHelper.getWordsByCID(int.parse(civilID));
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
          // this makes space for the keyboard
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              // make the content at least as tall as the card
              minHeight: constraints.maxHeight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // picture
                SizedBox(
                  height: 300,
                  child: Image.asset(
                    pictureOption_content.image,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 16),

                // word
                Center(
                  child: Text(
                    pictureOption_content.word,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
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

                // button
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
