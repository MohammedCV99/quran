class Quran {
  int Index;
  String Venus;
  String ArName;
  String EnName;
  String AyaNumber;
  Quran(this.Index, this.Venus, this.ArName, this.EnName, this.AyaNumber);
  factory Quran.fromJson(Map<String, dynamic> json) {
    return Quran(
      json['Index'] as int,
      json['Venus'] as String,
      json['ArName'] as String,
      json['EnName'] as String,
      json['AyaNumber'] as String,
    );
  }

  // Method to convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'Index': Index,
      'Venus': Venus,
      'ArName': ArName,
      'EnName': EnName,
      'AyaNumber': AyaNumber,
    };
  }
}
