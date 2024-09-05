// import 'package:audio_service/audio_service.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:just_audio/just_audio.dart';
//
// class AudioPlayerTask extends BackgroundAudioTask {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//
//   @override
//   Future<void> onStart(Map<String, dynamic>? params) async {
//     final audioSource = params?['audioSource'] as String?;
//     if (audioSource != null) {
//       await _audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(audioSource)));
//       _audioPlayer.play();
//     }
//   }
//
//   @override
//   Future<void> onStop() async {
//     await _audioPlayer.stop();
//     await super.onStop();
//   }
//
//   @override
//   Future<void> onPlay() async {
//     await _audioPlayer.play();
//   }
//
//   @override
//   Future<void> onPause() async {
//     await _audioPlayer.pause();
//   }
//
//   @override
//   Future<void> onSeekTo(Duration position) async {
//     await _audioPlayer.seek(position);
//   }
//
//   @override
//   Future<void> onSkipToNext() async {
//     // Handle skipping to the next audio track if applicable.
//     // If you have a playlist, you can move to the next item here.
//     // For now, this is left empty.
//   }
//
//   @override
//   Future<void> onSkipToPrevious() async {
//     // Handle skipping to the previous audio track if applicable.
//     // If you have a playlist, you can move to the previous item here.
//     // For now, this is left empty.
//   }
//
//   @override
//   void onAudioEvent(AudioEvent event) {
//     // Handle audio events (e.g., buffering, errors) to ensure a smooth playback experience.
//     switch (event) {
//       case AudioEvent.buffering:
//       // Handle buffering events if needed
//         break;
//       case AudioEvent.error:
//       // Handle errors
//         break;
//       default:
//         break;
//     }
//   }
//
//   @override
//   void onStateChanged(AudioProcessingState state) {
//     // Handle state changes, e.g., playback completed, error
//     switch (state) {
//       case AudioProcessingState.completed:
//       // Handle when audio playback is completed
//         break;
//       case AudioProcessingState.error:
//       // Handle playback errors
//         break;
//       default:
//         break;
//     }
//   }
// }
