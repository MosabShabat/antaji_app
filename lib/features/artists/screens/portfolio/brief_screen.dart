import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/artists/screens/portfolio/reviews_screen.dart';
import 'package:antaji_app/features/artists/screens/portfolio/user_video_screen.dart';
import 'package:antaji_app/models/users_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:video_player/video_player.dart';

import '../../../../common/widgets/custom_button.dart';

class BriefScreen extends StatefulWidget {
  final UsersModel? data;
  const BriefScreen({super.key, required this.data});

  @override
  State<BriefScreen> createState() => _BriefScreenState();
}

class _BriefScreenState extends State<BriefScreen> {
  late VideoPlayerController _controller_video;
  late GoogleMapController mapController;

  late LatLng _center = LatLng(double.parse(lat), double.parse(lng));
  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    Marker newMarker = Marker(
      markerId: MarkerId('red_marker'),
      position: LatLng(double.parse(lat), double.parse(lng)),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow: InfoWindow(title: 'Red Marker'),
    );

    setState(() {
      _markers.add(newMarker);
    });
  }

  late var lat;
  late var lng;
  @override
  void initState() {
    lat = widget.data!.lat!;
    lng = widget.data!.lng!;
    _controller_video =
        VideoPlayerController.networkUrl(Uri.parse('${widget.data!.video}'))
          ..initialize().then((_) {
            if (mounted) {
              setState(() {});
            }
          });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('FFFFFFFFFFFFFFFFFFFFFFFFF');
    print(lat);
    print(lng);
    print('FFFFFFFFFFFFFFFFFFFFFFFFF');
    return Scaffold(
        backgroundColor: whiteColor.value,
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.heightBox,
                  widget.data!.brief == null
                      ? SizedBox()
                      : '${widget.data!.brief!}'
                          .text
                          .fontFamily(regular)
                          .size(14)
                          .color(blackColor.value)
                          .make(),
                  20.heightBox,
                  widget.data!.video == null
                      ? SizedBox()
                      : WatchTheAction.tr.text
                          .fontFamily(bold)
                          .size(14)
                          .color(blackColor.value)
                          .make(),
                  20.heightBox,
                  widget.data!.video == null
                      ? SizedBox()
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              child: _controller_video.value.isInitialized
                                  ? AspectRatio(
                                      aspectRatio:
                                          _controller_video.value.aspectRatio,
                                      child: VideoPlayer(_controller_video),
                                    )
                                  : CircularProgressIndicator(),
                            )
                                .box
                                .height(context.screenHeight / 3.5)
                                .width(context.screenWidth)
                                .color(lightColor.value)
                                .rounded
                                .make(),
                            CircleAvatar(
                              radius: context.screenWidth / 14,
                              backgroundColor: Color(0xFF707070),
                              child: SvgPicture.asset(
                                video_play_icon,
                                width: context.screenWidth / 14,
                                height: context.screenHeight / 28,
                              ).onTap(() {
                                Get.to(
                                  () => UserVideoScreen(
                                    url: widget.data!.video!,
                                    uuidUser: '',
                                    uuidVideo: '',
                                  ),
                                  transition: Transition.rightToLeft,
                                );
                              }),
                            ),
                          ],
                        ),
                  20.heightBox,
                  theSite.tr.text
                      .fontFamily(bold)
                      .size(14)
                      .color(blackColor.value)
                      .make(),
                  20.heightBox,
                  Container(
                    width: context.screenWidth,
                    height: context.screenHeight / 3.5,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(24)),
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      onCameraMove: (position) {},
                      mapType: MapType.terrain,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 11.0,
                      ),
                      gestureRecognizers:
                          <Factory<OneSequenceGestureRecognizer>>[
                        Factory<OneSequenceGestureRecognizer>(
                            () => EagerGestureRecognizer()),
                      ].toSet(),
                      markers: _markers,
                    ),
                  ),
                  20.heightBox,
                  rowSpBet(
                    text: '${reviews.tr}  (${widget.data!.reviewsCount!})',
                    onPressed: () {
                      Get.to(
                        () => ReviewsScreen(
                          rev_data: widget.data!.reviews!,
                        ),
                        transition: Transition.rightToLeft,
                      );
                    },
                  ),
                  20.heightBox,
                  widget.data!.reviews!.isEmpty
                      ? SizedBox()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: widget.data!.reviews!.length,
                          itemBuilder: (context, index) {
                            var rev_data = widget.data!.reviews![index];
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      NetworkImage(rev_data.userImage!),
                                ),
                                10.widthBox,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        '${rev_data.userName!}'
                                            .text
                                            .fontFamily(bold)
                                            .size(14)
                                            .color(blackColor.value)
                                            .make(),
                                        10.widthBox,
                                        '.  ${rev_data.timeAgo!}'
                                            .text
                                            .color(blackColor.value)
                                            .fontFamily(regular)
                                            .size(12)
                                            .color(greyColor)
                                            .make(),
                                      ],
                                    ),
                                    Container(
                                      child: Text(
                                        '${rev_data.title!}',
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontFamily: regular,
                                          fontSize: 14,
                                          color: blackColor.value,
                                        ),
                                      ),
                                    )
                                        .box
                                        .height(
                                          context.screenHeight / 18,
                                        )
                                        .width(
                                          context.screenWidth * 0.6,
                                        )
                                        // .color(greenColor)
                                        .make(),
                                  ],
                                )
                              ],
                            )
                                .box
                                .height(context.screenHeight / 9)
                                .width(context.screenWidth / 4)
                                // .color(lightColor.value)
                                .withRounded(value: 24)
                                .margin(EdgeInsets.all(8))
                                .make();
                          },
                        )
                ],
              ),
            )));
  }
}
