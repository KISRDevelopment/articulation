import 'package:articulation/screen/options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'flashCardOption.dart';
import 'options.dart';


class sentence extends StatefulWidget {
  final letter_sentence;


  //final dict;
  const sentence(@required this.letter_sentence);

  @override
  _sentenceState createState() => _sentenceState();
}

class _sentenceState extends State<sentence> {
  late String sentence_content;
  bool flag = false;

  @override
  void initState(){
    super.initState();
    sentence_content = widget.letter_sentence;
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
                
            child: CarouselCard(sentence: sentence_content),
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
            Positioned(
                right: 0.0,
                bottom: 350.0,
                left: 0.0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Center(
                    child: Text(sentence,
                    style: TextStyle(color: Colors.black,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold),),
                  ),
                )),
            Positioned(
                right: 0.0,
                bottom: 80.0,
                left: 0.0,
                child: Align(
                  child: Container(
                    width: 500,
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
                  width: 500,
                  child: ElevatedButton(
                    onPressed: (){
                      // Button Functionality
                    },
                    child: Text('ادخال'),
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




