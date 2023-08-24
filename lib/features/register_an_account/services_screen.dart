import 'package:antaji_app/features/register_an_account/job_screen.dart';

import '../../common/widgets/custom_button.dart';
import '../home_page/controller/home_page_controller.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  var controller = Get.put(HomePageController());
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Services.tr.text
                        .fontFamily(bold)
                        .size(24)
                        .color(blackColor.value)
                        .make(),
                    subtitle: DoYourWorkWithCreators.tr.text
                        .fontFamily(medium)
                        .size(14)
                        .color(greyColor)
                        .make(),
                    trailing: SvgPicture.asset(
                      ImagesFilter,
                      color: blackColor.value,
                    ).box.make().onTap(() {
                      showModalBottomSheet(
                        backgroundColor: whiteColor.value,
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        builder: (BuildContext context) {
                          var controller = Get.put(HomePageController());

                          return Container(
                            height: context.screenHeight / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Filter.tr.text
                                      .fontFamily(medium)
                                      .size(14)
                                      .color(blackColor.value)
                                      .make(),
                                  20.heightBox,
                                  AccordingToThePrice.tr.text
                                      .fontFamily(medium)
                                      .size(14)
                                      .color(blackColor.value)
                                      .make(),
                                  Obx(
                                    () => Row(
                                      children: [
                                        '10'
                                            .text
                                            .fontFamily(medium)
                                            .size(12)
                                            .color(blackColor.value)
                                            .make(),
                                        Expanded(
                                          child: Slider(
                                            thumbColor: blackColor.value,
                                            inactiveColor: lightColor.value,
                                            activeColor: greyColor,
                                            min: 10.0,
                                            max: 7000.0,
                                            value: controller.value.value,
                                            onChanged: (value) {
                                              print(value);
                                              setState(() {
                                                controller.value.value = value;
                                              });
                                            },
                                          ),
                                        ),
                                        '7000'
                                            .text
                                            .fontFamily(medium)
                                            .size(12)
                                            .color(blackColor.value)
                                            .make(),
                                      ],
                                    ),
                                  ),
                                  20.heightBox,
                                  features.tr.text
                                      .fontFamily(medium)
                                      .size(14)
                                      .color(blackColor.value)
                                      .make(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: _isChecked1,
                                        activeColor: Colors.green,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _isChecked1 = value!;
                                          });
                                        },
                                      ),
                                      LatestReleases.tr.text
                                          .fontFamily(medium)
                                          .size(14)
                                          .color(blackColor.value)
                                          .make(),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: _isChecked2,
                                        activeColor: Colors.green,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _isChecked2 = value!;
                                          });
                                        },
                                      ),
                                      bestSeller.tr.text
                                          .fontFamily(medium)
                                          .size(14)
                                          .color(blackColor.value)
                                          .make(),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: _isChecked3,
                                        activeColor: Colors.green,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _isChecked3 = value!;
                                          });
                                        },
                                      ),
                                      mostWatched.tr.text
                                          .fontFamily(medium)
                                          .size(14)
                                          .color(blackColor.value)
                                          .make(),
                                    ],
                                  ),
                                  50.heightBox,
                                  CustomButton(
                                    text: Filter.tr,
                                    textColor: whiteColor.value,
                                    backgroundColor: blackColor.value,
                                    borderColor: blackColor.value,
                                    onPressed: () {},
                                  )
                                      .box
                                      .height(56)
                                      .width(context.screenWidth - 40)
                                      .make(),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                  MyTextField(
                      hintText: SearchForAService.tr,
                      Radius: 50.0,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      obscureText: false,
                      readOnly: false,
                      prefixIcon: Icon(
                        Icons.search,
                      )),
                  20.heightBox,
                  Column(
                    children: List.generate(10, (index) {
                      return buildServiceListItem(); // Replace with your service item widget
                    }),
                  ),
                  20.heightBox,
                  //.box.height(context.screenHeight / 1.6).make()
                ],
              ),
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
        'وظيفة مدير التصوير الفوتوغرافي'
            .text
            .fontFamily(bold)
            .size(14)
            .color(blackColor.value)
            .make(),
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
        'يتم تنسيق التاريخ مباشرة مع الموضوع. نصف يوم تصوير. مقابلة شخص واحد سواء في منزلهم أو مكتبهم في مدينة الرياض'
            .text
            .fontFamily(medium)
            .size(12)
            .maxLines(2)
            .lineHeight(2)
            .color(blackColor.value)
            .make(),
        20.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                10.widthBox,
                SvgPicture.asset(
                  clockImage,
                  color: blackColor.value,
                ),
                10.widthBox,
                'قبل 3 ساعات'
                    .text
                    .fontFamily(medium)
                    .size(12)
                    .color(blackColor.value)
                    .make(),
              ],
            ),
          ],
        ),
        30.heightBox,
        VxDivider(
          type: VxDividerType.horizontal,
          color: greyColor,
          width: 1,
          // indent: 10,
          // endIndent: 10,
        ),
      ],
    )
        .box
        .height(context.screenHeight / 3)
        .width(context.screenWidth)
        .padding(EdgeInsets.all(12))
        // .color(greenColor)
        .margin(EdgeInsets.all(8))
        .make()
        .onTap(() {
      Get.to(
        () => jobScreen(),
        transition: Transition.rightToLeft,
      );
    });
  }
}
