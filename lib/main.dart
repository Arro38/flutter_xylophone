import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var player = AudioPlayer();
    final List<MaterialColor> colors_list = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Column(
          children: [
            for (var i = 0; i < colors_list.length; i++)
              Expanded(
                child: GestureDetector(
                  child: Container(color: colors_list[i]),
                  onTap: () async => {
                    player = AudioPlayer(),
                    await player.play(AssetSource('note${i + 1}.wav'))
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
