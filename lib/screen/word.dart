import 'package:articulation/screen/options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import '../database/patient_db_helper.dart';
import 'flashCardOption.dart';
import 'options.dart';


class word extends StatefulWidget {

  final cid;
  final dict;
  const word(@required this.dict, this.cid);

  @override
  _wordState createState() => _wordState();
}

class _wordState extends State<word> {
  bool flag = false;
  late String civilID;

  void initState(){
    super.initState();
    civilID = widget.cid;
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
                child: CarouselSlider(
                  items: widget.dict.map<Widget>((pictureOptions) =>
                  CarouselCard(picturesOptions: pictureOptions,cid: civilID,)).toList(),
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
  late final civilID;
  late PicturesOptions pictureOption_content;

  @override
  void initState(){
    super.initState();
    civilID = widget.cid;
    pictureOption_content = widget.picturesOptions;
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

          await PatientDBHelper.addSentences(newComment);

          final testComment = await PatientDBHelper.getWordsByCID(int.parse(civilID));
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
            Container(
                width: 400,
                height: 450,
                padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Image.asset(pictureOption_content.image, fit: BoxFit.contain)),
            Positioned(
                right: 0.0,
                bottom: 150.0,
                left: 0.0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Center(
                    child: Text(pictureOption_content.word,
                      style: TextStyle(color: Colors.black,
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold),),
                  ),
                )),
            Positioned(
              right: 0.0,
              bottom: 80.0,
              left: 0.0,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "أدخل تعليق",
                ),
              ),
            ),
            Positioned(
              right: 0.0,
              bottom: 20.0,
              left: 0.0,
              child: ElevatedButton(
                  onPressed: _insertComment,
                  child: Text('ادخال',  style: TextStyle(fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white
                  )
              ),
            ),

          ],
        ),
      ),
    );
  }
}

