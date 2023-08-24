import 'package:antaji_app/constant/const.dart';

import '../../../../common/widgets/custom_button.dart';
import 'buy_the_course.dart';

class CourseDetailsScreen extends StatefulWidget {
  final Widget DoneWid;
  final bool isPay;
  const CourseDetailsScreen(
      {super.key, required this.DoneWid, required this.isPay});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CourseDetails.tr.text
                  .fontFamily(bold)
                  .size(24)
                  .color(blackColor.value)
                  .make(),
            ),
            20.heightBox,
            Image.asset(
              imageCamSta,
              width: context.screenWidth,
              height: context.screenHeight / 4,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'أساسيات التصوير السينمائي بالكاميرات الاحترافية',
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: bold,
                      fontSize: 14,
                      color: blackColor.value,
                    ),
                  ),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.DoneWid,
                      '10 فيديوهات'
                          .text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                    ],
                  ),
                  30.heightBox,
                  CustomButton(
                    text: buyNow.tr,
                    textColor: whiteColor.value,
                    backgroundColor: blackColor.value,
                    borderColor: blackColor.value,
                    onPressed: () {
                      Get.to(
                        () => BuyTheCourseScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                  ).box.height(60).width(context.screenWidth).make(),
                  30.heightBox,
                  Brief.tr.text
                      .fontFamily(bold)
                      .size(16)
                      .color(blackColor.value)
                      .make(),
                  20.heightBox,
                  Text(
                    'التصوير السينمائي بالكاميرات التصوير السينمائي بالكاميرات التصوير السينمائي بالكاميرات التصوير السينمائي بالكاميرات التصوير السينمائي بالكاميرات التصوير السينمائي بالكاميرات التصوير السينمائي بالكاميرات التصوير السينمائي بالكاميرات أساسيات التصوير السينمائي بالكاميرات الاحترافية',
                    maxLines: 3,
                    style: TextStyle(
                      fontFamily: bold,
                      fontSize: 14,
                      color: blackColor.value,
                      height: 1.5,
                    ),
                  ),
                  30.heightBox,
                  CourseVideos.tr.text
                      .fontFamily(bold)
                      .size(16)
                      .color(blackColor.value)
                      .make(),
                  30.heightBox,
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: context.height / 9,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Container(
                          height: context.screenHeight / 9,
                          decoration: BoxDecoration(
                              color: greenColor,
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(imageCamSta),
                                fit: BoxFit.cover,
                              )),
                        );
                      }),
                  40.heightBox,
                  widget.isPay
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(UserImage),
                                ),
                                20.widthBox,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    'ميلا الزهراني'
                                        .text
                                        .black
                                        .fontFamily(bold)
                                        .size(12)
                                        .make(),
                                    'تصوير سينمائي'
                                        .text
                                        .black
                                        .fontFamily(medium)
                                        .size(12)
                                        .make(),
                                  ],
                                ).box.height(40).make(),
                              ],
                            ),
                            CustomButton(
                              text: communication.tr,
                              textColor: whiteColor.value,
                              backgroundColor: blackColor.value,
                              borderColor: blackColor.value,
                              onPressed: () {
                                // Get.to(
                                //   () => BuyTheCourseScreen(),
                                //   transition: Transition.rightToLeft,
                                // );
                              },
                            )
                                .box
                                .height(45)
                                .width(context.screenWidth / 4)
                                .make(),
                          ],
                        )
                      : SizedBox(),
                  20.heightBox,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
