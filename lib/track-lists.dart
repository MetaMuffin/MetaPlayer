import 'package:flutter/material.dart';
import 'package:metaplayer/globals.dart';

import 'track.dart';

class TrackList extends StatefulWidget {
  TrackList({Key key}) : super(key: key);

  @override
  _TrackListState createState() => _TrackListState();
}

class _TrackListState extends State<TrackList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: playlists[currentPlaylist].tracks.length ?? 0,
        itemBuilder: (context, index) {
          Track t = tracks[playlists[currentPlaylist]?.tracks[index]] ??
              Track("Track can't be resolved", "ohno-error", "");

          return t.buildListWidget(context);
        },
      ),
    );
  }
}
