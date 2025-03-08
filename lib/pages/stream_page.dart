import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Stream'),
      ),
      body: Center(
        child: Mjpeg(
          isLive: true,
          stream: 'http://10.0.2.2:5001/video_feed',
        ),
      ),
    );
  }
}
