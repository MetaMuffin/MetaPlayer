import 'package:flutter/material.dart';

import 'track.dart';

class Playlist {
  String name;
  List<String> tracks;

  Playlist(this.name, this.tracks);

  Widget buildListWidget(BuildContext context) {
    return ListTile(
      title: Text("$name"),
    );
  }
}
