import 'package:articulation/screen/edit.dart';
import 'package:flutter/material.dart';


class SettingsPage extends StatelessWidget {
  final String patientId;

  const SettingsPage({Key? key, required this.patientId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50, // same as signup
      appBar: AppBar(
        title: Text("مهارات النطق",style: TextStyle(fontSize: 30),),
        backgroundColor: Colors.red.shade50,
      ),

      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, side: BorderSide(color: Colors.red.shade400,width: 1.5),
            padding: const EdgeInsets.symmetric(
                horizontal: 40, vertical: 15),
          ),

          child: const Text(
            "تعديل الملف الشخصي",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    EditPatientPage(title: 'تعديل الملف الشخصي', cid: patientId),
              ),
            );
          },
        ),
      ),
    );
  }
}