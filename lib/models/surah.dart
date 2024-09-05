class Surah {
  final String name;
  final int number;
  final int ayahCount;
  final String makkiMadani;
  final String theme;
  final String audioUrl;

  Surah({
    required this.name,
    required this.number,
    required this.ayahCount,
    required this.makkiMadani,
    required this.theme,
    required this.audioUrl,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      name: json['name'] as String,
      number: json['Number'] as int,
      ayahCount: json['Number of Verses'] as int,
      makkiMadani: json['Makki/Madani'] as String,
      theme: json['Theme'] as String,
      audioUrl: json['source'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'Number': number,
      'Number of Verses': ayahCount,
      'Makki/Madani': makkiMadani,
      'Theme': theme,
      'source': audioUrl,
    };
  }
}
