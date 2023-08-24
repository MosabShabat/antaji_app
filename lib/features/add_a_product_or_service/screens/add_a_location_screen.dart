import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/location_photos_screen.dart';
import '../../../constant/const.dart';

class AddALocationScreen extends StatefulWidget {
  const AddALocationScreen({super.key});

  @override
  State<AddALocationScreen> createState() => _AddALocationScreenState();
}

class _AddALocationScreenState extends State<AddALocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container()
                  .box
                  .height(context.screenHeight / 150)
                  .width(context.screenWidth / 12)
                  .rounded
                  .color(blackColor.value)
                  .make(),
              Container()
                  .box
                  .height(context.screenHeight / 150)
                  .width(context.screenWidth / 12)
                  .rounded
                  .color(lightColor.value)
                  .make(),
            ],
          )
              .box
              .margin(EdgeInsets.symmetric(horizontal: 15))
              .width(context.screenWidth / 5)
              .make()
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Continuation.tr.text
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
        Get.to(
          () => LocationPhotosScreen(),
          transition: Transition.rightToLeft,
        );
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
            AddASite.tr.text
                .fontFamily(bold)
                .size(24)
                .color(blackColor.value)
                .make(),
            20.heightBox,
            WebSiteName.tr.text
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
            thePrice.tr.text
                .fontFamily(regular)
                .size(14)
                .color(blackColor.value)
                .make(),
            10.heightBox,
            EnterToday.tr.text
                .fontFamily(regular)
                .size(14)
                .color(blackColor.value)
                .make(),
            20.heightBox,
            Row(
              children: [
                MyTextField(
                  Radius: 12.0,
                  hintText: theName.tr,
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
                      subTitle: 'كاميرات السينما',
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
