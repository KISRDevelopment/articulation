import 'package:flutter/material.dart';
import 'singleFlipCard.dart';

class flashCard extends StatefulWidget {
  const flashCard({Key? key}) : super(key: key);

  @override
  _flashCardState createState() => _flashCardState();
}

class _flashCardState extends State<flashCard> {
  bool flag = false;
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
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text("أ", style: TextStyle(fontSize: 70),),

                        )),
                    Container(
                      height: 100,
                      // color: Colors.grey[300],
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [

                          GestureDetector(
                            child: Container(
                              height: 100,
                              width: 250,
                              child: Center(child: Text("بداية الكلمة", style: TextStyle(fontSize: 50, color: flag ? Colors.white : Colors.grey), )),
                              decoration: BoxDecoration(
                                color: flag ? Colors.grey : Colors.grey[100],
                                borderRadius: BorderRadius.all(Radius.circular(20)
                                ),
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
                    ),
                    Container(
                      height: 100,
                      //color: Colors.grey[300],
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 250,
                            child: Center(child: Text("وسط الكلمة", style: TextStyle(fontSize: 50, color: Colors.grey))),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.all(Radius.circular(20)
                              ),
                            ),),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      // color: Colors.grey[300],
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 250,
                            child: Center(child: Text("آخر الكلمة", style: TextStyle(fontSize: 50, color: Colors.grey))),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.all(Radius.circular(20)
                              ),
                            ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedCrossFade(
              firstChild: Container(
                margin: EdgeInsets.only(top: 250, left: 950, right: 10, bottom: 10),
                width: 70,
                height: 70,


              ),
              secondChild: Container(
                margin: EdgeInsets.only(top: 250, left: 950, right: 10, bottom: 10),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(50)
                  ),
                ),
                child: Center(child: Text("ابدأ", style: TextStyle(color: Colors.black, fontSize: 35))),
              ),
              crossFadeState: flag ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 500),
            ),
            AnimatedCrossFade(
              firstChild: Container(
                margin: EdgeInsets.only(top: 350, left: 950, right: 10, bottom: 10),
                width: 70,
                height: 70,
              ),
                secondChild: Container(
                  margin: EdgeInsets.only(top: 350, left: 950, right: 10, bottom: 10),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(360)
                    ),
                  ),
                  child: Icon(Icons.view_list, size: 50.0),
                ),
              crossFadeState: flag ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 500),
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
