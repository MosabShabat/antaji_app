import '../../../../common/widgets/custom_button.dart';
import '../../../constant/const.dart';

class DeleteMyAccountScreen extends StatelessWidget {
  const DeleteMyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DeleteMyAccount.tr.text
              .fontFamily(bold)
              .size(18)
              .color(Colors.white)
              .make()
        ],
      )
          .box
          .height(context.screenHeight / 18)
          .width(context.screenWidth)
          .color(redColor)
          .rounded
          .margin(EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ))
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
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DeleteMyAccount.tr.text
                            .fontFamily(regular)
                            .size(14)
                            .align(TextAlign.start)
                            .color(blackColor.value)
                            .make(),
                      ],
                    ),
                    20.heightBox,
                    AreYouSureTo.tr.text
                        .fontFamily(bold)
                        .size(20)
                        .color(blackColor.value)
                        .make(),
                    20.heightBox,
                    ThisStepCannotBeUndone.tr.text
                        .fontFamily(regular)
                        .size(14)
                        .color(blackColor.value)
                        .make(),
                    20.heightBox,
                    CustomButton(
                      text: YesDeleteMyAccount.tr,
                      textColor: whiteColor.value,
                      backgroundColor: redColor,
                      borderColor: redColor,
                      onPressed: () {
                        // Get.off(
                        //   () => orderProductsScreen(),
                        //   transition: Transition.rightToLeft,
                        // );
                      },
                    )
                        .box
                        .height(100)
                        .width(context.screenWidth - 40)
                        .padding(EdgeInsets.all(20))
                        .make(),
                    CustomButton(
                      text: no.tr,
                      textColor: blackColor.value,
                      backgroundColor: lightColor.value,
                      borderColor: lightColor.value,
                      onPressed: () {
                        Get.back();
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
                    .make(),
              );
            });
      }),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DeleteMyAccount.tr.text
                .fontFamily(bold)
                .color(blackColor.value)
                .size(30)
                .make(),
            10.heightBox,
            WhatWillYouLose.tr.text
                .fontFamily(bold)
                .color(blackColor.value)
                .size(20)
                .make(),
            10.heightBox,
            MyAccount.tr.text
                .fontFamily(medium)
                .color(Colors.grey)
                .size(16)
                .make(),
            10.heightBox,
            purchaseHistory.tr.text
                .fontFamily(medium)
                .color(Colors.grey)
                .size(16)
                .make(),
            10.heightBox,
            TheRightToAccess.tr.text
                .fontFamily(medium)
                .color(Colors.grey)
                .size(16)
                .make(),
            10.heightBox,
            ThisTextIsAnExample.tr.text
                .fontFamily(medium)
                .color(Colors.grey)
                .size(16)
                .make(),
            10.heightBox,
            Container()
          ],
        ),
      ),
    );
  }
}
