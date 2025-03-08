import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


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
      body: Row(
        children: [
          VideoWidget(),
          VideoWidget(),
          VideoWidget(),
        ],
      ),
    );
    return test;
  }
}

class VideoWidget extends StatelessWidget {
  late final VideoPlayerController _controller = VideoPlayerController.networkUrl(
    Uri.parse(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      //'C:\\Users\\jaspe.MSI\\Documents\\GithubLocal\\hacktj_25_front_end\\debug_video.mp4',
    ),
  );
  late final Future<void> _initializeVideoPlayerFuture = _controller.initialize();
  //_controller.setLooping(true);
  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
  }

  VideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the VideoPlayerController has finished initialization, use
              // the data it provides to limit the aspect ratio of the video.
              return SizedBox(
                width:100,
                // Use the VideoPlayer widget to display the video.
                child: VideoPlayer(_controller),
              );
            } else {
              // If the VideoPlayerController is still initializing, show a
              // loading spinner.
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        ElevatedButton(
          onPressed: () {
            // Wrap the play or pause in a call to `setState`. This ensures the
            // correct icon is shown.
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          },
          // Display the correct icon depending on the state of the player.
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ],
    );
  }
}
