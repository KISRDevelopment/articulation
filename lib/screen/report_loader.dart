import 'package:articulation/database/patient_db_helper.dart';
import 'report_data.dart';

Future<PatientReportData> loadPatientReport(int civilId) async {
  final p = await PatientDBHelper.getPatientsByCID(civilId);
  if (p == null) {
    throw Exception('Patient $civilId not found');
  }

  //final words = await PatientDBHelper.getWordsByCID(civilId);
  //final sentences = await PatientDBHelper.getSentencesByCID(civilId);
  //final stories = await PatientDBHelper.getStoriesByCID(civilId);
  final sentences = await PatientDBHelper.getSentencesFromFirebase(civilId);
  final stories = await PatientDBHelper.getStoriesFromFirebase(civilId);
  final words   = await PatientDBHelper.getWordsFromFirebase(civilId);



  return PatientReportData(
    civilId: civilId,
    firstName: (p['first_name'] ?? '').toString(),
    lastName:  (p['last_name']  ?? '').toString(),
    fileNumber:(p['file_number']?? '').toString(),
    words: words,
    sentences: sentences,
    stories: stories,
  );
}
