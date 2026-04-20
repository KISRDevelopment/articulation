import 'package:articulation/screen/edit.dart';
import 'package:flutter/material.dart';


class SettingsPage extends StatelessWidget {
  final String patientId;

  const SettingsPage({Key? key, required this.patientId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200], // same as signup
      appBar: AppBar(
        title: const Text("مهارات النطق"),
      ),

      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber.shade50,
            padding: const EdgeInsets.symmetric(
                horizontal: 40, vertical: 15),
          ),

          child: const Text(
            "تعديل الملف الشخصي",
            style: TextStyle(fontSize: 18),
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