import 'package:articulation/database/patient_db_helper.dart';
import 'package:articulation/screen/options.dart';
import 'package:articulation/screen/story_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'flashCardOption.dart';
import 'options.dart';


class story extends StatefulWidget {
  final letter_story;
  final cid;


  //final dict;
  const story(@required this.letter_story, this.cid);

  @override
  _storyState createState() => _storyState();
}

class _storyState extends State<story> {
  late String myLetter;
  late String story_content;
  bool flag = false;
  late List<String> storyList;
  late String civilID;

  @override
  void initState(){
    super.initState();
    myLetter = widget.letter_story;
    story_content = widget.letter_story;
    civilID = widget.cid;
    //final<Story> storyList = story[myLetter] ?? [];
  }
  @override
  Widget build(BuildContext context) {
    final List<Story> storyList = StoryByLetter[myLetter] ?? [];
    print(storyList![0].title);
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
                
            child: CarouselCard(story: storyList, cid: civilID),
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
  final cid;

  const CarouselCard({required this.story, this.cid});

  @override
  Widget build(BuildContext context) {
    final currentStory = story[0]; // same as before

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
                // keeps layout nice when keyboard is closed
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // title
                  SizedBox(
                    width: 400,
                    child: Text(
                      currentStory.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // story content
                  SizedBox(
                    width: 600,
                    child: Text(
                      currentStory.content,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // comment + button
                  StoryCarouselCard(
                    Story: currentStory.content,
                    cid: this.cid,
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

class StoryCarouselCard extends StatefulWidget {
  final Story;
  final cid;
  const StoryCarouselCard({required this.Story, this.cid});

  @override
  State<StoryCarouselCard> createState() => _StoryCarouselCardState();
}

class _StoryCarouselCardState extends State<StoryCarouselCard> {
  TextEditingController _commentController = TextEditingController();
  late final civilID;
  late String Story_content;

  @override
  void initState(){
    super.initState();
    civilID = widget.cid;
    Story_content = widget.Story;
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
            'story': Story_content,
            'comment': _commentController.text,
          };

          print(newComment);

          await PatientDBHelper.addStory(newComment);

          final testComment = await PatientDBHelper.getStoriesByCID(int.parse(civilID));
          print('test comment is:');
          print(testComment);

          print('pass add comment');

          _commentController.clear();

        }} catch (e) {}


    }
  }


@override
Widget build(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
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
  );
}

}




