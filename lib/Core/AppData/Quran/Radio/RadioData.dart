import 'package:quran/Core/AppData/Quran/Radio/RadioModel.dart';

List<Radiomodel> RadioList =
    RadioData.map((item) => Radiomodel.fromJson(item)).toList();
List<Map<String, dynamic>> RadioData = [
  {
    'id': 1,
    'name': 'إذاعة إبراهيم الأخضر',
    'url': 'https://backup.qurango.net/radio/ibrahim_alakdar',
    'recent_date': '2020-04-25 22:04:04',
    'PLAY': false,
    'MUTE': false,
  },
  {
    'id': 2,
    'name': 'إذاعة شيخ أبو بكر الشاطري',
    'url': 'https://backup.qurango.net/radio/shaik_abu_bakr_al_shatri',
    'recent_date': '2020-04-25 22:04:04',
    'PLAY': false,
    'MUTE': false,
  },
  {
    'id': 3,
    'name': 'إذاعة أحمد العجمي',
    'url': 'https://backup.qurango.net/radio/ahmad_alajmy',
    'recent_date': '2020-04-25 22:04:04',
    'PLAY': false,
    'MUTE': false,
  },
  {
    'id': 4,
    'name': 'إذاعة أحمد الحواشي',
    'url': 'https://backup.qurango.net/radio/ahmad_alhawashi',
    'recent_date': '2020-04-25 22:04:04',
    'PLAY': false,
    'MUTE': false,
  },
  {
    'id': 5,
    'name': 'إذاعة أحمد صابر',
    'url': 'https://backup.qurango.net/radio/ahmad_saber',
    'recent_date': '2020-04-25 22:04:04',
    'PLAY': false,
    'MUTE': false,
  },
  {
    "id": 6,
    "name": " إذاعة ياسر الدوسري",
    "url": "https://backup.qurango.net/radio/yasser_aldosari",
    "recent_date": "2020-04-25 22:04:05",
    'PLAY': false,
    'MUTE': false,
  },
];
