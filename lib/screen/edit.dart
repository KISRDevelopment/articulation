import 'package:articulation/database/patient_db_helper.dart';
import 'package:flutter/material.dart';
import '../main.dart';


class EditPatientPage extends StatefulWidget {
  const EditPatientPage({Key? key, required this.title, required this.cid}) : super(key: key);

  final String title;
  final String cid;

  @override
  State<EditPatientPage> createState() => _EditPatientPageState();
}

class _EditPatientPageState extends State<EditPatientPage> {
  //List<Map<String, dynamic>> _patients = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController _civilIDController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _fileNumController = TextEditingController();
  TextEditingController _ageController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPatients(widget.cid);
    _civilIDController.text = widget.cid;
    
  }

Future<void> _loadPatients(String civilID) async {
  final patient = await PatientDBHelper.getPatientsByCID(int.parse(civilID));

  setState(() {
if (patient != null) {
  _civilIDController.text = patient['civil_id']?.toString() ?? '';
  _firstNameController.text = patient['first_name'] ?? '';
  _lastNameController.text = patient['last_name'] ?? '';
  _fileNumController.text = patient['file_number']?.toString() ?? '';
  _ageController.text = patient['age']?.toString() ?? '';
}
  });
}


  Future<void> _updateInformation() async {
    if (_formKey.currentState!.validate()) {

      DateTime _loginDate = DateTime.now();
      final cid = _civilIDController.text;
      print(cid);

      try{

        //final patients = await PatientDatabaseHelper().getPatient(cid);
        final patients = await PatientDBHelper.getPatientsByCID(int.parse(cid));

        if (patients != null) {
          print('if-statement is true');

        await PatientDBHelper.updatePatients(int.parse(cid), {
            'first_name': _firstNameController.text.trim(),
            'last_name': _lastNameController.text.trim(),
            'age': _ageController.text.trim(),
          });

        //print(newPatient);

        //await PatientDatabaseHelper().insertPatient(newPatient);
        //await PatientDBHelper.addPatients(newPatient);

        //final testPatient = await PatientDBHelper.getPatientsByCID(_civilIDController.text as int);
        //print('new patient is:');
        //print(testPatient);

        print('pass add patient');

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage(title: 'welcome $cid', cid: cid,)),
        );
      }} catch (e) {
        print('Update failed: $e');
      }


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
                    readOnly: true,
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
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _firstNameController,
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
                    readOnly: true,
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
              onPressed: _updateInformation,
              child: Text('تعديل',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ),

              ],
            ),
          ),
        ),
      ),
      ), ),
    );
  }
}
