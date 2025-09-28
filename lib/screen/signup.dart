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
    //final patients = await PatientDatabaseHelper().getAllPatients();
    final patients = await PatientDBHelper.getPatients();
    setState(() {
      _patients = patients;
    });
  }


  Future<void> _signup() async {
    if (_formKey.currentState!.validate()) {

      DateTime _loginDate = DateTime.now();
      final cid = _civilIDController.text;
      print(cid);

      try{

        //final patients = await PatientDatabaseHelper().getPatient(cid);
        final patients = await PatientDBHelper.getPatientsByCID(int.parse(cid));

      if (patients == null) {
        print('if-statement is true');

        final newPatient = { //create new patient
          'civil_id': _civilIDController.text,
          'first_name': _fistNameController.text,
          'last_name': _lastNameController.text,
          'file_number': _fileNumController.text,
          //'score': '',
          //'login_date': _loginDate.toIso8601String(),
        };

        print(newPatient);

        //await PatientDatabaseHelper().insertPatient(newPatient);
        await PatientDBHelper.addPatients(newPatient);

        final testPatient = await PatientDBHelper.getPatientsByCID(_civilIDController.text as int);
        print('new patient is is:');
        print(testPatient);

        print('pass add patient');

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
          child: Form(
            key: _formKey,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  TextFormField(
                    controller: _civilIDController,
                    //textAlign: TextAlign.right,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      labelText: 'الرقم المدني',
                    ),
                    //maxLines: 2,
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
                    //maxLines: 2,
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
                    //maxLines: 2,
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
                    //maxLines: 2,
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
                    //maxLines: 2,
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
