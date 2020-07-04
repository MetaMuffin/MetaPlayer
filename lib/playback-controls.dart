import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:metaplayer/globals.dart';

class PlaybackControls extends StatefulWidget {
  PlaybackControls({Key key}) : super(key: key);

  @override
  _PlaybackControlsState createState() => _PlaybackControlsState();
}

class _PlaybackControlsState extends State<PlaybackControls> {
  double duration;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon((audioPlayer.state == AudioPlayerState.PLAYING)
                    ? Icons.pause
                    : Icons.play_arrow),
                onPressed: () async {
                  if (audioPlayer.state == AudioPlayerState.PLAYING) {
                    await audioPlayer.pause();
                  } else {
                    await audioPlayer.resume();
                  }
                },
              )
            ],
          ),
          StreamBuilder(
            initialData: 0,
            stream: audioPlayer.onAudioPositionChanged,
            builder: (context, snapshot) {
              return Slider(
                min: 0,
                max: duration,
                value: snapshot.data,
                onChanged: (value) {},
              );
            },
          ),
        ],
      ),
    );
  }
}
