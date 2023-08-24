import 'package:antaji_app/features/register_an_account/chat_screen.dart';

import '../../common/widgets/custom_button.dart';
import '../../constant/const.dart';

class jobScreen extends StatefulWidget {
  const jobScreen({super.key});

  @override
  State<jobScreen> createState() => _jobScreenState();
}

class _jobScreenState extends State<jobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(clockImage),
              10.widthBox,
              'قبل 3 ساعات'
                  .text
                  .fontFamily(medium)
                  .size(12)
                  .color(blackColor.value)
                  .make(),
              10.widthBox,
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'وظيفة مدير التصوير الفوتوغرافي'
                  .text
                  .fontFamily(bold)
                  .size(18)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      aContract.tr.text
                          .fontFamily(bold)
                          .size(14)
                          .color(blackColor.value)
                          .make(),
                    ],
                  )
                      .box
                      .height(context.screenHeight / 20)
                      .width(context.screenWidth / 5)
                      .color(lightColor.value)
                      .rounded
                      .padding(EdgeInsets.all(8))
                      .margin(EdgeInsets.only(left: 8))
                      .make();
                },
              )
                  .box
                  .height(context.screenHeight / 20)
                  .make(),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(moneysImage),
                  5.widthBox,
                  '100 ر.س / يوم'
                      .text
                      .fontFamily(bold)
                      .size(12)
                      .color(blackColor.value)
                      .make()
                ],
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(LightLocationIcon),
                  10.widthBox,
                  'الرياض'
                      .text
                      .fontFamily(medium)
                      .size(12)
                      .color(blackColor.value)
                      .make(),
                ],
              ),
              20.heightBox,
              DurationOfEmployment.tr.text
                  .fontFamily(bold)
                  .size(14)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(calendarImage),
                      10.widthBox,
                      '${starts.tr}  10/06/2023 \t\t\t\t\t\t  . ${finish.tr}  10/07/2023'
                          .text
                          .fontFamily(medium)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                    ],
                  ),
                ],
              ),
              20.heightBox,
              'يتم تنسيق التاريخ مباشرة مع الموضوع. نصف يوم تصوير. مقابلة شخص واحد سواء في منزلهم أو مكتبهم في مدينة الرياض'
                  .text
                  .fontFamily(medium)
                  .size(12)
                  .maxLines(2)
                  .lineHeight(2)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              publisher.tr.text
                  .fontFamily(bold)
                  .size(12)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(UserImage),
                  ),
                  20.widthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      'ميلا الزهراني'
                          .text
                          .color(blackColor.value)
                          .fontFamily(bold)
                          .size(12)
                          .make(),
                      '1 عنصر'
                          .text
                          .color(blackColor.value)
                          .fontFamily(medium)
                          .size(12)
                          .make(),
                    ],
                  ).box.height(40).make()
                ],
              ),
              80.heightBox,
              CustomButton(
                text: ApplyNow.tr,
                textColor: whiteColor.value,
                backgroundColor: greenColor,
                borderColor: greenColor,
                onPressed: () {
                  Get.to(
                    () => ChatScreen(),
                    transition: Transition.rightToLeft,
                  );
                },
              ).box.height(56).width(context.screenWidth - 40).make(),
            ],
          ),
        ),
      ),
    );
  }
}
