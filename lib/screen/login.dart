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
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _civilIDController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPatients();
  }

  Future<void> _loadPatients() async {
      setState(() {
      isLoading = true;
    });
    //final patients = await PatientDatabaseHelper().getAllPatients();
    await PatientDBHelper.syncAllPatientsFromFirebase();
    //await PatientDBHelper.syncAllFromFirebase();
    final patients = await PatientDBHelper.getPatients();

    setState(() {
      
      _patients = patients;
      isLoading = false;
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
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(title: Text("مهارات النطق",style: TextStyle(fontSize: 30),), backgroundColor: Colors.red.shade50, automaticallyImplyLeading: false,),
      body: isLoading ? Center(child: CircularProgressIndicator())
      : SafeArea(
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
                  cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      filled: true,
                      fillColor: Colors.white,
                    labelText: 'الرقم المدني',
                    helperText:
                                  'يجب إدخال الرقم المدني ١٢ رقماً',

                    labelStyle: TextStyle(
                                fontSize: 25,
                              ),

                              // Label while typing
                    floatingLabelStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),

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
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white, side: BorderSide(color: Colors.red.shade400,width: 1.5)),
                  child: Text('دخول',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      )),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('مستخدم جديد؟', style: TextStyle(fontSize: 20),),
                  SizedBox(width: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white, side: BorderSide(color: Colors.red.shade400,width: 1.5)),
                    onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage(title: '')),
                  );}, child: Text('تسجيل', style: TextStyle(color: Colors.black, fontSize: 20),)),
                  
                ],)
              ],
            ),
          ),
        ),
      ), ), ),
    );
  }
}
