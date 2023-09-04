import 'package:video_player/video_player.dart';

import '../../constant/const.dart';

class VideoDialog extends StatefulWidget {
  final String url;
  const VideoDialog({
    super.key,
    required this.url,
  });

  @override
  State<VideoDialog> createState() => _VideoDialogState();
}

class _VideoDialogState extends State<VideoDialog> {
  late VideoPlayerController _controller;
  late bool _isPlaying;

  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(Uri.parse('${widget.url}'))
      ..initialize().then((_) {
        setState(() {});
      });
    _isPlaying = false;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.screenWidth,
          height: context.screenHeight / 2.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : CircularProgressIndicator(),
        ),
        Positioned(
            top: 5,
            left: 5,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: whiteColor.value,
              child: Icon(
                Icons.close,
                color: blackColor.value,
              ),
            ).onTap(() {
              Get.back();
            })),
        Center(
          child: IconButton(
            iconSize: 50,
            icon: _isPlaying
                ? Container()
                : CircleAvatar(
                    radius: context.screenWidth / 4,
                    backgroundColor: Color(0xFF707070),
                    child: SvgPicture.asset(
                      video_play_icon,
                      width: context.screenWidth / 8,
                      height: context.screenHeight / 16,
                      // fit: BoxFit.cover,
                    ).box.padding(EdgeInsets.all(8)).make(),
                  ),
            onPressed: () {
              _togglePlayPause();
            },
          ).box.make(),
        ),
      ],
    );
  }
}
