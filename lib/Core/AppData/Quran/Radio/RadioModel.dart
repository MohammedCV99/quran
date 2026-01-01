class Radiomodel {
  /*
     'id': 1,
    'name': 'إذاعة إبراهيم الأخضر',
    'url': 'https://backup.qurango.net/radio/ibrahim_alakdar',
    'recent_date': '2020-04-25 22:04:04',
  */
  int id;
  String name;
  String url;
  String recent_date;
  bool PLAY;
  bool MUTE;

  Radiomodel(
    this.id,
    this.name,
    this.url,
    this.recent_date,
    this.PLAY,
    this.MUTE,
  );
  factory Radiomodel.fromJson(Map<String, dynamic> json) {
    return Radiomodel(
      json['id'] as int,
      json['name'] as String,
      json['url'] as String,
      json['recent_date'] as String,
      json['PLAY'] as bool,
      json['MUTE'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'recent_date': recent_date,
      'PLAY': PLAY,
      'MUTE': MUTE,
    };
  }
}
