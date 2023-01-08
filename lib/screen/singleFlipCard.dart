import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flip_card/flip_card.dart';

class SingleFlipCard extends StatefulWidget {
  final id;
  SingleFlipCard({@required this.id});

  //const SingleFlipCard({Key? key}) : super(key: key);

  @override
  _SingleFlipCardState createState() => _SingleFlipCardState();
}

class _SingleFlipCardState extends State<SingleFlipCard> with AfterLayoutMixin<SingleFlipCard> {
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Container(
                  child: Center(child: Text('أ', style: TextStyle(fontSize: 150, ),)),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 150,
                        height: 100,
                        color: Colors.yellow,
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
                        color: Colors.yellow,
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
                        color: Colors.yellow,
                        child: Column(
                          children: [
                            Text("عبارات", style: TextStyle(fontSize: 50)),
                            //Icon(Icons.lightbulb_outline, size: 50)

                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 150,
                        height: 100,
                        color: Colors.yellow,
                        child: Column(
                          children: [
                            Text("كلمات" , style: TextStyle(fontSize: 50),),
                           // Icon(Icons.lightbulb_outline, size: 50)

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
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    var cardKey;
    cardKey.currentState?.toggleCard();
    // TODO: implement afterFirstLayout
  }
}

