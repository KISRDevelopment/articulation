import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class PatientDBHelper{
  static late Database _patientdb; //patient database

  //initialize and create db
  static Future<void> initPatientDB() async {
    final dbPath = await getDatabasesPath();

    _patientdb = await openDatabase(join(dbPath, 'patient.db'),
        onCreate: (db, version) async {
          await db.execute('''
      CREATE TABLE patient(
        civil_id INTEGER PRIMARY KEY, 
        first_name TEXT, 
        last_name TEXT,
        file_number TEXT
        age INTEGER
        score TEXT
        login_date TEXT
        )''');
        },
        version: 1 );
  }


  //get all patients
  static Future<List<Map<String, dynamic>>> getPatients() async {
    return await _patientdb.query('patient');
  }

  //get specific patient by Civil ID
  static Future<Map<String, dynamic>?> getPatientsByCID(int cid) async {
    final List<Map<String,dynamic>> results = await _patientdb.query('patient',
        where: 'civil_id = ?',
        whereArgs: [cid]);
    if(results.isNotEmpty){return results.first;}
    return null;
  }

  //add patient
  static Future<int> addPatients(Map<String,dynamic> patient) async {
    return await _patientdb.insert('patient', patient);
  }

  //edit patient
  static Future<void> updatePatients(int cid, Map<String,dynamic> patient) async{
    await _patientdb.update('patient', patient, where: 'civil_id = ?', whereArgs: [cid]);
  }

  //delete patient
  static Future<void> deletePatient(int cid) async {
    await _patientdb.delete('patient', where: 'civil_id = ?', whereArgs: [cid]);
  }

}