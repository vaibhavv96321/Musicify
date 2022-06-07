import 'dart:async';

import '../models/music_details.dart';
import '../networking/response.dart';
import '../urls/music_details_url.dart';

class MusicDetailsBloc {
  MusicDetailsRepository _musicDetailsRepository;
  StreamController _musicDetailsController;
  int trackId;
  StreamSink<Response<MusicDetails>> get musicDetailsSink =>
      _musicDetailsController.sink;

  Stream<Response<MusicDetails>> get musicDetailsStream =>
      _musicDetailsController.stream;

  MusicDetailsBloc({this.trackId}) {
    _musicDetailsController =
        StreamController<Response<MusicDetails>>.broadcast();
    _musicDetailsRepository = MusicDetailsRepository(trackId: trackId);
    //fetchMusicDetails();
  }
  fetchMusicDetails() async {
    musicDetailsSink.add(Response.loading('Loading details.. '));
    try {
      MusicDetails musicDetails =
          await _musicDetailsRepository.fetchMusicDetailsData();
      musicDetailsSink.add(Response.completed(musicDetails));
    } catch (e) {
      musicDetailsSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _musicDetailsController?.close();
  }
}
