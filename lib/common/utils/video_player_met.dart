import 'package:antaji_app/common/utils/video_dialog.dart';
import 'package:antaji_app/constant/const.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:video_player/video_player.dart';

import '../../features/artists/screens/portfolio/user_video_screen.dart';

class videoPlayerMet extends StatefulWidget {
  final String url;
  const videoPlayerMet({super.key, required this.url});

  @override
  State<videoPlayerMet> createState() => _videoPlayerMetState();
}

class _videoPlayerMetState extends State<videoPlayerMet> {
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
      alignment: Alignment.center,
      children: [
        Container(
          width: context.screenWidth / 2.5,
          height: context.screenHeight / 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : CircularProgressIndicator(),
        ),
        _isPlaying
            ? Positioned(
                bottom: 5,
                left: 5,
                child: DottedBorder(
                  color: whiteColor.value,
                  radius: Radius.circular(12),
                  borderType: BorderType.RRect,
                  strokeWidth: 1,
                  child: Column(),
                )
                    .box
                    .width(context.screenWidth / 15)
                    .height(context.screenHeight / 30)
                    .withRounded(value: 12)
                    .make()
                    .onTap(() {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          // backgroundColor: greenColor,
                          child: VideoDialog(
                            url: widget.url,
                          )
                              .box
                              .height(context.screenHeight / 2.5)
                              .width(context.screenWidth)
                              .withRounded(value: 24)
                              .make(),
                        )
                            .box
                            .width(context.screenWidth)
                            .withRounded(value: 24)
                            .height(context.screenHeight / 2.5)
                            .withRounded(
                              value: 12,
                            )
                            .make();
                      });
                }),
              )
            : IconButton(
                iconSize: 20,
                icon: CircleAvatar(
                  radius: context.screenWidth / 8,
                  backgroundColor: Color(0xFF707070),
                  child: SvgPicture.asset(video_play_icon),
                ),
                onPressed: () {
                  _togglePlayPause();
                },
              ).box.make(),
      ],
    ).onTap(() {
      _togglePlayPause();
    });
  }
}

class courseVideoMet extends StatefulWidget {
  final String url;
  final String duration;

  const courseVideoMet({super.key, required this.url, required this.duration});

  @override
  State<courseVideoMet> createState() => _courseVideoMetState();
}

class _courseVideoMetState extends State<courseVideoMet> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(Uri.parse('${widget.url}'))
      ..initialize().then((_) {
        setState(() {});
      });

    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: context.screenWidth / 2.2,
          height: context.screenHeight / 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : CircularProgressIndicator(),
        ),
        CircleAvatar(
          radius: context.screenWidth / 20,
          backgroundColor: Color(0xFF707070),
          child: SvgPicture.asset(video_play_icon),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                '${widget.duration}'
                    .text
                    .fontFamily(bold)
                    .size(10)
                    .color(Colors.white)
                    .make()
              ],
            )
                .box
                .width(context.screenWidth / 9)
                .height(context.screenHeight / 30)
                .color(Color(0xFF707070))
                .customRounded(BorderRadius.only(
                    //  bottomLeft: Radius.circular(12),
                    topRight: Radius.circular(12)))
                .make()
          ],
        ).box.alignBottomLeft.make(),
      ],
    ).onTap(() {
      Get.to(
        () => UserVideoScreen(
          url: widget.url,
          uuidUser: '',
          uuidVideo: '',
        ),
        transition: Transition.rightToLeft,
      );
    });
  }
}
