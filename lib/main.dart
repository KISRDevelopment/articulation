import 'package:articulation/database/patient_db_helper.dart';
import 'package:articulation/screen/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flip_card/flip_card.dart';
import 'package:articulation/screen/flashCardOption.dart';
import 'package:articulation/screen/info.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PatientDBHelper.initPatientDB(); //initialize patient db

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Articulation',
      home: const LoginPage(title: 'Articulation Home Page'),
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
      backgroundColor: Colors.purple[200],
      //appBar: AppBar(title: Text("مهارات النطق"),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 150, top: 10, right: 10, bottom: 10),
                      child: Center(
                          child: Text("ث",
                              style: TextStyle(
                                fontSize: 70,
                              ))),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        border: Border.all(
                          color: Colors.amber.shade50,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (_, __, ___) =>
                            flashCardOption(letter: 'ث'),
                      ));
                    }),
                GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        border: Border.all(color: Colors.amber.shade50),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                          child: Text("ت",
                              style: TextStyle(
                                fontSize: 70,
                              ))),
                      width: 100,
                      height: 100,
                    ),
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (_, __, ___) =>
                            flashCardOption(letter: 'ت'),
                      ));
                    }),
                GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        border: Border.all(color: Colors.amber.shade50),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                          child: Text("ب",
                              style: TextStyle(
                                fontSize: 70,
                              ))),
                      width: 100,
                      height: 100,
                    ),
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (_, __, ___) =>
                            flashCardOption(letter: 'ب'),
                      ));
                    }),
                GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        border: Border.all(color: Colors.amber.shade50),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                          child: Text("أ",
                              style: TextStyle(
                                fontSize: 70,
                              ))),
                      width: 100,
                      height: 100,
                    ),
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (_, __, ___) =>
                            flashCardOption(letter: 'أ'),
                      ));
                    }),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.purple[200],
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                      child: Text("مهارات النطق",
                          style: TextStyle(
                            fontSize: 30,
                          ))),
                  width: 220,
                  height: 100,
                ),
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 150, top: 10, right: 10, bottom: 10),
                    child: Center(
                        child: Text("ر",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'ر'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("ذ",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'ذ'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("د",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'د'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("خ",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'خ'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("ح",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'ح'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("ج",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'ج'),
                    ));
                  }

                  // ),
//
                  ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 150, top: 10, right: 10, bottom: 10),
                    child: Center(
                        child: Text("ط",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'ط'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("ض",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'ض'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("ص",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'ص'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("ش",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'ش'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("س",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'س'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("ز",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'ز'),
                    ));
                  }),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 150, top: 10, right: 10, bottom: 10),
                    child: Center(
                        child: Text("ك",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'ك'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("ق",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'ق'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("ف",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'ف'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("غ",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'غ'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("ع",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'ع'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("ظ",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'ظ'),
                    ));
                  }),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 150, top: 10, right: 10, bottom: 10),
                    child: Center(
                        child: Text("ي",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'ي'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("و",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'و'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("هـ",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) =>
                          flashCardOption(letter: 'هـ'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("ن",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'ن'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("م",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'م'),
                    ));
                  }),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text("ل",
                            style: TextStyle(
                              fontSize: 70,
                            ))),
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => flashCardOption(letter: 'ل'),
                    ));
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 10, top: 10, right: 10, bottom: 10),
                        child:
                            Center(child: Icon(Icons.info_outlined, size: 50)),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.amber.shade50,
                          border: Border.all(color: Colors.amber.shade50),
                          borderRadius: BorderRadius.all(Radius.circular(360)),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (_, __, ___) =>
                              InfoCard(letter: 'معلومات'),
                        ));
                      }),
                  Text("معلومات")
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, top: 10, right: 10, bottom: 10),
                    child:
                        Center(child: Icon(Icons.grading_outlined, size: 50)),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(360)),
                    ),
                  ),
                  Text("درجات")
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, top: 10, right: 10, bottom: 10),
                    child: Center(child: Icon(Icons.settings, size: 50)),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Colors.amber.shade50),
                      borderRadius: BorderRadius.all(Radius.circular(360)),
                    ),
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
