import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../../constant/const.dart';

class addNewVideo extends StatefulWidget {
  const addNewVideo({super.key});

  @override
  State<addNewVideo> createState() => _addNewVideoState();
}

class _addNewVideoState extends State<addNewVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DottedBorder(
              color: greyColor,
              radius: Radius.circular(10),
              borderType: BorderType.RRect,
              strokeWidth: 1,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: blackColor.value,
                    ).box.border(color: blackColor.value).roundedFull.make(),
                    10.heightBox,
                    addVideo.tr.text
                        .fontFamily(regular)
                        .size(12)
                        .color(blackColor.value)
                        .make(),
                  ],
                ),
              ),
            )
                .box
                .height(context.screenHeight / 5)
                .width(context.screenWidth)
                .rounded
                .make(),
            20.heightBox,
            DottedBorder(
              color: greyColor,
              radius: Radius.circular(10),
              borderType: BorderType.RRect,
              strokeWidth: 1,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      galleryAddIcon,
                      color: blackColor.value,
                    ),
                    10.heightBox,
                    AddACoverPhoto.tr.text
                        .fontFamily(regular)
                        .size(12)
                        .color(blackColor.value)
                        .make(),
                  ],
                ),
              ),
            )
                .box
                .height(context.screenHeight / 5)
                .width(context.screenWidth)
                .rounded
                .make(),
            20.heightBox,
            videoAddress.tr.text
                .fontFamily(regular)
                .size(12)
                .color(blackColor.value)
                .make(),
            20.heightBox,
            MyTextField(
              Radius: 12.0,
              hintText: EnterTheTitle.tr,
              keyboardType: TextInputType.text,
              maxLines: 1,
              obscureText: false,
              readOnly: false,
            ),
            40.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                saveText.tr.text
                    .fontFamily(bold)
                    .size(18)
                    .color(whiteColor.value)
                    .make()
              ],
            )
                .box
                .width(context.screenWidth)
                .height(context.screenHeight / 18)
                .color(blackColor.value)
                .rounded
                .make(),
            20.heightBox,
          ],
        ),
      )),
    );
  }
}
