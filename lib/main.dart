import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:articulation/screen/singleFlipCard.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Articulation',

      home: const MyHomePage(title: 'Articulation Home Page'),
        debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      //appBar: AppBar(title: Text("مهارات النطق"),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 150, top: 10, right: 10, bottom: 10),

                  child: Center(
                      child: Text("", style: TextStyle(fontSize: 70, ))),
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
                  decoration: BoxDecoration(color: Colors.yellow,
                    border: Border.all(
                        color: Colors.yellow

                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),),
                  child: Center(
                      child: Text("", style: TextStyle(fontSize: 70, ))),
                  width: 100,
                  height: 100,





                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.yellow,
                    border: Border.all(
                        color: Colors.yellow

                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),),
                  child: Center(
                      child: Text("", style: TextStyle(fontSize: 70, ))),
                  width: 100,
                  height: 100,





                ),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.yellow,
                      border: Border.all(
                          color: Colors.yellow

                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),),
                    child: Center(
                        child: Text("أ", style: TextStyle(fontSize: 70, ))),
                    width: 100,
                    height: 100,







                  ),

                  onTap: (){
                    Navigator.of(context).push(
                      PageRouteBuilder(opaque: false,
                        pageBuilder: (_, __, ___) => SingleFlipCard(letter: 'أ'),
                      )
                    );
                  }
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.lightBlueAccent,

                    borderRadius: BorderRadius.all(Radius.circular(20)),),
                  child: Center(
                      child: Text("مهارات النطق", style: TextStyle(fontSize: 30, ))),
                  width: 220,
                  height: 100,





                ),


              ],

            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 150, top: 10, right: 10, bottom: 10),

                child: Center(
                    child: Text("", style: TextStyle(fontSize: 70, ))),
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
                decoration: BoxDecoration(color: Colors.yellow,
                  border: Border.all(
                      color: Colors.yellow

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),
                child: Center(
                    child: Text("", style: TextStyle(fontSize: 70, ))),
                width: 100,
                height: 100,





              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.yellow,
                  border: Border.all(
                      color: Colors.yellow

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),
                child: Center(
                    child: Text("", style: TextStyle(fontSize: 70, ))),
                width: 100,
                height: 100,





              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.yellow,
                  border: Border.all(
                      color: Colors.yellow

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),
                child: Center(
                    child: Text("", style: TextStyle(fontSize: 70, ))),
                width: 100,
                height: 100,





              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.yellow,
                  border: Border.all(
                      color: Colors.yellow

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),
                child: Center(
                    child: Text("", style: TextStyle(fontSize: 70, ))),
                width: 100,
                height: 100,





              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.yellow,
                  border: Border.all(
                      color: Colors.yellow

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),
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
                margin: EdgeInsets.only(left: 150, top: 10, right: 10, bottom: 10),

                child: Center(
                    child: Text("", style: TextStyle(fontSize: 70, ))),
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
                decoration: BoxDecoration(color: Colors.yellow,
                  border: Border.all(
                      color: Colors.yellow

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),
                child: Center(
                    child: Text("", style: TextStyle(fontSize: 70, ))),
                width: 100,
                height: 100,





              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.yellow,
                  border: Border.all(
                      color: Colors.yellow

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),
                child: Center(
                    child: Text("", style: TextStyle(fontSize: 70, ))),
                width: 100,
                height: 100,





              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.yellow,
                  border: Border.all(
                      color: Colors.yellow

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),
                child: Center(
                    child: Text("", style: TextStyle(fontSize: 70, ))),
                width: 100,
                height: 100,





              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.yellow,
                  border: Border.all(
                      color: Colors.yellow

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),
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
                margin: EdgeInsets.only(left: 150, top: 10, right: 10, bottom: 10),

                child: Center(
                    child: Text("", style: TextStyle(fontSize: 70, ))),
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
                decoration: BoxDecoration(color: Colors.yellow,
                  border: Border.all(
                      color: Colors.yellow

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),
                child: Center(
                    child: Text("", style: TextStyle(fontSize: 70, ))),
                width: 100,
                height: 100,





              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.yellow,
                  border: Border.all(
                      color: Colors.yellow

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),
                child: Center(
                    child: Text("", style: TextStyle(fontSize: 70, ))),
                width: 100,
                height: 100,





              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.yellow,
                  border: Border.all(
                      color: Colors.yellow

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),
                child: Center(
                    child: Text("", style: TextStyle(fontSize: 70, ))),
                width: 100,
                height: 100,





              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.yellow,
                  border: Border.all(
                      color: Colors.yellow

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),
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
                margin: EdgeInsets.only(left: 150, top: 10, right: 10, bottom: 10),

                child: Center(
                    child: Text("", style: TextStyle(fontSize: 70, ))),
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
                decoration: BoxDecoration(color: Colors.yellow,
                  border: Border.all(
                      color: Colors.yellow

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),
                child: Center(
                    child: Text("", style: TextStyle(fontSize: 70, ))),
                width: 100,
                height: 100,





              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.yellow,
                  border: Border.all(
                      color: Colors.yellow

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),
                child: Center(
                    child: Text("", style: TextStyle(fontSize: 70, ))),
                width: 100,
                height: 100,





              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.yellow,
                  border: Border.all(
                      color: Colors.yellow

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),
                child: Center(
                    child: Text("", style: TextStyle(fontSize: 70, ))),
                width: 100,
                height: 100,





              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.yellow,
                  border: Border.all(
                      color: Colors.yellow

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),),
                child: Center(
                    child: Text("", style: TextStyle(fontSize: 70, ))),
                width: 100,
                height: 100,





              ),

            ],

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),

                    child: Center(
                        child: Icon(Icons.info_outlined, size: 50)),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.yellow,
                      border: Border.all(
                          color: Colors.yellow

                      ),

                      borderRadius: BorderRadius.all(Radius.circular(360)),),






                  ),
                  Text("معلومات")
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),

                    child: Center(
                        child: Icon(Icons.grading_outlined, size: 50)),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.yellow,
                      border: Border.all(
                          color: Colors.yellow

                      ),
                      borderRadius: BorderRadius.all(Radius.circular(360)),),






                  ),
                  Text("درجات")
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),

                    child: Center(
                        child: Icon(Icons.queue_outlined, size: 50)),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.yellow,
                      border: Border.all(
                          color: Colors.yellow

                      ),
                      borderRadius: BorderRadius.all(Radius.circular(360)),),






                  ),
                  Text("أصوات متعدده")
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),

                    child: Center(
                        child: Icon(Icons.settings, size: 50)),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.yellow,
                      border: Border.all(
                          color: Colors.yellow

                      ),
                      borderRadius: BorderRadius.all(Radius.circular(360)),),






                  ),
                  Text("اعدادات")
                ],
              ),


            ],

          ),
        ],
      ),
    );
  }
}


