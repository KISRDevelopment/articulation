import 'package:articulation/screen/sentence.dart';
import 'package:flutter/material.dart';
import 'sentence_model.dart';

class flashCardSentence extends StatefulWidget {
  final letter;
  const flashCardSentence(@required this.letter);
  


  @override
  State<flashCardSentence> createState() => _flashCardSentenceState();
}

class _flashCardSentenceState extends State<flashCardSentence> {
  late String myLetter;
  late List<String> sentenceList;

  @override
  void initState(){
    super.initState();
    myLetter = widget.letter;
    //sentenceList = sentenceDict[myLetter] ?? [];
  }
  Widget build(BuildContext context) {
    final List<Sentence> sentenceList = sentencesByLetter[myLetter] ?? [];
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        child: Stack(
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
                width: 700,
                height: 700,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)
                  ),
                ),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(10),
                          child: Text(myLetter, style: TextStyle(fontSize: 70),),
                      ),
                    ), 
                  Expanded(
                    child: ListView.builder(
                                itemCount: sentenceList.length,
                                itemBuilder: (context, index){
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      child: Align(
                                        child: Container(
                                          height: 100,
                                          width: 250,
                                          child: Center(child: Text(sentenceList[index].order, style: TextStyle(fontSize: 50),)),
                                                                            decoration: BoxDecoration(
                                                                      color: Colors.grey[300],
                                                                      borderRadius: BorderRadius.all(Radius.circular(20)
                                                                      ),
                                                                    ),
                                          
                                        ),
                                      ),
                                    
                                                        onTap:(){
                                                        //dict = showPosition('begin');
                                                        Navigator.of(context).push(
                                                            PageRouteBuilder(
                                                              pageBuilder: (_, __, ___) => sentence(sentenceList[index].content),
                                                            )
                                                        );
                                                      }
                                    ),
                                  );
                                },
                              ),
                  ),
                    
                  ],
                ),
              ),),

            
            ]
        ),
      ),
    );
  }
}