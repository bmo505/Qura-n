import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:quraan/models/surah.dart';

class SurahDetailScreen extends StatefulWidget {
  final Surah surah;

  const SurahDetailScreen({Key? key, required this.surah}) : super(key: key);

  @override
  _SurahDetailScreenState createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playAudio() async {
    try {
      if (_isPlaying) {
        await _audioPlayer.stop();
        setState(() {
          _isPlaying = false;
        });
      } else {
        await _audioPlayer.play(UrlSource(widget.surah.audioUrl));
        setState(() {
          _isPlaying = true;
        });
      }
    } catch (e) {
      print('خطأ في تشغيل الصوت: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surah.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.centerRight, child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.centerRight, child: Text('الاسم: ${widget.surah.name}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              Align(alignment: Alignment.centerRight, child: Text('رقم: ${widget.surah.number}', style: const TextStyle(fontSize: 18))),
              Align(alignment: Alignment.centerRight, child: Text('عدد الآيات: ${widget.surah.ayahCount}', style: const TextStyle(fontSize: 18))),
              Align(alignment: Alignment.centerRight, child: Text('مكي/مدني: ${widget.surah.makkiMadani}', style: const TextStyle(fontSize: 18))),
              Align(alignment: Alignment.centerRight, child: Text('الموضوع: ${widget.surah.theme}', style: const TextStyle(fontSize: 18))),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _playAudio,
                child: Text(_isPlaying ? 'إيقاف التشغيل' : 'تشغيل السورة'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
