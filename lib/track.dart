import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:metaplayer/globals.dart';

class Track {
  String title;
  String artist;
  Duration duration;
  String url;

  Track(this.title, this.artist, this.url);

  DataRow buildListWidget(BuildContext context) {
    return DataRow(
      cells: [
        DataCell(Text("$title")),
        DataCell(Text("$artist")),
        DataCell(
          IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: () async {
              if (audioPlayer.state == AudioPlayerState.PLAYING)
                await audioPlayer.stop();
              await audioPlayer.play(url);
            },
          ),
        )
      ],
    );
  }
}
