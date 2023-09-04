import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/models/business_artists_model.dart';

class FullScreenPicturesScreen extends StatelessWidget {
  final List<ImagesModel> data_images;
  const FullScreenPicturesScreen({super.key, required this.data_images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor.value,
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: Colors.transparent,
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: whiteColor.value,
            child: Icon(
              Icons.close,
              color: blackColor.value,
            ),
          ).box.make().onTap(() {
            Get.back();
          }),
          30.widthBox,
        ],
      ),
      body: PageView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: data_images.length,
        itemBuilder: (context, index) {
          return Image.network(
            '${data_images[index].image}',
            width: context.screenWidth,
            fit: BoxFit.contain,
          ).box.make();
        },
      ).box.height(context.screenHeight).width(context.screenWidth).make(),
    );
  }
}
