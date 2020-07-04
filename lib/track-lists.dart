import 'package:flutter/material.dart';
import 'package:metaplayer/globals.dart';
import 'package:metaplayer/playlist.dart';

import 'track.dart';

class TrackList extends StatefulWidget {
  TrackList({Key key}) : super(key: key);

  @override
  _TrackListState createState() => _TrackListState();
}

class _TrackListState extends State<TrackList> {
  List<DataColumn> listRows;

  bool sortAscending = true;
  int sortColumnIndex = 0;

  _TrackListState() {
    playlistUpdate = rebuild;
    listRows = [
      DataColumn(label: Text("Title"), onSort: sorter),
      DataColumn(label: Text("Artist"), onSort: sorter),
      DataColumn(label: Text("")),
    ];
  }

  void rebuild() {
    setState(() {});
  }

  void sorter(int columnIndex, bool ascending) {
    setState(() {
      sortColumnIndex = columnIndex;
      sortAscending = ascending;
      playlists[currentPlaylist].tracks.sort();
      if (ascending)
        playlists[currentPlaylist].tracks =
            playlists[currentPlaylist].tracks.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: DataTable(
          sortAscending: sortAscending,
          sortColumnIndex: sortColumnIndex,
          columns: listRows,
          rows: playlists[currentPlaylist]?.tracks?.map((String tn) {
            return (tracks[tn] ??
                    Track("Track can't be resolved", "ohno-error", ""))
                .buildListWidget(context);
          })?.toList(),
        ),
      ),
    );
  }
}
