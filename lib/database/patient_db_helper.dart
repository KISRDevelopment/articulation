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
        file_number TEXT,
        age INTEGER,
        )''');
        },
        onUpgrade: _onUpgrade,
        version: 2 );
  }

  static Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Add new columns to patients table
      await db.execute('''
        ALTER TABLE patient 
        ADD COLUMN score TEXT
      ''');
      await db.execute('''
        ALTER TABLE patient 
        ADD COLUMN login_date INTEGER
      ''');

      // Create new tables
      await _createAdditionalTables(db);
    }
  }

  static Future _createAdditionalTables(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');

    // Create stories table with civil_id as foreign key
    await db.execute('''
      CREATE TABLE stories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        civil_id TEXT NOT NULL,
        story TEXT NOT NULL,
        comment TEXT,
        FOREIGN KEY (civil_id) REFERENCES patients (civil_id) ON DELETE CASCADE
      )
    ''');

    // Create sentences table with civil_id as foreign key
    await db.execute('''
      CREATE TABLE sentences (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        civil_id TEXT NOT NULL,
        sentence TEXT NOT NULL,
        comment TEXT,
        FOREIGN KEY (civil_id) REFERENCES patients (civil_id) ON DELETE CASCADE
      )
    ''');

    // Create words table with civil_id as foreign key
    await db.execute('''
      CREATE TABLE words (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        civil_id TEXT NOT NULL,
        word TEXT NOT NULL,
        comment TEXT,
        FOREIGN KEY (civil_id) REFERENCES patients (civil_id) ON DELETE CASCADE
      )
    ''');
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


  //CRUD for sentences
  static Future<List<Map<String, dynamic>>> getSentences() async {
    return await _patientdb.query('sentences');
  }

  static Future<Map<String, dynamic>?> getSentencesByCID(int cid) async {
    final List<Map<String,dynamic>> results = await _patientdb.query('sentences',
        where: 'civil_id = ?',
        whereArgs: [cid]);
    if(results.isNotEmpty){return results.first;}
    return null;
  }

  static Future<int> addSentences(Map<String,dynamic> sentence) async {
    return await _patientdb.insert('sentences', sentence);
  }

  static Future<void> updateSentences(int cid, Map<String,dynamic> sentence) async{
    await _patientdb.update('sentences', sentence, where: 'civil_id = ?', whereArgs: [cid]);
  }

  static Future<void> deleteSentences(int cid) async {
    await _patientdb.delete('sentences', where: 'civil_id = ?', whereArgs: [cid]);
  }
}