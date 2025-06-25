import 'package:articulation/main.dart';
import 'package:articulation/screen/signup.dart';
import 'package:flutter/material.dart';
import '../database/patient_db_helper.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<Map<String, dynamic>> _patients = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController _civilIDController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPatients();
  }

  Future<void> _loadPatients() async {
    //final patients = await PatientDatabaseHelper().getAllPatients();
    final patients = await PatientDBHelper.getPatients();
    setState(() {
      _patients = patients;
    });
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      DateTime _loginDate = DateTime.now();
      final cid = _civilIDController.text;
      print(cid);

      try{

        //final patient = await PatientDatabaseHelper().getPatient(cid);
        final patient = await PatientDBHelper.getPatientsByCID(int.parse(cid));
        print(patient);

        if (patient != null) {
          print('if-statement is true');

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage(title: 'welcome $cid', cid: cid,)),
          );
        }} catch (e) {}


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(title: Text("مهارات النطق"),),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: 
          Center( child: 
          Container( width: 500, child:
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _civilIDController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'الرقم المدني',
                  ),
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال الرقم المدني';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextButton(
                  onPressed: _login,
                  child: Text('دخول',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  TextButton(onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage(title: '')),
                  );}, child: Text('تسجيل', style: TextStyle(color: Colors.white),)),
                  Text('مستخدم جديد؟'),
                ],)
              ],
            ),
          ),
        ),
      ), ), ),
    );
  }
}
