import 'package:antaji_app/api/api_settings.dart';
import 'package:antaji_app/features/auth/controller/auth_getx_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:antaji_app/models/response.dart' as Response;
import '../../../../constant/const.dart';

class UserVideoScreen extends StatefulWidget {
  final String url;
  final String uuidUser;
  final String uuidVideo;
  const UserVideoScreen(
      {super.key,
      required this.url,
      required this.uuidUser,
      required this.uuidVideo});

  @override
  State<UserVideoScreen> createState() => _UserVideoScreenState();
}

class _UserVideoScreenState extends State<UserVideoScreen> {
  var controllerAut = Get.put(AuthGetxController());
  late VideoPlayerController _controller;
  late bool _isPlaying;

  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(Uri.parse('${widget.url}'))
      ..initialize().then((_) {
        setState(() {});
      });
    _isPlaying = false;

    _viewsPost();

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
    return Scaffold(
      backgroundColor: blackColor.value,
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: Colors.transparent,
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: whiteColor.value,
            child: Icon(
              Icons.close,
              color: blackColor.value,
            ),
          ).box.make().onTap(() {
            Get.back();
          }),
          30.widthBox,
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: context.screenWidth,
                height: context.screenHeight / 3,
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
                  ? SizedBox()
                  : CircleAvatar(
                      radius: context.screenWidth / 14,
                      backgroundColor: Color(0xFF707070),
                      child: SvgPicture.asset(
                        video_play_icon,
                        width: context.screenWidth / 14,
                        height: context.screenHeight / 28,
                      ),
                    ).onTap(() {
                      _togglePlayPause();
                    }),
            ],
          )
              .onTap(() {
                _togglePlayPause();
              })
              .box
              .height(context.screenHeight / 3)
              .width(context.screenWidth)
              .rounded
              .color(whiteColor.value)
              .make()
        ],
      ).box.width(context.screenWidth).height(context.screenHeight).make(),
    );
  }

  Future<void> _viewsPost() async {
    if (widget.uuidUser != '' && widget.uuidVideo != '') {
      Response.Response response = await controllerAut.postViewsFunc(
          url:
              '${baseUrl}users/${widget.uuidUser}/business/videos/${widget.uuidVideo}');
      print(response.status);

      Get.snackbar("message", response.message!,
          backgroundColor: response.status! ? Colors.green : Colors.pink,
          colorText: Colors.white);
    }
  }
}
