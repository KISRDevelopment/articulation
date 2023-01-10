import 'package:flutter/material.dart';

class flashCard extends StatefulWidget {
  const flashCard({Key? key}) : super(key: key);

  @override
  _flashCardState createState() => _flashCardState();
}

class _flashCardState extends State<flashCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        child: Center(
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
                      Container(
                        height: 100,
                          width: 250,
                          child: Center(child: Text("بداية الكلمة", style: TextStyle(fontSize: 50, color: Colors.grey), )),
                  decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.all(Radius.circular(20)
                  ),
                ),
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
      ),
    );
  }
}
