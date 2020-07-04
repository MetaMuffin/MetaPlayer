import 'package:flutter/material.dart';
import 'package:metaplayer/globals.dart';
import 'package:metaplayer/playlist.dart';
import 'package:metaplayer/theme.dart';
import 'package:metaplayer/track-lists.dart';

import 'track.dart';

void main() {
  loadTestingPlaylists();
  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MetaPlayer",
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: Text("MetaPlayer ¯\\_(-_-)_/¯"),
        ),
        body: Builder(
          builder: (context) => Container(child: TrackList()),
        ),
      ),
    );
  }
}

void loadTestingPlaylists() {
  addTracks([
    Track("Sample 3", "x",
        "https://filesamples.com/samples/audio/mp3/sample3.mp3"),
    Track("Sample 4", "y",
        "https://filesamples.com/samples/audio/mp3/sample4.mp3"),
    Track("Synphony No. 6", "upsi",
        "https://filesamples.com/samples/audio/mp3/Symphony%20No.6%20(1st%20movement).mp3"),
    Track("Sample audio", "someone",
        "https://file-examples.com/wp-content/uploads/2017/11/file_example_MP3_700KB.mp3"),
    Track("An even better sample", "somebody i dont know",
        "https://filesamples.com/samples/audio/mp3/sample1.mp3"),
    Track("More samples, you guessed it", "uff",
        "https://filesamples.com/samples/audio/mp3/sample2.mp3"),
  ]);
  addPlaylists([
    Playlist(
      "Blub 1",
      ["Sample audio", "An even better sample", "More samples, you guessed it"],
    ),
    Playlist(
      "Blub 2",
      ["Sample 3", "Sample 4", "Synphony No. 6"],
    ),
  ]);
  currentPlaylist = "Blub 1";
}
