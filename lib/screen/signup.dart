import 'package:articulation/database/patient_db_helper.dart';
import 'package:articulation/screen/login.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  List<Map<String, dynamic>> _patients = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController _civilIDController = TextEditingController();
  TextEditingController _fistNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _fileNumController = TextEditingController();
  TextEditingController _ageController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPatients();
  }

  Future<void> _loadPatients() async {
    final patients = await PatientDBHelper.getPatients();
    setState(() {
      _patients = patients;
    });
  }


  Future<void> _signup() async {
    if (_formKey.currentState!.validate()) {

      DateTime _loginDate = DateTime.now();
      final cid = _civilIDController.text;
      //print(cid);

      try{

        final patients = await PatientDBHelper.getPatientsByCID(int.parse(cid));

      if (patients == null) {
        //print('if-statement is true');

        final newPatient = { //create new patient
          'civil_id': _civilIDController.text,
          'first_name': _fistNameController.text,
          'last_name': _lastNameController.text,
          'file_number': _fileNumController.text,
          //'login_date': _loginDate.toIso8601String(),
          //'score': '',
        };

        //print(newPatient);

        await PatientDBHelper.addPatients(newPatient);

        //print('pass add patient');

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage(title: 'welcome $cid')),
        );
      }} catch (e) {}


    }
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: Colors.purple[200],
        appBar: AppBar(title: Text("مهارات النطق"),),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
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

                  TextFormField(
                    controller: _fistNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      labelText: 'الاسم الأول',
                    ),
                    maxLines: 2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال الاسم الأول';
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      labelText: 'الاسم الأخير',
                    ),
                    maxLines: 2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال الاسم الأخير';
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    controller: _fileNumController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      labelText: 'رقم الملف',
                    ),
                    maxLines: 2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال رقم الملف';
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    controller: _ageController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      labelText: 'العمر',
                    ),
                    maxLines: 2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال العمر';
                      }
                      return null;
                    },
                  ),

            TextButton(
              onPressed: _signup,
              child: Text('تسجيل',
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
                  MaterialPageRoute(builder: (context) => LoginPage(title: '')),
                );}, child: Text('دخول', style: TextStyle(color: Colors.white),)),
                Text('لديك حساب؟'),
              ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
