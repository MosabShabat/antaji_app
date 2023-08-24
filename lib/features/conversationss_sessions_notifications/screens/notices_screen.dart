import 'package:antaji_app/features/conversationss_sessions_notifications/screens/review_notices_screen.dart';

import '../../../constant/const.dart';

class NoticesScreen extends StatefulWidget {
  const NoticesScreen({super.key});

  @override
  State<NoticesScreen> createState() => _NoticesScreenState();
}
//courses_drawer_screen
class _NoticesScreenState extends State<NoticesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Notices.tr.text
                  .fontFamily(bold)
                  .size(24)
                  .color(blackColor.value)
                  .make(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                physics: BouncingScrollPhysics(),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              'محمد خالد'
                                  .text
                                  .fontFamily(bold)
                                  .size(14)
                                  .color(blackColor.value)
                                  .make(),
                              10.widthBox,
                              'منذ 3 ساعات'
                                  .text
                                  .fontFamily(regular)
                                  .size(12)
                                  .color(greyColor)
                                  .make(),
                            ],
                          ).box.width(context.screenWidth / 1.4).make(),
                          //review_notices_screen
                          Container(
                            child: Text(
                              'أخبرنا كيف كانت تجربتك مع دي جيه أي مافيك 3 سينما بريميوم كومبو',
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
                      .width(context.screenWidth)
                      // .color(lightColor)
                      .withRounded(value: 24)
                      .margin(EdgeInsets.symmetric(vertical: 12.0))
                      .make()
                      .onTap(() {
                    Get.to(
                      () => reviewNoticesScreen(),
                      transition: Transition.rightToLeft,
                    );
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
