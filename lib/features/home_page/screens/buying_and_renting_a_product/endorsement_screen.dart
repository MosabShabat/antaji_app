import 'package:antaji_app/constant/const.dart';

import '../../../../common/widgets/custom_button.dart';
import 'equipment_rental_screen.dart';

class EndorsementScreen extends StatefulWidget {
  const EndorsementScreen({super.key});

  @override
  State<EndorsementScreen> createState() => _EndorsementScreenState();
}

class _EndorsementScreenState extends State<EndorsementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    20.heightBox,
                    AcknowledgmentAndCommitment.tr.text
                        .fontFamily(bold)
                        .size(20)
                        //.color(blackColor.value)
                        .color(blackColor.value)
                        .make(),
                    20.heightBox,
                    ByClickingContinue.tr.text
                        .fontFamily(bold)
                        .size(16)
                        .color(redColor)
                        .make(),
                    20.heightBox,
                    YouRepresentAnd.tr.text
                        .fontFamily(bold)
                        .size(16)
                        .color(blackColor.value)
                        .make(),
                    20.heightBox,
                    TheDeclaration.tr.text
                        .fontFamily(medium)
                        .size(14)
                        .color(blackColor.value)
                        .make(),
                    SizedBox(
                      height: context.screenHeight / 12,
                    ),
                    CustomButton(
                      text: Continuation.tr,
                      textColor: whiteColor.value,
                      backgroundColor: blackColor.value,
                      borderColor: blackColor.value,
                      onPressed: () {
                        Get.to(
                          () => EquipmentRentalScreen(),
                          transition: Transition.rightToLeft,
                        );
                      },
                    )
                        .box
                        .height(100)
                        .width(context.screenWidth - 40)
                        .padding(EdgeInsets.all(20))
                        .make(),
                  ],
                )
                    .box
                    .height(context.screenHeight / 2.5)
                    .width(context.screenWidth)
                    .color(whiteColor.value)
                    .make();
              });
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: blackColor.value, width: 2),
          ),
          primary: blackColor.value,
          minimumSize: Size(context.screenWidth, 50),
        ),
        child: acceptable.tr.text
            .fontFamily(medium)
            .size(16)
            .color(whiteColor.value)
            .make(),
      )
          .box
          .height(80)
          .width(context.screenWidth - 40)
          .padding(EdgeInsets.all(12))
          .make(),
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AcknowledgmentAndCommitment.tr.text
                  .fontFamily(bold)
                  .color(blackColor.value)
                  .size(24)
                  .make(),
              20.heightBox,
              '19/06/2023 8:40 م'
                  .tr
                  .text
                  .fontFamily(medium)
                  .color(greyColor)
                  .size(12)
                  .make(),
              20.heightBox,
              between.tr.text
                  .fontFamily(bold)
                  .color(blackColor.value)
                  .size(20)
                  .make(),
              20.heightBox,
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(UserImage),
                  ),
                  10.widthBox,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'ميلا الزهراني'
                          .tr
                          .text
                          .fontFamily(bold)
                          .color(blackColor.value)
                          .size(12)
                          .make(),
                      'تصوير سينمائي'
                          .tr
                          .text
                          .fontFamily(medium)
                          .color(greyColor)
                          .size(12)
                          .make(),
                    ],
                  )
                ],
              ).box.height(60).make(),
              20.heightBox,
              VxDivider(
                color: greyColor,
                type: VxDividerType.vertical,
                width: 1,
              )
                  .box
                  .height(context.screenHeight / 18)
                  .margin(EdgeInsets.symmetric(horizontal: 30))
                  .make(),
              20.heightBox,
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(UserImage),
                  ),
                  10.widthBox,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'ميلا الزهراني'
                          .tr
                          .text
                          .fontFamily(bold)
                          .color(blackColor.value)
                          .size(12)
                          .make(),
                      'تصوير سينمائي'
                          .tr
                          .text
                          .fontFamily(medium)
                          .color(greyColor)
                          .size(12)
                          .make(),
                    ],
                  )
                ],
              ).box.height(60).make(),
              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      leaseTerm.tr.text
                          .fontFamily(bold)
                          .color(blackColor.value)
                          .size(14)
                          .make(),
                      '10 أيام'
                          .tr
                          .text
                          .fontFamily(bold)
                          .color(blackColor.value)
                          .size(14)
                          .make(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        calendarImage,
                        color: blackColor.value,
                      ),
                      10.widthBox,
                      '${from.tr} 18/06/2023 . ${to.tr} 28/06/2023 '
                          .tr
                          .text
                          .fontFamily(medium)
                          .color(blackColor.value)
                          .size(14)
                          .make(),
                    ],
                  )
                ],
              )
                  .box
                  .height(context.screenHeight / 7)
                  .width(context.screenWidth)
                  .padding(EdgeInsets.symmetric(vertical: 20, horizontal: 12))
                  .rounded
                  .color(lightColor.value)
                  .make(),
              20.heightBox,
              '1- الاستخدام المسموح به للكاميرا والتأكيد على عدم استخدامها في أنشطة غير قانونية'
                  .text
                  .maxLines(2)
                  .color(blackColor.value)
                  .fontFamily(medium)
                  .size(14)
                  .make(),
              20.heightBox,
              20.heightBox,
              '1- الاستخدام المسموح به للكاميرا والتأكيد على عدم استخدامها في أنشطة غير قانونية'
                  .text
                  .maxLines(2)
                  .color(blackColor.value)
                  .fontFamily(medium)
                  .size(14)
                  .make(),
              20.heightBox,
              '1- الاستخدام المسموح به للكاميرا والتأكيد على عدم استخدامها في أنشطة غير قانونية'
                  .text
                  .maxLines(2)
                  .fontFamily(medium)
                  .size(14)
                  .color(blackColor.value)
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
