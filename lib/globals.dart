import 'package:audioplayers/audioplayers.dart';

import 'playlist.dart';
import 'track.dart';

Map<String, Track> tracks = new Map<String, Track>();
Map<String, Playlist> playlists = new Map<String, Playlist>();
String currentPlaylist;

void addTracks(List<Track> tl) {
  tracks.addEntries(tl.map((t) => MapEntry(t.title, t)));
}

void addPlaylists(List<Playlist> pl) {
  playlists.addEntries(pl.map((p) => MapEntry(p.name, p)));
}

AudioPlayer audioPlayer = AudioPlayer();

typedef void VoidCallback();
VoidCallback playlistUpdate;
