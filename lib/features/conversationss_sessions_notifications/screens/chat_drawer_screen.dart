import 'package:antaji_app/features/register_an_account/chat_screen.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../constant/const.dart';

class ChatDrawerScreen extends StatefulWidget {
  const ChatDrawerScreen({super.key});

  @override
  State<ChatDrawerScreen> createState() => _ChatDrawerScreenState();
}

class _ChatDrawerScreenState extends State<ChatDrawerScreen> {
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
              conversations.tr.text
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
                              index == 0
                                  ? CircleAvatar(
                                      radius: 12,
                                      backgroundColor: redColor,
                                      child: '12'
                                          .text
                                          .fontFamily(bold)
                                          .size(10)
                                          .color(whiteColor.value)
                                          .make(),
                                    )
                                  : SizedBox()
                            ],
                          ).box.width(context.screenWidth / 1.5).make(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              'أخبرنا كيف كانت تجربتك مع كومبو'
                                  .text
                                  .fontFamily(regular)
                                  .size(14)
                                  .color(blackColor.value)
                                  .make(),
                              'منذ 3 ساعات'
                                  .text
                                  .fontFamily(regular)
                                  .size(12)
                                  .color(greyColor)
                                  .make(),
                            ],
                          ).box.width(context.screenWidth / 1.5).make(),
                        ],
                      )
                    ],
                  )
                      .box
                      .height(context.screenHeight / 9)
                      .width(context.screenWidth)
                      // .color(lightColor)
                      .withRounded(value: 24)
                      .margin(EdgeInsets.symmetric(vertical: 4.0))
                      .make()
                      .onTap(() {
                    Get.to(
                      () => ChatScreen(),
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
