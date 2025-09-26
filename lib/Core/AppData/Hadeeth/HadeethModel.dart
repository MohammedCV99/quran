class Hadeethmodel {
  int Index;
  String Hadeeth;
  String HadeethNumber;
  Hadeethmodel(this.Index, this.Hadeeth, this.HadeethNumber);
  factory Hadeethmodel.fromJson(Map<String, dynamic> json) {
    return Hadeethmodel(
      json['Index'] as int,
      json['Hadeeth'] as String,
      json['Hadeeth_Number'] as String,
    );
  }

  // Method to convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'Index': Index,
      'Hadeeth': Hadeeth,
      'Hadeeth_Number': HadeethNumber,
    };
  }
}
