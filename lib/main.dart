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
        body: Container(
          
        ),
      ) ,
    );
  }
}


