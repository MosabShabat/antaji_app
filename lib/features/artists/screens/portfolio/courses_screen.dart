import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/artists/screens/portfolio/course_details_screen.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
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
                            fontFamily: bold, fontSize: 12, color: blackColor.value),
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
