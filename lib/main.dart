import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
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
      home: Scaffold(
        appBar: AppBar(
          title: Text("MetaPlayer ¯\\_(-_-)_/¯"),
        ),
        body: Builder(
          builder: (context) => Container(
            child: Column(
              children: [
                FlatButton(
                  child: Text("Play some audio!"),
                  onPressed: () async {
                    AudioPlayer player = new AudioPlayer();
                    await player.play("https://www.example.net/sample.wav",
                        isLocal: false);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
