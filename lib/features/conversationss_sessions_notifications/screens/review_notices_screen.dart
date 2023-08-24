import 'package:antaji_app/common/widgets/custom_button.dart';

import '../../../constant/const.dart';

class reviewNoticesScreen extends StatefulWidget {
  const reviewNoticesScreen({super.key});

  @override
  State<reviewNoticesScreen> createState() => _reviewNoticesScreenState();
}

class _reviewNoticesScreenState extends State<reviewNoticesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      bottomNavigationBar: CustomButton(
        text: sendText.tr,
        textColor: whiteColor.value,
        backgroundColor: blackColor.value,
        borderColor: blackColor.value,
        onPressed: () {
          // Get.to(
          //   () => EquipmentRentalScreen(),
          //   transition: Transition.rightToLeft,
          // );
        },
      )
          .box
          .height(100)
          .width(context.screenWidth - 40)
          .padding(EdgeInsets.all(20))
          .make(),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(UserImage),
                  ),
                  10.widthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      'محمد خالد'
                          .text
                          .fontFamily(bold)
                          .size(14)
                          .color(blackColor.value)
                          .make()
                          .box
                          .width(context.screenWidth / 1.4)
                          .make(),
                      'تصوير سينمائي'
                          .text
                          .fontFamily(regular)
                          .size(14)
                          .color(blackColor.value)
                          .make(),
                    ],
                  )
                ],
              ),
              20.heightBox,
              theProduct.tr.text
                  .fontFamily(bold)
                  .size(20)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Row(
                children: [
                  Container(
                    width: context.screenWidth / 2.5,
                    height: context.screenHeight / 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage(imageCamSta), fit: BoxFit.cover),
                    ),
                  ),
                  10.widthBox,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: context.screenWidth / 2.5,
                        height: context.screenHeight / 22,
                        child: 'أساسيات التصوير السينمائي بالكاميرات الاحترافية'
                            .text
                            .maxLines(2)
                            .fontFamily(bold)
                            .size(12)
                            .color(blackColor.value)
                            .make(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          'تأجير ، 6 أيام'
                              .text
                              .fontFamily(regular)
                              .size(14)
                              .color(blackColor.value)
                              .make(),
                        ],
                      )
                          .box
                          .width(context.screenWidth / 4.5)
                          .height(40)
                          .padding(EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ))
                          .withRounded(value: 24)
                          .color(lightColor.value)
                          .make(),
                      '280 ر.س'
                          .text
                          .fontFamily(bold)
                          .size(14)
                          .color(blackColor.value)
                          .make(),
                    ],
                  )
                ],
              )
                  .box
                  .height(context.screenHeight / 6)
                  //.color(greenColor)
                  .margin(EdgeInsets.symmetric(vertical: 12))
                  .make(),
              20.heightBox,
              'أخبرنا كيف كانت تجربتك مع دي جيه أي مافيك 3 سينما بريميوم كومبو'
                  .text
                  .fontFamily(bold)
                  .size(14)
                  .color(blackColor.value)
                  .maxLines(2)
                  .make(),
              20.heightBox,
              MyTextField(
                Radius: 24.0,
                hintText: reviews.tr,
                keyboardType: TextInputType.text,
                maxLines: 10,
                obscureText: false,
                readOnly: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
