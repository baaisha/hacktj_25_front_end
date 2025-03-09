import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:hacktj_25_front_end/constants.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  IO.Socket? socket;
  String notificationText = "Waiting for notifications...";

  @override
  void initState() {
    super.initState();
    // Establish socket connection
    socket = IO.io('http://10.180.8.138:5001', <String, dynamic>{
      'transports': ['websocket'],
    });

    // Set up socket listeners
    socket?.on('connect', (_) {
      print('Connected to Flask server');
    });

    socket?.on('new_notification', (data) {
      print('Received notification: $data');
      setState(() {
        notificationText = "${data['title']}: ${data['body']}";
      });
    });
  }

  @override
  void dispose() {
    socket?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeSecondary,
        title: const Text(
          "Live Stream",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 50),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: Future.delayed(Duration.zero, () async {
                  try {
                    return Mjpeg(
                      isLive: true,
                      stream: 'http://10.180.8.138:5002/video_feed',
                    );
                  } catch (e) {
                    print("Error loading stream: $e");
                    return const Text("Error loading stream");
                  }
                }),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!;
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              notificationText,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 200),
        ],
      ),
    );
  }
}
