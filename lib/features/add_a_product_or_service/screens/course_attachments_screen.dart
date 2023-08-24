import 'package:antaji_app/features/add_a_product_or_service/screens/course_videos_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../constant/const.dart';

class CourseAttachmentsScreen extends StatefulWidget {
  const CourseAttachmentsScreen({super.key});

  @override
  State<CourseAttachmentsScreen> createState() =>
      _CourseAttachmentsScreenState();
}

class _CourseAttachmentsScreenState extends State<CourseAttachmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container()
                  .box
                  .height(context.screenHeight / 150)
                  .width(context.screenWidth / 12)
                  .rounded
                  .color(blackColor.value)
                  .make(),
              Container()
                  .box
                  .height(context.screenHeight / 150)
                  .width(context.screenWidth / 12)
                  .rounded
                  .color(blackColor.value)
                  .make(),
              Container()
                  .box
                  .height(context.screenHeight / 150)
                  .width(context.screenWidth / 12)
                  .rounded
                  .color(lightColor.value)
                  .make(),
            ],
          )
              .box
              .margin(EdgeInsets.symmetric(horizontal: 15))
              .width(context.screenWidth / 3.5)
              .make()
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Continuation.tr.text
              .fontFamily(bold)
              .color(whiteColor.value)
              .size(18)
              .make(),
        ],
      )
          .box
          .height(context.screenHeight / 16)
          .width(context.screenWidth)
          .margin(EdgeInsets.symmetric(vertical: 12, horizontal: 20))
          .color(blackColor.value)
          .rounded
          .make()
          .onTap(() {
        Get.to(
          () => CourseVideosScreen(),
          transition: Transition.rightToLeft,
        );
      }),
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntroductionToTheCourse.tr.text
                  .fontFamily(bold)
                  .size(24)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              DottedBorder(
                color: greyColor,
                radius: Radius.circular(10),
                borderType: BorderType.RRect,
                strokeWidth: 1,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        videoPlayIcon,
                        color: blackColor.value,
                      ),
                      10.heightBox,
                      AddYourIntroductionVideo.tr.text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                      10.heightBox,
                      ViewItBeforePurchasing.tr.text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                    ],
                  ),
                ),
              )
                  .box
                  .height(context.screenHeight / 4)
                  .width(context.screenWidth)
                  .rounded
                  .make(),
              20.heightBox,
              DottedBorder(
                color: greyColor,
                radius: Radius.circular(10),
                borderType: BorderType.RRect,
                strokeWidth: 1,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        galleryAddIcon,
                        color: blackColor.value,
                      ),
                      10.heightBox,
                      AddACoverPhoto.tr.text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                    ],
                  ),
                ),
              )
                  .box
                  .height(context.screenHeight / 4)
                  .width(context.screenWidth)
                  .rounded
                  .make(),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
