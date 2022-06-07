class MusicLyrics {
  Message message;

  MusicLyrics({this.message});

  MusicLyrics.fromJson(Map<String, dynamic> json) {
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message.toJson();
    }
    return data;
  }
}

class Message {
  Header header;
  Body body;

  Message({this.header, this.body});

  Message.fromJson(Map<String, dynamic> json) {
    header =
        json['header'] != null ? new Header.fromJson(json['header']) : null;
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.header != null) {
      data['header'] = this.header.toJson();
    }
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    return data;
  }
}

class Header {
  int statusCode;
  double executeTime;

  Header({this.statusCode, this.executeTime});

  Header.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    executeTime = json['execute_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['execute_time'] = this.executeTime;
    return data;
  }
}

class Body {
  Lyrics lyrics;

  Body({this.lyrics});

  Body.fromJson(Map<String, dynamic> json) {
    lyrics =
        json['lyrics'] != null ? new Lyrics.fromJson(json['lyrics']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lyrics != null) {
      data['lyrics'] = this.lyrics.toJson();
    }
    return data;
  }
}

class Lyrics {
  String lyricsBody;
  String lyricsCopyright;

  Lyrics({this.lyricsBody, this.lyricsCopyright});

  Lyrics.fromJson(Map<String, dynamic> json) {
    lyricsBody = json['lyrics_body'];
    lyricsCopyright = json['lyrics_copyright'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lyrics_body'] = this.lyricsBody;
    data['lyrics_copyright'] = this.lyricsCopyright;
    return data;
  }
}
