import 'package:articulation/database/patient_db_helper.dart';
import 'package:articulation/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          'civil_id': int.parse(_civilIDController.text),
          'first_name': _fistNameController.text,
          'last_name': _lastNameController.text,
          'file_number':int.parse( _fileNumController.text),
          'age': int.parse(_ageController.text)
          //'score': '',
          //'login_date': _loginDate.toIso8601String(),
        };

        print(newPatient);

        //await PatientDatabaseHelper().insertPatient(newPatient);
        await PatientDBHelper.addPatients(newPatient);

        if (!mounted) return;

        /*ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Patient registered successfully'),
        ),
        );*/

        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'تم تسجيل المستخدم',
              textAlign: TextAlign.center,
              ),
              content: const Text(
                'تم تسجيل المريض بنجاح',
                textAlign: TextAlign.center,
                ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('موافق'),
            ),
          ],
        );
      },
    );

    if (!mounted) return;

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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child:   Center( child: 
          Container( width: 500, child:
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 20,),
                  TextFormField(
                    controller: _civilIDController,
                    keyboardType: TextInputType.number,
                    //limiting the number of digits to reach only 12
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(12),
                    ],
                    //textAlign: TextAlign.right,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      helperText: 'يجب إدخال الرقم المدني ١٢ رقما',
                      labelText: 'الرقم المدني',
                      
                      labelStyle:TextStyle(
                        fontSize: 18,
                      ),

                      floatingLabelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    //maxLines: 2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال الرقم المدني';
                      }

                      if (value.length != 12){
                        return 'يجب أن يكون الرقم المدني من ١٢ رقما';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
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
                  SizedBox(height: 20,),
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
SizedBox(height: 20,),
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
SizedBox(height: 20,),
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
SizedBox(height: 20,),
            TextButton(
              onPressed: _signup,
              child: Text('تسجيل',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ),
SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('لديك حساب؟'),
                TextButton(onPressed: (){Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage(title: '')),
                );}, child: Text('دخول', style: TextStyle(color: Colors.white),)),
                
              ],)
              ],
            ),
          ),
        ),
      ),
      ), ),
    );
  }
}
