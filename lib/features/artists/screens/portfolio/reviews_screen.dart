import 'package:antaji_app/constant/const.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              '${reviews.tr}  (20)'
                  .text
                  .fontFamily(bold)
                  .size(24)
                  .color(blackColor.value)
                  .make(),
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
                              .make(),
                        ],
                      )
                    ],
                  )
                      .box
                      .height(context.screenHeight / 9)
                      .width(context.screenWidth / 4)
                      // .color(lightColor)
                      .withRounded(value: 24)
                      .margin(EdgeInsets.symmetric(vertical: 12.0))
                      .make();
                },
              )
                  .box
                  .height(context.screenHeight)
                  .width(context.screenWidth)
                  .make()
            ],
          ),
        ),
      ),
    );
  }
}
