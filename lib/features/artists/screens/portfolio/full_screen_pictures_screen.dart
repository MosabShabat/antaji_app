import 'package:antaji_app/constant/const.dart';

class FullScreenPicturesScreen extends StatelessWidget {
  const FullScreenPicturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor.value ,
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: Colors.transparent,
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: whiteColor.value ,
            child: Icon(
              Icons.close,
              color: blackColor.value ,
            ),
          ).box.make().onTap(() {
            Get.back();
          }),
          30.widthBox,
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Image.asset(
            imageCamSta,
            width: context.screenWidth,
            fit: BoxFit.contain,
          ).box.make();
        },
      ).box.height(context.screenHeight).width(context.screenWidth).make(),
    );
  }
}
