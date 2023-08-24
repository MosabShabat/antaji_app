import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../constant/const.dart';

class ConnectWithUsScreen extends StatefulWidget {
  const ConnectWithUsScreen({super.key});

  @override
  State<ConnectWithUsScreen> createState() => _ConnectWithUsScreenState();
}

class _ConnectWithUsScreenState extends State<ConnectWithUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConnectWithUs.tr.text
                  .color(blackColor.value)
                  .fontFamily(bold)
                  .size(24)
                  .make(),
              20.heightBox,
              FullName.tr.text
                  .color(blackColor.value)
                  .fontFamily(regular)
                  .size(14)
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
              Email.tr.text
                  .color(blackColor.value)
                  .fontFamily(regular)
                  .size(14)
                  .make(),
              20.heightBox,
              MyTextField(
                Radius: 12.0,
                hintText: Email.tr,
                keyboardType: TextInputType.text,
                maxLines: 1,
                obscureText: false,
                readOnly: false,
              ),
              20.heightBox,
              theMessage.tr.text
                  .color(blackColor.value)
                  .fontFamily(regular)
                  .size(14)
                  .make(),
              20.heightBox,
              MyTextField(
                Radius: 12.0,
                hintText: theMessage.tr,
                keyboardType: TextInputType.text,
                maxLines: 10,
                obscureText: false,
                readOnly: false,
              ),
              20.heightBox,
              '${attachments.tr}  (${myChoice.tr})'
                  .text
                  .color(blackColor.value)
                  .fontFamily(regular)
                  .size(14)
                  .make(),
              20.heightBox,
              DottedBorder(
                color: greyColor,
                radius: Radius.circular(10),
                borderType: BorderType.RRect,
                strokeWidth: 1.5,
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
                      AddPhotos.tr.text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                    ],
                  ),
                ),
              )
                  .box
                  .rounded
                  .height(context.screenHeight / 7)
                  .width(context.screenWidth / 4)
                  .make()
                  .onTap(() {
                print('object 2');
              }),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sendText.tr.text
                      .size(16)
                      .fontFamily(regular)
                      .color(whiteColor.value)
                      .make(),
                ],
              )
                  .box
                  .width(context.screenWidth)
                  .height(context.screenHeight / 16)
                  .color(blackColor.value)
                  .rounded
                  .make()
                  .onTap(() {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 2),
                    backgroundColor: whiteColor.value,
                    dismissDirection: DismissDirection.horizontal,
                    content: Column(
                      children: [
                        VxDivider(
                          width: 3,
                          color: greenColor,
                        ).box.width(context.screenWidth).make(),
                        ListTile(
                          leading: CircleAvatar(
                            radius: 15,
                            backgroundColor: blackColor.value,
                            child: Center(
                              child: Icon(
                                Icons.done,
                                color: whiteColor.value,
                              ),
                            ),
                          ),
                          title: YourMessageWasSentSuccessfully.tr.text
                              .fontFamily(regular)
                              .color(blackColor.value)
                              .size(14)
                              .make(),
                        )
                            .box
                            .width(context.screenWidth)
                            .height(context.screenHeight / 18)
                            .color(whiteColor.value)
                            .make(),
                      ],
                    )));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
