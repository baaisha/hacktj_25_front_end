import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:hacktj_25_front_end/components/noti_service.dart';
import 'package:hacktj_25_front_end/constants.dart';

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
        backgroundColor: orangeSecondary,
        title: Text(
          "Live Stream",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 50,
          ),
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
                    return Text("Error loading stream");
                  }
                }),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!;
                  } else {
                    return CircularProgressIndicator(); // Or a loading indicator
                  }
                },
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 22, right: 22, bottom: 5, top: 35),
            child: Container(
              width: 500,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: bluePrimary),
              child: TextButton(
                onPressed: () {
                  NotiService().showNotification(
                      title: "Hello!!!", body: "Helo!! my friendy!");
                },
                style:
                    ButtonStyle(backgroundColor: WidgetStateColor.transparent),
                child: Text(
                  "Pause",
                  style: TextStyle(
                      color: background,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }
}
