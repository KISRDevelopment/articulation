import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(title: Text("مهارات النطق"),),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),

                  child: Center(
                      child: Text("أ", style: TextStyle(fontSize: 70, ))),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(color: Colors.yellow,
                    border: Border.all(
                        color: Colors.yellow

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),






                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Center(
                      child: Text("", style: TextStyle(fontSize: 70, ))),
                  width: 100,
                  height: 100,





                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Center(
                      child: Text("", style: TextStyle(fontSize: 70, ))),
                  width: 100,
                  height: 100,





                ),

              ],

            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Center(
                      child: Text("", style: TextStyle(fontSize: 70, ))),
                  width: 100,
                  height: 100,





                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Center(
                      child: Text("", style: TextStyle(fontSize: 70, ))),
                  width: 100,
                  height: 100,





                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Center(
                      child: Text("", style: TextStyle(fontSize: 70, ))),
                  width: 100,
                  height: 100,





                ),

              ],

            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Center(
                      child: Text("", style: TextStyle(fontSize: 70, ))),
                  width: 100,
                  height: 100,





                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Center(
                      child: Text("", style: TextStyle(fontSize: 70, ))),
                  width: 100,
                  height: 100,





                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Center(
                      child: Text("", style: TextStyle(fontSize: 70, ))),
                  width: 100,
                  height: 100,





                ),

              ],

            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Center(
                      child: Text("", style: TextStyle(fontSize: 70, ))),
                  width: 100,
                  height: 100,





                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Center(
                      child: Text("", style: TextStyle(fontSize: 70, ))),
                  width: 100,
                  height: 100,





                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Center(
                      child: Text("", style: TextStyle(fontSize: 70, ))),
                  width: 100,
                  height: 100,





                ),

              ],

            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Center(
                      child: Text("", style: TextStyle(fontSize: 70, ))),
                  width: 100,
                  height: 100,





                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Center(
                      child: Text("", style: TextStyle(fontSize: 70, ))),
                  width: 100,
                  height: 100,





                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Center(
                      child: Text("", style: TextStyle(fontSize: 70, ))),
                  width: 100,
                  height: 100,





                ),

              ],

            ),
          ],
        ),
      ) ,
    );
  }
}


