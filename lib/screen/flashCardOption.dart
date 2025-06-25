import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flip_card/flip_card.dart';
import 'flashCardWord.dart';
import 'flashCardSentence.dart';

class flashCardOption extends StatefulWidget {
  final letter;
  final cid;
  flashCardOption({@required this.letter, this.cid});

  //const SingleFlipCard({Key? key}) : super(key: key);

  @override
  _flashCardOptionState createState() => _flashCardOptionState();
}

class _flashCardOptionState extends State<flashCardOption> with AfterLayoutMixin<flashCardOption> {
  bool flag = false;
  late String civilID;
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  void initState(){
    super.initState();
    civilID = widget.cid;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            color: Colors.transparent,
            height: 700,
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       GestureDetector(
                         child: Container(
                            margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
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
                  
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(360)
                          ),
                        ),
                        child: Icon(Icons.lightbulb_outline, size: 50),
                  
                      ),
                    ],
                  ),
                  Container(
                    child: Center(child: Text(widget.letter, style: TextStyle(fontSize: 150, ),)),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.amber.shade50,
                                borderRadius: BorderRadius.all(Radius.circular(20)
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text("جمل", style: TextStyle(fontSize: 50)),
                                  //Icon(Icons.lightbulb_outline, size: 50)
                            
                                ],
                              ),
                            ),
                            onTap: (){
                                Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) => flashCardSentence(widget.letter, civilID)
                                    )
                                );
                              },
                          ),

                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.amber.shade50,
                                borderRadius: BorderRadius.all(Radius.circular(20)
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text("كلمات" , style: TextStyle(fontSize: 50),),
                                 // Icon(Icons.lightbulb_outline, size: 50)

                                ],
                              ),
                            ),

                              onTap: (){
                                Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) => flashCardWord(widget.letter,civilID),
                                    )
                                );
                              }

                          ),

                          Container(
                            margin: EdgeInsets.all(10),
                            width: 150,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.amber.shade50,
                              borderRadius: BorderRadius.all(Radius.circular(20)
                              ),
                            ),
                            child: Column(
                              children: [
                                Text("قصص", style: TextStyle(fontSize: 50)),
                                //Icon(Icons.lightbulb_outline, size: 50)

                              ],
                            ),
                          ),
                        ],
                      ),


                  ),
                ],

              ),
            ),


          ),
        ),
      ),
      onTap: (){
        Navigator.of(context).pop(
        );
      },
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    var cardKey;
    cardKey.currentState?.toggleCard();
    // TODO: implement afterFirstLayout
  }
}

