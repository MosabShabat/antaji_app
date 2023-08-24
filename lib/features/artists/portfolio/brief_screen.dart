import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/artists/portfolio/reviews_screen.dart';

import '../../../common/widgets/custom_button.dart';

class BriefScreen extends StatefulWidget {
  const BriefScreen({super.key});

  @override
  State<BriefScreen> createState() => _BriefScreenState();
}

class _BriefScreenState extends State<BriefScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor.value,
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightBox,
              'تجارية إلى غير هادفة للربح ، سرد للوثيقة ، لقد صورت الكثير تجارية إلى غير هادفة للربح ، سرد للوثيقة ، لقد صورت الكثير تجارية إلى غير هادفة للربح ، سرد للوثيقة ، لقد صورت الكثير'
                  .text
                  .fontFamily(regular)
                  .size(14)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              WatchTheAction.tr.text
                  .fontFamily(bold)
                  .size(14)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Container()
                  .box
                  .height(context.screenHeight / 3.5)
                  .color(lightColor.value)
                  .rounded
                  .make(),
              20.heightBox,
              theSite.tr.text
                  .fontFamily(bold)
                  .size(14)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Container()
                  .box
                  .height(context.screenHeight / 3.5)
                  .color(lightColor.value)
                  .rounded
                  .make(),
              20.heightBox,
              rowSpBet(
                text: '${reviews.tr}  (20)',
                onPressed: () {
                  Get.to(
                    () => ReviewsScreen(),
                    transition: Transition.rightToLeft,
                  );
                },
              ),
              20.heightBox,
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(UserImage),
                      ),
                      10.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              'محمد خالد'
                                  .text
                                  .fontFamily(bold)
                                  .size(14)
                                  .color(blackColor.value)
                                  .make(),
                              10.widthBox,
                              '.  منذ 4 أيام'
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
                              ' كل شيء سار على نحو سلس وبسيط. شكراً جزيلاً! ',
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
                  .box
                  .height(context.screenHeight / 2)
                  .width(context.screenWidth)
                  .make()
            ],
          ),
        )));
  }
}
