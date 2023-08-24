import 'package:antaji_app/constant/const.dart';

class serviceOrderScreen extends StatefulWidget {
  const serviceOrderScreen({super.key});

  @override
  State<serviceOrderScreen> createState() => _serviceOrderScreenState();
}

class _serviceOrderScreenState extends State<serviceOrderScreen> {
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
            Column(
              children: List.generate(10, (index) {
                return buildServiceListItem();
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildServiceListItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            'وظيفة مدير التصوير الفوتوغرافي'
                .text
                .fontFamily(bold)
                .size(14)
                .color(blackColor.value)
                .make(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                'قيد الإنتظار'
                    .text
                    .fontFamily(regular)
                    .size(14)
                    .color(blueColor)
                    .make(),
              ],
            )
                .box
                .width(context.screenWidth / 5)
                .height(35)
                .padding(EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ))
                .withRounded(value: 12)
                .color(blueColor.withOpacity(0.2))
                .make(),
          ],
        ),
        10.heightBox,
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
                .width(context.screenWidth / 7)
                .color(lightColor.value)
                .rounded
                .padding(EdgeInsets.all(8))
                .margin(EdgeInsets.only(left: 8))
                .make();
          },
        )
            .box
            .height(context.screenHeight / 20)
            // .width(context.screenWidth)
            .make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              moneysImage,
              color: blackColor.value,
            ),
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
          //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  calendarImage,
                  color: blackColor.value,
                ),
                10.widthBox,
                '${starts.tr}  10/06/2023'
                    .text
                    .fontFamily(medium)
                    .size(12)
                    .color(blackColor.value)
                    .make(),
              ],
            ),
            30.widthBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  LightLocationIcon,
                  color: blackColor.value,
                ),
                10.widthBox,
                'الرياض'
                    .text
                    .fontFamily(medium)
                    .size(12)
                    .color(blackColor.value)
                    .make(),
              ],
            ),
          ],
        ),
      ],
    )
        .box
        .height(context.screenHeight / 4)
        .width(context.screenWidth)
        .make()
        .onTap(() {
      // Get.to(
      //   () => jobScreen(),
      //   transition: Transition.rightToLeft,
      // );
    });
  }
}
