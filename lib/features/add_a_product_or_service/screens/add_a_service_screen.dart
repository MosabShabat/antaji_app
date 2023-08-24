import 'package:antaji_app/common/widgets/custom_button.dart';

import '../../../constant/const.dart';

class AddAServiceScreen extends StatefulWidget {
  const AddAServiceScreen({super.key});

  @override
  State<AddAServiceScreen> createState() => _AddAServiceScreenState();
}

class _AddAServiceScreenState extends State<AddAServiceScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          toPublish.tr.text
              .fontFamily(bold)
              .color(whiteColor.value)
              .size(18)
              .make(),
        ],
      )
          .box
          .height(context.screenHeight / 16)
          .width(context.screenWidth)
          .margin(EdgeInsets.symmetric(vertical: 12, horizontal: 20))
          .color(blackColor.value)
          .rounded
          .make()
          .onTap(() {
        // Get.to(
        //   () => LocationPhotosScreen(),
        //   transition: Transition.rightToLeft,
        // );
      }),
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
          //  physics: BouncingScrollPhysics(),
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            AddAService.tr.text
                .fontFamily(bold)
                .size(24)
                .color(blackColor.value)
                .make(),
            20.heightBox,
            ServiceName.tr.text
                .fontFamily(regular)
                .size(14)
                .color(blackColor.value)
                .make(),
            20.heightBox,
            MyTextField(
              Radius: 12.0,
              hintText: theName.tr,
              keyboardType: TextInputType.text,
              maxLines: 1,
              obscureText: false,
              readOnly: false,
            ),
            20.heightBox,
            Category.tr.text
                .fontFamily(regular)
                .size(14)
                .color(blackColor.value)
                .make(),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Choose.tr.text
                    .fontFamily(regular)
                    .size(14)
                    .color(blackColor.value)
                    .make(),
                SvgPicture.asset(
                  arrowDownIcon,
                  color: blackColor.value,
                  width: 8,
                  height: 8,
                )
              ],
            )
                .box
                .width(context.screenWidth)
                .height(context.screenHeight / 15)
                .rounded
                .padding(EdgeInsets.symmetric(
                  horizontal: 8,
                ))
                .color(lightColor.value)
                .make()
                .onTap(() {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: whiteColor.value,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  builder: (context) {
                    return bottomSheetPersonalFile(
                      title: Category,
                      searchTitle: SearchForARating,
                      subTitle: 'تصوير',
                    );
                  });
            }),
            20.heightBox,
            workingCondition.tr.text
                .fontFamily(regular)
                .size(14)
                .color(blackColor.value)
                .make(),
            20.heightBox,
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  child: Center(
                    child: AddServiceText[index]
                        .tr
                        .text
                        .fontFamily(regular)
                        .size(14)
                        .color(selectedIndex == index
                            ? whiteColor.value
                            : blackColor.value)
                        .make(),
                  ),
                )
                    .box
                    .height(context.screenHeight / 15)
                    .width(context.screenWidth / 3.8)
                    .withRounded(value: 12)
                    .margin(EdgeInsets.symmetric(
                      horizontal: 8,
                    ))
                    .color(selectedIndex == index ? redColor : lightColor.value)
                    .make()
                    .onTap(() {
                  setState(() {
                    selectedIndex = index;
                  });
                });
              },
            )
                .box
                .height(context.screenHeight / 15)
                .width(context.screenWidth)
                // .color(greenColor)
                .make(),
            20.heightBox,
            ServicePrice.tr.text
                .fontFamily(regular)
                .size(14)
                .color(blackColor.value)
                .make(),
            20.heightBox,
            Row(
              children: [
                MyTextField(
                  Radius: 12.0,
                  hintText: EnterThePrice.tr,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  obscureText: false,
                  readOnly: false,
                ).box.width(context.screenWidth / 1.6).make(),
                5.widthBox,
                Container(
                  child: Center(
                    child: RSday.tr.text
                        .fontFamily(regular)
                        .size(12)
                        .color(whiteColor.value)
                        .make(),
                  ),
                )
                    .box
                    .width(context.screenWidth / 3.8)
                    .height(context.screenHeight / 15)
                    .rounded
                    .color(blackColor.value)
                    .make()
              ],
            ).box.width(context.screenWidth).make(),
            20.heightBox,
            DurationOfTheContract.tr.text
                .fontFamily(bold)
                .size(16)
                .color(blackColor.value)
                .make(),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    from.tr.text
                        .fontFamily(regular)
                        .size(14)
                        .color(blackColor.value)
                        .make(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChooseTheDate.tr.text
                            .fontFamily(regular)
                            .size(14)
                            .color(blackColor.value)
                            .make(),
                        SvgPicture.asset(
                          arrowDownIcon,
                          color: blackColor.value,
                          width: 8,
                          height: 8,
                        )
                      ],
                    )
                        .box
                        .height(context.screenHeight / 15)
                        .rounded
                        .padding(EdgeInsets.symmetric(
                          horizontal: 12,
                        ))
                        .color(lightColor.value)
                        .make()
                  ],
                )
                    .box
                    .height(context.screenHeight / 8)
                    .width(context.screenWidth / 2.3)
                    // .color(redColor)
                    .make(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    to.tr.text
                        .fontFamily(regular)
                        .size(14)
                        .color(blackColor.value)
                        .make(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChooseTheDate.tr.text
                            .fontFamily(regular)
                            .size(14)
                            .color(blackColor.value)
                            .make(),
                        SvgPicture.asset(
                          arrowDownIcon,
                          color: blackColor.value,
                          width: 8,
                          height: 8,
                        )
                      ],
                    )
                        .box
                        .height(context.screenHeight / 15)
                        .rounded
                        .padding(EdgeInsets.symmetric(
                          horizontal: 12,
                        ))
                        .color(lightColor.value)
                        .make()
                  ],
                )
                    .box
                    .height(context.screenHeight / 8)
                    .width(context.screenWidth / 2.3)
                    //  .color(redColor)
                    .make()
              ],
            )
                .box
                .height(context.screenHeight / 8)
                .width(context.screenWidth)
                // .color(greenColor)
                .make(),
            20.heightBox,
            CityText.tr.text
                .fontFamily(regular)
                .size(14)
                .color(blackColor.value)
                .make(),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SelectTheCity.tr.text
                    .fontFamily(regular)
                    .size(14)
                    .color(blackColor.value)
                    .make(),
                SvgPicture.asset(
                  arrowDownIcon,
                  color: blackColor.value,
                  width: 8,
                  height: 8,
                )
              ],
            )
                .box
                .width(context.screenWidth)
                .height(context.screenHeight / 15)
                .rounded
                .padding(EdgeInsets.symmetric(
                  horizontal: 8,
                ))
                .color(lightColor.value)
                .make()
                .onTap(() {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: whiteColor.value,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  builder: (context) {
                    return bottomSheetPersonalFile(
                      title: CityText,
                      searchTitle: CitySearch,
                      subTitle: 'الرياض',
                    );
                  });
            }),
            20.heightBox,
            theDetails.tr.text
                .fontFamily(regular)
                .size(14)
                .color(blackColor.value)
                .make(),
            20.heightBox,
            MyTextField(
              Radius: 12.0,
              hintText: theDetails.tr,
              keyboardType: TextInputType.text,
              maxLines: 10,
              obscureText: false,
              readOnly: false,
            ),
            20.heightBox,
            LocationOnTheMap.tr.text
                .fontFamily(regular)
                .size(14)
                .color(blackColor.value)
                .make(),
            20.heightBox,
            Row(
              children: [
                MyTextField(
                  Radius: 12.0,
                  hintText: ChooseTheLocation.tr,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  obscureText: false,
                  readOnly: true,
                ).box.width(context.screenWidth / 1.6).make(),
                5.widthBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      locationAdd,
                      color: whiteColor.value,
                    ),
                    10.widthBox,
                    toChoose.tr.text
                        .fontFamily(regular)
                        .size(12)
                        .color(whiteColor.value)
                        .make(),
                  ],
                )
                    .box
                    .width(context.screenWidth / 3.8)
                    .height(context.screenHeight / 15)
                    .rounded
                    .color(blackColor.value)
                    .make()
              ],
            ).box.width(context.screenWidth).make(),
            40.heightBox,
          ],
        ),
      )),
    );
  }
}
