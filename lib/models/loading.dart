import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quraan/models/surah.dart';

Future<Map<String, Surah>> loadSurahData(String fileName) async {
  try {
    final jsonString = await rootBundle.loadString(fileName);
    final Map<String, dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map((key, value) => MapEntry(key, Surah.fromJson(value as Map<String, dynamic>)));
  } catch (e) {
    print('Error loading surah data from $fileName: $e');
    return {};
  }
}

Future<List<Map<String, Surah>>> loadAllSurahData() async {
  List<String> files = [
    'assets/surahs-afasy.json',
    'assets/surahs-fawaz.json',
    'assets/surahs-ayyub.json',
    'assets/surahs-frs_a.json',
    'assets/surahs-hani.json',
    'assets/surahs-jbrl.json',
    'assets/surahs-mustafa.json',
    'assets/surahs-qasm.json',
  ];

  List<Map<String, Surah>> allSurahs = [];
  for (String file in files) {
    try {
      final surahData = await loadSurahData(file);
      if (surahData.isNotEmpty) {
        allSurahs.add(surahData);
      } else {
        print('No surah data found in $file');
      }
    } catch (e) {
      print('Error loading surah data from file $file: $e');
    }
  }
  return allSurahs;
}
