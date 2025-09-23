import 'package:articulation/screen/options.dart';
import 'package:articulation/screen/story_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'flashCardOption.dart';
import 'options.dart';


class story extends StatefulWidget {
  final letter_story;


  //final dict;
  const story(@required this.letter_story);

  @override
  _storyState createState() => _storyState();
}

class _storyState extends State<story> {
  late String myLetter;
  late String story_content;
  bool flag = false;
  late List<String> storyList;

  @override
  void initState(){
    super.initState();
    myLetter = widget.letter_story;
    story_content = widget.letter_story;
    //final<Story> storyList = story[myLetter] ?? [];
  }
  @override
  Widget build(BuildContext context) {
    final List<Story> storyList = StoryByLetter[myLetter] ?? [];
    print(storyList![0].title);
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
                
            child: CarouselCard(story: storyList),
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
  final story;

  const CarouselCard({required this.story});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: [
            Positioned(
              right: 0.0,
              top: 1.0,
              left: 0.0,
              child: Center(
                child: Container(
                  width: 400,
                  height: 250,
                    child: Center(
                      child: Text(story![0].title,
                          style: TextStyle(color: Colors.black,
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold),),
                    )),
              ),
            ),
            Positioned(
              right: 0.0,
              top: 70.0,
              left: 0.0,
              child: Center(
                child: Container(
                  
                  width: 600,
                  height: 450,
                    child: Center(
                      child: Text(story![0].content,
                          style: TextStyle(color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),),
                    )),
              ),
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
                    onPressed: (){
                      // Button Functionality
                    },
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




