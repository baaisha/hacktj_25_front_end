import 'package:flutter/material.dart';
import 'package:pubspec_runtime/pubspec_runtime.dart';
//import 'package:flutter/rendering.dart';
import 'package:hacktj_25_front_end/components/video_widget.dart';
//import 'package:video_player/video_player.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var test = Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: SizedBox(
        height:50,
        child: Row(
          children: [
            Popup(
              videoPath: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
              header: 'EVENT: SOMETHING HAPPENED',
              description: 'Cool this should ACTIVATE.',
            ),
            Popup(
              videoPath: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
              header: 'EVENT: SOMETHING HAPPENED',
              description: 'Cool this should ACTIVATE.',
            ),
          ],
        ),
      ),
    );
    return test;
  }
}

class Popup extends StatelessWidget {

  final String videoPath;
  final String header;
  final String description;

  var pubspecEditor = PubspecEditor();

  Popup({
    super.key,
    required this.videoPath,
    required this.header,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    pubspecEditor.save();
    runPubGet();
    return Container(
      height:200,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.indigo,
          width: 5.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          VideoWidget(path: videoPath),
          Column(
            children: [
              Text(header),
              Text(description),
            ],
          ),
        ],
      )
    );
  }
}

