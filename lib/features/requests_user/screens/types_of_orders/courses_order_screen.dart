import '../../../../constant/const.dart';

class CoursesOrderScreen extends StatefulWidget {
  const CoursesOrderScreen({super.key});

  @override
  State<CoursesOrderScreen> createState() => _CoursesOrderScreenState();
}

class _CoursesOrderScreenState extends State<CoursesOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Today.tr.text
                .fontFamily(bold)
                .size(14)
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
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: greenColor,
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                            10.widthBox,
                            BuyingSucceeded.tr.text
                                .fontFamily(bold)
                                .size(14)
                                .color(greenColor)
                                .make(),
                          ],
                        ),
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
                  // Get.to(
                  //   () => CourseDetailsScreen(
                  //     DoneWid: '280 ر.س'
                  //         .text
                  //         .fontFamily(bold)
                  //         .size(14)
                  //         .color(blackColor.value)
                  //         .make(),
                  //     isPay: false,
                  //   ),
                  //   transition: Transition.rightToLeft,
                  // );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
