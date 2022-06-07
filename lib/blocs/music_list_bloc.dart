import 'dart:async';

import '../models/music_list.dart';
import '../networking/response.dart';
import '../urls/music_list_url.dart';

class MusicListBloc {
  MusicListRepository _musicListRepository;
  StreamController _musicListController;

  StreamSink<Response<MusicList>> get musicListSink =>
      _musicListController.sink;

  Stream<Response<MusicList>>
      get musicListStream => // get to access private members
          _musicListController.stream;

  MusicListBloc() {
    _musicListController = StreamController<Response<MusicList>>.broadcast();
    _musicListRepository = MusicListRepository();
    fetchMusicList();
  }

  fetchMusicList() async {
    musicListSink.add(Response.loading('Loading'));
    try {
      MusicList musicList = await _musicListRepository.fetchMusicListData();
      musicListSink.add(Response.completed(musicList));
    } catch (e) {
      musicListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _musicListController?.close();
  }
}
