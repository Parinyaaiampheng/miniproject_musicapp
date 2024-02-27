import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of sons
  final List<Song> _playlist = [
    //song1
    Song(
      songName: "Doja",
      artistName: "Centarl Cee",
      albumArtImagePath: "assets/images/cee.jpg",
      audioPath: "audio/doja.mp3",
    ),
    //song2
    Song(
      songName: "ขี้หึง",
      artistName: "Silly Fools",
      albumArtImagePath: "assets/images/sillyfools.jpg",
      audioPath: "audio/ขี้หึง.mp3",
    ),

    //song3
    Song(
      songName: "The Lazy Song",
      artistName: "Bruno mars",
      albumArtImagePath: "assets/images/bruno.jpg",
      audioPath: "audio/The Lazy Song.mp3",
    ),

    //song4
    Song(
      songName: "ผิดที่ไว้ใจ",
      artistName: "Silly Fools",
      albumArtImagePath: "assets/images/sillyfools.jpg",
      audioPath: "audio/ผิดที่ไว้ใจ - Silly Fools.mp3",
    ),

    //song5
    Song(
      songName: "Die For You",
      artistName: "The Weeknd",
      albumArtImagePath: "assets/images/wekeeknd.jpg",
      audioPath: "audio/Die For You - The Weeknd.mp3",
    ),

    //song6
    Song(
      songName: "Save Your",
      artistName: "The Weeknd",
      albumArtImagePath: "assets/images/2.jpg",
      audioPath: "audio/Svae Your.mp3",
    ),

    //song7
    Song(
      songName: "In The End",
      artistName: "Linkin Park",
      albumArtImagePath: "assets/images/in the end.jpg",
      audioPath: "audio/In the End - Linkin Park.mp3",
    ),

    //song8
    Song(
      songName: "Congratulations",
      artistName: "Post Malone",
      albumArtImagePath: "assets/images/9.jpg",
      audioPath: "audio/Congratulations - Post Malone.mp3",
    ),

    //song9
    Song(
      songName: "Shall we",
      artistName: "Percy feat. 4ourYou & Gena Desouza",
      albumArtImagePath: "assets/images/10.jpg",
      audioPath: "audio/Percy - Shall we.mp3",
    ),

    //song10
    Song(
      songName: "Sunflower",
      artistName: "Post Malone",
      albumArtImagePath: "assets/images/8.jpg",
      audioPath: "audio/Sunflower - Post Malone.mp3",
    ),
  ];

  //cuerent song playing index
  int? _currentSongIndex;
  /*

  A U D I O P L A Y E R

  */

  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  //durations
  Duration _CurrentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor
  PlaylistProvider() {
    listenToDuration();
  }

  //initially not paying
  bool _isPlaying = false;

  //play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  //pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
  }

  //pause and resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  //seek to a spacific position in the cerrent song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (currentSongIndex! < _playlist.length - 1) {
        currentSongIndex = _currentSongIndex! + 1;
        //
      } else {
        //
        currentSongIndex = 0;
      }
    }
  }

  //play previous song
  void playPreviousSong() async {
    if (_CurrentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  //listen to duration
  void listenToDuration() {
    //listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    //listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {});

    //listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }


  //dispose audio player

  /*

  G E T T E R S

  */

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _CurrentDuration;
  Duration get totalDuration => _totalDuration;

  /*

  S E T T E R S

  */
  set currentSongIndex(int? newIndex) {
    //update current song index
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play();
    }

    //update UI
    notifyListeners();
  }
}
