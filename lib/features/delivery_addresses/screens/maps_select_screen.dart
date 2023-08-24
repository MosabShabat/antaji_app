import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/constant/const.dart';

class MapsSelectScreen extends StatefulWidget {
  const MapsSelectScreen({super.key});

  @override
  State<MapsSelectScreen> createState() => _MapsSelectScreenState();
}

class _MapsSelectScreenState extends State<MapsSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.screenWidth,
        height: context.screenHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(imageCamSta),
          fit: BoxFit.fill,
        )),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: whiteColor.value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      5.widthBox,
                      Icon(
                        Icons.arrow_back_ios,
                        color: blackColor.value,
                      )
                    ],
                  ),
                ).onTap(() {
                  Get.back();
                }),
                20.heightBox,
                MyTextField(
                  Radius: 24.0,
                  readOnly: false,
                  maxLines: 1,
                  obscureText: false,
                  prefixIcon: Icon(
                    Icons.search,
                    color: blackColor.value,
                  ),
                  keyboardType: TextInputType.name,
                  hintText: FindAPlace.tr,
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      pathIcon,
                      color: blackColor.value,
                      width: context.screenWidth / 18,
                      height: context.screenHeight / 36,
                    )
                        .box
                        .width(context.screenWidth / 10)
                        .height(context.screenHeight / 20)
                        .color(lightColor.value)
                        .alignCenter
                        .withRounded(value: 12)
                        .make(),
                  ],
                ),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    toChoose.tr.text
                        .fontFamily(regular)
                        .size(16)
                        .color(whiteColor.value)
                        .make(),
                  ],
                )
                    .box
                    .height(context.screenHeight / 16)
                    .width(context.screenWidth)
                    .rounded
                    .color(blackColor.value)
                    .make()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
