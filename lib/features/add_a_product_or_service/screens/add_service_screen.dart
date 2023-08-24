import 'package:antaji_app/common/widgets/custom_button.dart';

import '../../../constant/const.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key});

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            MyTextField(
                Radius: 24.0,
                hintText: SearchForProducts.tr,
                keyboardType: TextInputType.text,
                maxLines: 1,
                obscureText: false,
                readOnly: false,
                prefixIcon: Icon(
                  Icons.search,
                  color: blackColor.value,
                )),
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
                SvgPicture.asset(
                  editIcon,
                  color: blackColor.value,
                ),
                10.widthBox,
                EditText.tr.text
                    .fontFamily(regular)
                    .size(14)
                    .color(
                      blackColor.value,
                    )
                    .make(),
              ],
            )
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
                    .fontFamily(regular)
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
                    .fontFamily(regular)
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
                  clockImage,
                  color: blackColor.value,
                ),
                10.widthBox,
                'قبل 3 ساعات'
                    .text
                    .fontFamily(regular)
                    .size(12)
                    .color(blackColor.value)
                    .make(),
              ],
            ),
          ],
        ),
        40.heightBox,
        VxDivider(
          color: greyColor,
          type: VxDividerType.horizontal,
          width: 1,
        )
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
