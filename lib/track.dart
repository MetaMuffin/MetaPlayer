import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:metaplayer/globals.dart';

class Track {
  String title;
  String artist;
  Duration duration;
  String url;

  Track(this.title, this.artist, this.url);

  Widget buildListWidget(BuildContext context) {
    return ListTile(
      title: Text("$title by $artist"),
      trailing: IconButton(
        icon: Icon(Icons.play_arrow),
        onPressed: () async {
          if (audioPlayer.state == AudioPlayerState.PLAYING)
            await audioPlayer.stop();
          await audioPlayer.play(url);
        },
      ),
    );
  }
}
