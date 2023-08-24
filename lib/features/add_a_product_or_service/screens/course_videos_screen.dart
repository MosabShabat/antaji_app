import 'package:antaji_app/features/add_a_product_or_service/screens/add_successfully_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../constant/const.dart';

class CourseVideosScreen extends StatefulWidget {
  const CourseVideosScreen({super.key});

  @override
  State<CourseVideosScreen> createState() => _CourseVideosScreenState();
}

class _CourseVideosScreenState extends State<CourseVideosScreen> {
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
                  .color(blackColor.value)
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
          toPublish.tr.text
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
          () => addSuccessfullyScreen(),
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
              CourseVideos.tr.text
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
                      AddCourseVideos.tr.text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                      10.heightBox,
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
              '${downloadComplete.tr}  (2)'
                  .tr
                  .text
                  .fontFamily(bold)
                  .size(16)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(
                            imageCamSta,
                          ),
                          fit: BoxFit.cover,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.close,
                            color: whiteColor.value,
                          )
                              .box
                              .roundedFull
                              .color(blackColor.value.withOpacity(0.5))
                              .make()
                              .onTap(() {})
                        ],
                      ),
                    ),
                  )
                      .box
                      .width(context.screenWidth)
                      .height(context.screenHeight / 5)
                      .margin(EdgeInsets.symmetric(vertical: 12))
                      .make();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
