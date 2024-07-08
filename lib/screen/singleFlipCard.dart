import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flip_card/flip_card.dart';
import 'flashCard.dart';

class SingleFlipCard extends StatefulWidget {
  final letter;
  SingleFlipCard({@required this.letter});

  //const SingleFlipCard({Key? key}) : super(key: key);

  @override
  _SingleFlipCardState createState() => _SingleFlipCardState();
}

class _SingleFlipCardState extends State<SingleFlipCard> with AfterLayoutMixin<SingleFlipCard> {
  bool flag = false;
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

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
                      AnimatedCrossFade(
                        firstChild: Container(
                          margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(360)
                            ),
                          ),
                          //child: Icon(Icons.lightbulb_outline, size: 50),

                        ),
                        secondChild: GestureDetector(
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
                            setState(() {
                              flag = !flag;
                            });
                          },
                        ),
                        crossFadeState: flag ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                        duration: Duration(milliseconds: 500),
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
                    child: AnimatedCrossFade(
                      firstChild: Row(
                        children: [
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
                                Text("جمل", style: TextStyle(fontSize: 50)),
                                //Icon(Icons.lightbulb_outline, size: 50)

                              ],
                            ),
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
                                Text("عبارات", style: TextStyle(fontSize: 50)),
                                //Icon(Icons.lightbulb_outline, size: 50)

                              ],
                            ),
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
                              setState(() {
                                flag = !flag;
                              });
                            },
                          ),
                        ],
                      ),
                      secondChild: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            width: 150,
                            height: 100,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Text("", style: TextStyle(fontSize: 50)),
                                //Icon(Icons.lightbulb_outline, size: 50)

                              ],
                            ),
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
                                Text("العاب ", style: TextStyle(fontSize: 50)),
                                //Icon(Icons.lightbulb_outline, size: 50)

                              ],
                            ),
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
                                  Text("بطاقات", style: TextStyle(fontSize: 50)),
                                  //Icon(Icons.lightbulb_outline, size: 50)

                                ],
                              ),
                            ),
                              onTap: (){
                                Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) => flashCard(widget.letter),
                                    )
                                );
                              }
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            width: 150,
                            height: 100,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Text("" , style: TextStyle(fontSize: 50),),
                                // Icon(Icons.lightbulb_outline, size: 50)

                              ],
                            ),
                          ),
                        ],
                      ),
                      crossFadeState: flag ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                      duration: Duration(milliseconds: 500),
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

