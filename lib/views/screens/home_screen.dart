import 'package:flutter/material.dart';
import 'package:quraan/models/loading.dart';
import 'package:quraan/models/surah.dart';
import 'package:quraan/views/screens/surah_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(alignment: Alignment.centerRight, child:  Text('قائمة القراء')),
      ),
      body: FutureBuilder<List<Map<String, Surah>>>(
        future: loadAllSurahData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('خطأ في تحميل بيانات القراء'));
          } else {
            final allSurahData = snapshot.data ?? [];

            return ListView.builder(
              itemCount: allSurahData.length,
              itemBuilder: (context, index) {
                final surahData = allSurahData[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Align(alignment: Alignment.centerRight, child: Text('قارئ ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold))),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SurahListScreen(
                            surahData: surahData,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
