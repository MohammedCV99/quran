class Recordmodel {
  int SuranID;
  List AyatRecords;
  String ArSuraName;
  String EnSuraName;
  String AyatNumber;
  List Ayat;
  Recordmodel(
    this.SuranID,
    this.AyatRecords,
    this.ArSuraName,
    this.EnSuraName,
    this.AyatNumber,
    this.Ayat,
  );
  factory Recordmodel.fromJson(Map<String, dynamic> json) {
    return Recordmodel(
      json['SuranID'] as int,
      json['AyatRecords'] as List,
      json['ArSuraName'] as String,
      json['EnSuraName'] as String,
      json['AyatNumber'] as String,
      json['Ayat'] as List,
    );
  }

  // Method to convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'SuranID': SuranID,
      'AyatRecords': AyatRecords,
      'ArSuraName': ArSuraName,
      'EnSuraName': EnSuraName,
      'AyatNumber': AyatNumber,
      'Ayat': Ayat,
    };
  }
}
