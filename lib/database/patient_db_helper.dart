import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart'; 


class PatientDBHelper{
  static late Database _patientdb; //patient database

  //initialize and create db
  static Future<void> initPatientDB() async {
    final dbPath = await getDatabasesPath();

    _patientdb = await openDatabase(join(dbPath, 'patient.db'),
        version: 1,
        onConfigure: (db) async{
          await db.execute('PRAGMA foreign_keys = ON');
        },
        onCreate: (db, version) async {
          await db.execute('''
      CREATE TABLE patient(
        civil_id INTEGER PRIMARY KEY, 
        first_name TEXT, 
        last_name TEXT,
        file_number INTEGER NOT NULL,
        age INTEGER NOT NULL
        )''');

            // Create stories table with civil_id as foreign key
          await db.execute('''
          CREATE TABLE stories (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            civil_id INTEGER NOT NULL,
            story TEXT NOT NULL,
            comment TEXT,
            FOREIGN KEY (civil_id) REFERENCES patient (civil_id) ON DELETE CASCADE
          )
        ''');

        // Create sentences table with civil_id as foreign key
        await db.execute('''
          CREATE TABLE sentences (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            civil_id INTEGER NOT NULL,
            sentence TEXT NOT NULL,
            comment TEXT,
            FOREIGN KEY (civil_id) REFERENCES patient (civil_id) ON DELETE CASCADE
          )
        ''');

        // Create words table with civil_id as foreign key
        await db.execute('''
          CREATE TABLE words (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            civil_id INTEGER NOT NULL,
            word TEXT NOT NULL,
            comment TEXT,
            FOREIGN KEY (civil_id) REFERENCES patient (civil_id) ON DELETE CASCADE
          )
        ''');

          await db.execute('CREATE INDEX IF NOT EXISTS idx_sentences_cid ON sentences(civil_id)');
          await db.execute('CREATE INDEX IF NOT EXISTS idx_words_cid ON words(civil_id)');
          await db.execute('CREATE INDEX IF NOT EXISTS idx_stories_cid ON stories(civil_id)');
        },
        //onUpgrade: _onUpgrade,

        
        );

        
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
    //final id =  await _patientdb.insert('patient', patient);
    final civilId = int.tryParse(patient['civil_id'].toString());
    final fileNumber = int.tryParse(patient['file_number'].toString());
    final age = int.tryParse(patient['age'].toString());

    if (civilId == null) {
        throw Exception('Civil ID must be an integer.');
    }
    if (fileNumber == null) {
        throw Exception('File number must be an integer.');
    }
    if (age == null) {
        throw Exception('Age must be an integer.');
    }

    final exists = await civilIdExists(civilId);
    if (exists) {
        throw Exception('A patient with the same Civil ID already exists.');
    }

    final cleanPatient = {
      'civil_id': civilId,
      'first_name': patient['first_name'],
      'last_name': patient['last_name'],
      'file_number': fileNumber,
      'age': age,
    };

    final id = await _patientdb.insert('patient', cleanPatient);

    try {
      final ref = FirebaseDatabase.instance.ref('patients/$civilId/info');
      await ref.set({
        'civil_id': civilId,
        'first_name': cleanPatient['first_name'],
        'last_name': cleanPatient['last_name'],
        'file_number': fileNumber,
        'age': age,
      });
    } catch (e) {
      debugPrint('Firebase sync (addPatients) failed: $e');
    }

    return id;


  }

  //edit patient
  static Future<void> updatePatients(int cid, Map<String, dynamic> patient) async {
    final civilId = int.tryParse(patient['civil_id'].toString());
    final fileNumber = int.tryParse(patient['file_number'].toString());
    final age = int.tryParse(patient['age'].toString());

    if (civilId == null) {
      throw Exception('Civil ID must be an integer.');
    }
    if (fileNumber == null) {
      throw Exception('File number must be an integer.');
    }
    if (age == null) {
      throw Exception('Age must be an integer.');
    }

    // If user changed civil ID, prevent duplicate
    if (civilId != cid) {
      final exists = await civilIdExists(civilId);
      if (exists) {
        throw Exception('A patient with the same Civil ID already exists.');
      }
    }

    final cleanPatient = {
      'civil_id': civilId,
      'first_name': patient['first_name'],
      'last_name': patient['last_name'],
      'file_number': fileNumber,
      'age': age,
    };

    await _patientdb.update(
      'patient',
      cleanPatient,
      where: 'civil_id = ?',
      whereArgs: [cid],
    );

    try {
      final ref = FirebaseDatabase.instance.ref('patients/$civilId/info');
      await ref.update({
        'civil_id': civilId,
        'first_name': cleanPatient['first_name'],
        'last_name': cleanPatient['last_name'],
        'file_number': fileNumber,
        'age': age,
      });
    } catch (e) {
      debugPrint('Firebase sync (updatePatients) failed: $e');
    }
  }

  //delete patient
  static Future<void> deletePatient(int cid) async {
    await _patientdb.delete('patient', where: 'civil_id = ?', whereArgs: [cid]);

    try {
      final ref = FirebaseDatabase.instance.ref('patients/$cid');
      await ref.remove(); 
    } catch (e) {
      debugPrint('Firebase sync (deletePatient) failed: $e');
    }
  }


  //CRUD for sentences
  static Future<List<Map<String, dynamic>>> getSentences() async {
    return await _patientdb.query('sentences');
  }

  static Future<List<Map<String, dynamic>>> getSentencesByCID(int cid) async {
    return _patientdb.query('sentences',
        where: 'civil_id = ?',
        whereArgs: [cid],
        orderBy: 'id ASC',
        );
        
  }

  static Future<int> addSentences(Map<String,dynamic> sentence) async {
    final id = await _patientdb.insert('sentences', sentence);

    try {
      final cid = sentence['civil_id'];
      if (cid != null) {
        final ref = FirebaseDatabase.instance
            .ref('patients/$cid/sentences/$id');
        await ref.set({
          'sentence': sentence['sentence'],
          'comment': sentence['comment'],
        });
      }
    } catch (e) {
      debugPrint('Firebase sync (addSentences) failed: $e');
    }

    return id;
  }

  static Future<void> updateSentences(int id, Map<String,dynamic> sentence) async{
    await _patientdb.update('sentences', sentence, where: 'id = ?', whereArgs: [id]);

    try {
      final cid = sentence['civil_id'];
      if (cid != null) {
        final ref = FirebaseDatabase.instance
            .ref('patients/$cid/sentences/$id');
        await ref.update({
          'sentence': sentence['sentence'],
          'comment': sentence['comment'],
        });
      }
    } catch (e) {
      debugPrint('Firebase sync (updateSentences) failed: $e');
    }

  }

static Future<void> deleteSentences(int id) async {
    final rows = await _patientdb.query('sentences',
        where: 'id = ?', whereArgs: [id], limit: 1);
    int? cid;
    if (rows.isNotEmpty) {
      cid = rows.first['civil_id'] as int?;
    }

    await _patientdb.delete('sentences', where: 'id = ?', whereArgs: [id]);

    try {
      if (cid != null) {
        final ref = FirebaseDatabase.instance
            .ref('patients/$cid/sentences/$id');
        await ref.remove();
      }
    } catch (e) {
      debugPrint('Firebase sync (deleteSentences) failed: $e');
    }
  }



  //CRUD for words
  static Future<List<Map<String, dynamic>>> getWords() async {
    return await _patientdb.query('words');
  }

  static Future<List<Map<String, dynamic>>> getWordsByCID(int cid) async {
    return _patientdb.query('words',
        where: 'civil_id = ?',
        whereArgs: [cid],
        orderBy: 'id ASC',
        );
    
  }

  static Future<int> addWords(Map<String,dynamic> word) async {
    final id = await _patientdb.insert('words', word);

    try {
      final cid = word['civil_id'];
      if (cid != null) {
        final ref = FirebaseDatabase.instance
            .ref('patients/$cid/words/$id');
        await ref.set({
          'word': word['word'],
          'comment': word['comment'],
        });
      }
    } catch (e) {
      debugPrint('Firebase sync (addWords) failed: $e');
    }

    return id;
  }

  static Future<void> updateWords(int id, Map<String,dynamic> word) async{
    await _patientdb.update('words', word, where: 'id = ?', whereArgs: [id]);

    try {
      final cid = word['civil_id'];
      if (cid != null) {
        final ref = FirebaseDatabase.instance
            .ref('patients/$cid/words/$id');
        await ref.update({
          'word': word['word'],
          'comment': word['comment'],
        });
      }
    } catch (e) {
      debugPrint('Firebase sync (updateWords) failed: $e');
    }
  }

  static Future<void> deleteWords(int id) async {
    final rows = await _patientdb.query('words', where: 'id = ?', whereArgs: [id], limit: 1);
    int? cid;
    if (rows.isNotEmpty) {
      cid = rows.first['civil_id'] as int?;
    }

    await _patientdb.delete('words', where: 'id = ?', whereArgs: [id]);

    try {
      if (cid != null) {
        final ref = FirebaseDatabase.instance
            .ref('patients/$cid/words/$id');
        await ref.remove();
      }
    } catch (e) {
      debugPrint('Firebase sync (deleteWords) failed: $e');
    }
  }

    static Future<List<Map<String, dynamic>>> getStoriesByCID(int cid) async =>
      _patientdb.query('stories',
          where: 'civil_id = ?', whereArgs: [cid], orderBy: 'id ASC');

  static Future<int> addStory(Map<String, dynamic> story) async {
    final id = await _patientdb.insert('stories', story);

    try {
      final cid = story['civil_id'];
      if (cid != null) {
        final ref = FirebaseDatabase.instance
            .ref('patients/$cid/stories/$id');
        await ref.set({
          'story': story['story'],
          'comment': story['comment'],
        });
      }
    } catch (e) {
      debugPrint('Firebase sync (addStory) failed: $e');
    }

    return id;
  }
      

      


  static Future<void> updateStory(int id, Map<String, dynamic> story) async {
    await _patientdb.update('stories', story, where: 'id = ?', whereArgs: [id]);

    //Sync to Firebase
    try {
      final cid = story['civil_id'];
      if (cid != null) {
        final ref = FirebaseDatabase.instance
            .ref('patients/$cid/stories/$id');
        await ref.update({
          'story': story['story'],
          'comment': story['comment'],
        });
      }
    } catch (e) {
      debugPrint('Firebase sync (updateStory) failed: $e');
    }
  }

  static Future<void> deleteStory(int id) async {
    final rows = await _patientdb.query('stories',
        where: 'id = ?', whereArgs: [id], limit: 1);
    int? cid;
    if (rows.isNotEmpty) {
      cid = rows.first['civil_id'] as int?;
    }

    await _patientdb.delete('stories', where: 'id = ?', whereArgs: [id]);

    try {
      if (cid != null) {
        final ref = FirebaseDatabase.instance
            .ref('patients/$cid/stories/$id');
        await ref.remove();
      }
    } catch (e) {
      debugPrint('Firebase sync (deleteStory) failed: $e');
    }
  }

  // Export all local data (patients + stories + sentences + words)
  // to Firebase Realtime Database under /patients/{civil_id}
  //this was created to ensure that the data locally will be pushed to firebase
  // it is commented after all the data was exported
  static Future<void> exportAllToFirebase() async {
    final dbRef = FirebaseDatabase.instance.ref('patients');
    debugPrint(dbRef.toString());

    // 1) Get all patients
    final patients = await getPatients();
    debugPrint(patients.toString());

    for (final patient in patients) {
      final int cid = patient['civil_id'] as int;
      final String cidKey = cid.toString();
      debugPrint(cidKey);

      final patientRef = dbRef.child(cidKey);
      debugPrint(patientRef.toString());

      // 2) Save basic patient info
      await patientRef.child('info').set({
        'civil_id': cid,
        'first_name': patient['first_name'],
        'last_name': patient['last_name'],
        'file_number': patient['file_number'],
        'age': patient['age'],
      });

      // 3) Save stories for this patient
      final stories = await getStoriesByCID(cid);
      final storiesMap = <String, dynamic>{};
      for (final story in stories) {
        final id = story['id'].toString();
        storiesMap[id] = {
          'story': story['story'],
          'comment': story['comment'],
        };
      }
      await patientRef.child('stories').set(storiesMap);

      // 4) Save sentences for this patient
      final sentences = await getSentencesByCID(cid);
      final sentencesMap = <String, dynamic>{};
      for (final sentence in sentences) {
        final id = sentence['id'].toString();
        sentencesMap[id] = {
          'sentence': sentence['sentence'],
          'comment': sentence['comment'],
        };
      }
      await patientRef.child('sentences').set(sentencesMap);

      // 5) Save words for this patient
      final words = await getWordsByCID(cid);
      final wordsMap = <String, dynamic>{};
      for (final word in words) {
        final id = word['id'].toString();
        wordsMap[id] = {
          'word': word['word'],
          'comment': word['comment'],
        };
      }
      await patientRef.child('words').set(wordsMap);
    }


    print('Export to Firebase finished for ${patients.length} patients');
  }

    static Future<void> syncAllPatientsFromFirebase() async {
    try {
      final rootRef = FirebaseDatabase.instance.ref('patients');
      final snap = await rootRef.get();

      if (!snap.exists) {
        debugPrint('No patients in Firebase to sync.');
        return;
      }
      

      for (final patientSnap in snap.children) {
        final cidKey = patientSnap.key; 
        if (cidKey == null) continue;

        final cid = int.tryParse(cidKey);
        if (cid == null) continue;

        final infoSnap = patientSnap.child('info');
        if (!infoSnap.exists) continue;

        final info = Map<String, dynamic>.from(infoSnap.value as Map);

        // Build patient map in SQLite format
        final patientRow = <String, dynamic>{
          'civil_id': info['civil_id'] ?? int.tryParse(cidKey) ?? 0,
          'first_name': info['first_name'],
          'last_name': info['last_name'],
          'file_number': info['file_number'],
          'age': info['age'],
        };

        // Insert or replace in SQLite
        await _patientdb.insert(
          'patient',
          patientRow,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );


      }

      debugPrint('syncAllPatientsFromFirebase done.');
    } catch (e) {
      debugPrint('syncAllPatientsFromFirebase failed: $e');
    }
  }

    static Future<Map<String, dynamic>?> getOrSyncPatientByCID(int cid) async {
    // 1) Try local SQLite
    final local = await getPatientsByCID(cid);
    if (local != null) return local;

    // 2) Try Firebase
    try {
      final ref = FirebaseDatabase.instance.ref('patients/$cid/info');
      final snap = await ref.get();

      if (!snap.exists) return null;

      final info = Map<String, dynamic>.from(snap.value as Map);

      final patientRow = <String, dynamic>{
        'civil_id': info['civil_id'] ?? cid,
        'first_name': info['first_name'],
        'last_name': info['last_name'],
        'file_number': info['file_number'],
        'age': info['age'],
      };

      // Cache in SQLite
      await _patientdb.insert(
        'patient',
        patientRow,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return patientRow;
    } catch (e) {
      debugPrint('getOrSyncPatientByCID Firebase fetch failed: $e');
      return null;
    }
  }


  // Firebase direct reads (no SQLite) 

  static Future<List<Map<String, dynamic>>> getSentencesFromFirebase(int cid) async {
    final ref = FirebaseDatabase.instance.ref('patients/$cid/sentences');
    final snap = await ref.get();

    if (!snap.exists) return [];

    final List<Map<String, dynamic>> result = [];

    for (final child in snap.children) {
      if (!child.exists || child.value is! Map) continue;

      final map = Map<String, dynamic>.from(child.value as Map);
      result.add({
        'id': int.tryParse(child.key ?? '') ?? 0,
        'civil_id': cid,
        'sentence': map['sentence'] ?? '',
        'comment': map['comment'],
      });
    }

    return result;
  }

  static Future<List<Map<String, dynamic>>> getStoriesFromFirebase(int cid) async {
    final ref = FirebaseDatabase.instance.ref('patients/$cid/stories');
    final snap = await ref.get();

    if (!snap.exists) return [];

    final List<Map<String, dynamic>> result = [];

    for (final child in snap.children) {
      if (!child.exists || child.value is! Map) continue;

      final map = Map<String, dynamic>.from(child.value as Map);
      result.add({
        'id': int.tryParse(child.key ?? '') ?? 0,
        'civil_id': cid,
        'story': map['story'] ?? '',
        'comment': map['comment'],
      });
    }

    return result;
  }

  static Future<List<Map<String, dynamic>>> getWordsFromFirebase(int cid) async {
    final ref = FirebaseDatabase.instance.ref('patients/$cid/words');
    final snap = await ref.get();

    if (!snap.exists) return [];

    final List<Map<String, dynamic>> result = [];

    for (final child in snap.children) {
      if (!child.exists || child.value is! Map) continue;

      final map = Map<String, dynamic>.from(child.value as Map);
      result.add({
        'id': int.tryParse(child.key ?? '') ?? 0,
        'civil_id': cid,
        'word': map['word'] ?? '',
        'comment': map['comment'],
      });
    }

    return result;
  }

static bool _isValidInteger(dynamic value) {
  if (value == null) return false;
  return int.tryParse(value.toString()) != null;
}

static Future<bool> civilIdExists(int cid) async {
  final result = await _patientdb.query(
    'patient',
    columns: ['civil_id'],
    where: 'civil_id = ?',
    whereArgs: [cid],
    limit: 1,
  );
  return result.isNotEmpty;
}


}

