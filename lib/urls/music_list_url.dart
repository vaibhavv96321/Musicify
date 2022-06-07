import 'dart:async';

import '../models/music_list.dart';
import '../networking/api_provider.dart';
import 'package:musicify/constants.dart';

class MusicListRepository {
  ApiProvider _provider = ApiProvider();
  Future<MusicList> fetchMusicListData() async {
    final response = await _provider.get("chart.tracks.get?apikey=$apikey");
    return MusicList.fromJson(response);
  }
}
