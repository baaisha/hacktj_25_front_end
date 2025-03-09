// import 'package:flutter/material.dart';
// import 'package:native_video_player/native_video_player.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Native Video Player'),
//       ),
//       body: NativeVideoPlayerView(
//         onViewReady: (controller) async {
//           // Make sure the path is correct, either assets or from the device storage
//           final videoSource = await VideoSource.init(
//             path:
//                 'assets/videos/262610768_main_xxl.mp4', // Replace with your video path
//             type: VideoSourceType
//                 .file, // Use appropriate type (asset, file, or network)
//           );
//           await controller.loadVideoSource(videoSource);
//         },
//         // Optionally, set up other parameters like auto-play, controls, etc.
//         // autoPlay: true,
//         // showControls: true,
//       ),
//     );
//   }
// }

// void main() {
//   runApp(const MaterialApp(
//     home: HomePage(),
//   ));
// }

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}