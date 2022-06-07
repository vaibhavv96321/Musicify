import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../models/music_lyrics.dart';
import '../networking/response.dart';
import '../urls/music_lyrics_url.dart';

class MusicLyricsBloc {
  MusicLyricsRepository _musicLyricsRepository;
  StreamController _musicLyricsController;
  int trackId;
  StreamSink<Response<MusicLyrics>> get musicLyricsSink =>
      _musicLyricsController.sink;

  Stream<Response<MusicLyrics>> get musicLyricsStream =>
      _musicLyricsController.stream;

  MusicLyricsBloc({@required this.trackId}) {
    _musicLyricsController =
        StreamController<Response<MusicLyrics>>.broadcast();
    _musicLyricsRepository = MusicLyricsRepository(trackId: trackId);
    fetchMusicLyrics();
  }
  fetchMusicLyrics() async {
    musicLyricsSink.add(Response.loading('Loading lyrics'));
    try {
      MusicLyrics musicLyrics =
          await _musicLyricsRepository.fetchMusicDetailsData();
      musicLyricsSink.add(Response.completed(musicLyrics));
    } catch (e) {
      musicLyricsSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _musicLyricsController?.close();
  }
}
