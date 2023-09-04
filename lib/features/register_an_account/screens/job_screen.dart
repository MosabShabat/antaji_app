import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/features/register_an_account/controller/register_an_account_controller.dart';
import 'package:antaji_app/features/register_an_account/screens/chat_screen.dart';
import '../../../constant/const.dart';

class jobScreen extends StatefulWidget {
  final String uuid;
  final String created;

  const jobScreen({super.key, required this.uuid, required this.created});

  @override
  State<jobScreen> createState() => _jobScreenState();
}

class _jobScreenState extends State<jobScreen> {
  var Ser_controller_var = Get.put(registerAnAccountController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Ser_controller_var.getServicesDetails(widget.uuid);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(Ser_controller_var.is_service_details_loading.value);
    setState(() {});
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(clockImage),
              10.widthBox,
              '${widget.created}'
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
        child: Obx(() {
          if (Ser_controller_var.is_service_details_loading.value) {
            return Center(
              child: CircularProgressIndicator(),
            )
                .box
                .width(context.screenWidth)
                .height(context.screenHeight)
                .make();
          } else if (Ser_controller_var.service_details_var == null) {
            return Center(
              child: Text('No data available'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  '${Ser_controller_var.service_details_var!.name!}'
                      .text
                      .fontFamily(bold)
                      .size(18)
                      .color(blackColor.value)
                      .make(),
                  20.heightBox,
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          '${Ser_controller_var.service_details_var!.categoryName!}'
                              .split(' ')
                              .first
                              .tr
                              .text
                              .fontFamily(regular)
                              .size(12)
                              .color(blackColor.value)
                              .make(),
                        ],
                      )
                          .box
                          .height(context.screenHeight / 20)
                          .width(context.screenWidth / 4.5)
                          .color(lightColor.value)
                          .rounded
                          .padding(EdgeInsets.all(8))
                          .margin(EdgeInsets.only(left: 8))
                          .make(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          '${Ser_controller_var.service_details_var!.workingCondition!}'
                              .text
                              .fontFamily(regular)
                              .size(12)
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
                          .make(),
                      Ser_controller_var.service_details_var!.isNew!
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                '${New}'
                                    .tr
                                    .text
                                    .fontFamily(regular)
                                    .size(14)
                                    .color(blueColor)
                                    .make(),
                              ],
                            )
                              .box
                              .height(context.screenHeight / 20)
                              .width(context.screenWidth / 5)
                              .color(Color(0xFFEBF2FB))
                              .rounded
                              .padding(EdgeInsets.all(8))
                              .margin(EdgeInsets.only(left: 8))
                              .make()
                          : SizedBox(),
                      Ser_controller_var.service_details_var!.isSpecial!
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                '${distinct}'
                                    .tr
                                    .text
                                    .fontFamily(regular)
                                    .size(14)
                                    .color(greenColor)
                                    .make(),
                              ],
                            )
                              .box
                              .height(context.screenHeight / 20)
                              .width(context.screenWidth / 5)
                              .color(Color(0xFFE5F3EE))
                              .rounded
                              .padding(EdgeInsets.all(8))
                              .margin(EdgeInsets.only(left: 8))
                              .make()
                          : SizedBox()
                    ],
                  )
                      .box
                      .height(context.screenHeight / 20)
                      // .width(context.screenWidth)
                      .make(),
                  20.heightBox,
                  Row(
                    children: [
                      '${Ser_controller_var.service_details_var!.price!}  ${Ser_controller_var.service_details_var!.currency!} / '
                          .text
                          .fontFamily(bold)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                      '${Today.tr}'
                          .text
                          .fontFamily(bold)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                    ],
                  ),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(LightLocationIcon),
                      10.widthBox,
                      '${Ser_controller_var.service_details_var!.cityName!}'
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
                          '${starts.tr}  ${Ser_controller_var.service_details_var!.from!} \t\t\t\t\t\t  . ${finish.tr}  ${Ser_controller_var.service_details_var!.to!}'
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
                  '${Ser_controller_var.service_details_var!.details!}'
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
                        backgroundImage: NetworkImage(
                            '${Ser_controller_var.service_details_var!.owner!.image!}'),
                      ),
                      20.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          '${Ser_controller_var.service_details_var!.owner!.name!}'
                              .text
                              .color(blackColor.value)
                              .fontFamily(bold)
                              .size(12)
                              .make(),
                          '${Ser_controller_var.service_details_var!.owner!.productsCount!} ${product.tr}'
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
            );
          }
        }),
      ),
    );
  }
}
