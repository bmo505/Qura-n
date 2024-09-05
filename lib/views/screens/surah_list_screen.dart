import 'package:flutter/material.dart';
import 'package:quraan/models/surah.dart';
import 'package:quraan/views/screens/surah_detail_screen.dart';

class SurahListScreen extends StatelessWidget {
  final Map<String, Surah> surahData;

  const SurahListScreen({super.key, required this.surahData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(alignment: Alignment.centerRight, child: Text('قائمة السور')),
      ),
      body: ListView.builder(
        itemCount: surahData.length,
        itemBuilder: (context, index) {
          final surahKey = surahData.keys.elementAt(index);
          final surah = surahData[surahKey]!;

          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Align(alignment: Alignment.centerRight, child: Text(surah.name, style: const TextStyle(fontWeight: FontWeight.bold))),
              subtitle: Align(alignment: Alignment.centerRight, child: Text('رقم: ${surah.number}, عدد الآيات: ${surah.ayahCount}')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SurahDetailScreen(surah: surah),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
