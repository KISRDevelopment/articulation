class PatientReportData {
  final int civilId;
  final String firstName;
  final String lastName;
  final String fileNumber;
  //this is a list for the column comments
  final List<Map<String, dynamic>> words;     
  final List<Map<String, dynamic>> sentences; 
  final List<Map<String, dynamic>> stories;   

  PatientReportData({
    required this.civilId,
    required this.firstName,
    required this.lastName,
    required this.fileNumber,
    required this.words,
    required this.sentences,
    required this.stories,
  });

  String get fullName => '$firstName $lastName';
}
