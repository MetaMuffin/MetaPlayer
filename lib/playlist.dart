import 'package:flutter/material.dart';
import 'globals.dart';
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

class PlaylistList extends StatefulWidget {
  PlaylistList({Key key}) : super(key: key);

  @override
  _PlaylistListState createState() => _PlaylistListState();
}

class _PlaylistListState extends State<PlaylistList> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: playlists.values.map((Playlist p) {
          return ListTile(
            title: Text(p.name),
            selected: p.name == currentPlaylist,
            onTap: () {
              setState(() {
                currentPlaylist = p.name;
              });
              Navigator.pop(context);
              playlistUpdate();
            },
          );
        }).toList(),
      ),
    );
  }
}
