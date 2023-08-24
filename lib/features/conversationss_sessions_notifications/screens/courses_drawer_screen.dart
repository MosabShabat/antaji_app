import 'package:antaji_app/constant/const.dart';

import '../../../common/widgets/custom_button.dart';
import '../../artists/screens/portfolio/course_details_screen.dart';

class coursesDrawerScreen extends StatefulWidget {
  const coursesDrawerScreen({super.key});

  @override
  State<coursesDrawerScreen> createState() => _coursesDrawerScreenState();
}
//ChatDrawerScreen
class _coursesDrawerScreenState extends State<coursesDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: SameAppBar(context, hint: research.tr),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Courses.tr.text
                  .fontFamily(bold)
                  .size(24)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: context.screenWidth,
                        height: context.screenHeight / 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            image: DecorationImage(
                              image: AssetImage(imageCamSta),
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                      20.heightBox,
                      Text(
                        'أساسيات التصوير السينمائي بالكاميرات الاحترافية',
                        maxLines: 2,
                        style: TextStyle(
                            fontFamily: bold,
                            fontSize: 12,
                            color: blackColor.value),
                      ),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          '280 ر.س'
                              .text
                              .fontFamily(bold)
                              .size(14)
                              .color(blackColor.value)
                              .make(),
                          10.widthBox,
                          '10 فيديوهات'
                              .text
                              .fontFamily(regular)
                              .size(12)
                              .color(blackColor.value)
                              .make(),
                        ],
                      )
                    ],
                  )
                      .box
                      .height(context.screenHeight / 3.2)
                      .color(whiteColor.value)
                      .width(context.screenWidth / 1.5)
                      .make()
                      .onTap(() {
                    Get.to(
                      () => CourseDetailsScreen(
                        DoneWid: '280 ر.س'
                            .text
                            .fontFamily(bold)
                            .size(14)
                            .color(blackColor.value)
                            .make(),
                        isPay: false,
                      ),
                      transition: Transition.rightToLeft,
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
