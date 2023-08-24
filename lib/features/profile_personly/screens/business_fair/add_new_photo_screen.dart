import 'package:dotted_border/dotted_border.dart';

import '../../../../constant/const.dart';

class addNewPhotoScreen extends StatefulWidget {
  const addNewPhotoScreen({super.key});

  @override
  State<addNewPhotoScreen> createState() => _addNewPhotoScreenState();
}

class _addNewPhotoScreenState extends State<addNewPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: context.height / 3.5,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return index == 0
                      ? DottedBorder(
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
                        ).box.rounded.make().onTap(() {
                          print('object 2');
                        })
                      : Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  //color: greenColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  image: DecorationImage(
                                    image: AssetImage(imageCamSta),
                                    fit: BoxFit.cover,
                                  )),
                            )
                                .box
                                .height(context.screenHeight / 3)
                                .color(lightColor.value)
                                .roundedSM
                                .make()
                                .onTap(() {
                              // Get.to(
                              //   () => FullScreenPicturesScreen(),
                              //   transition: Transition.rightToLeft,
                              // );
                            }),
                            Positioned(
                                top: 5,
                                left: 5,
                                child: Icon(
                                  Icons.close,
                                  size: 20,
                                  color: whiteColor.value,
                                )
                                    .box
                                    .roundedFull
                                    .color(blackColor.value)
                                    .make()
                                    .onTap(() {}))
                          ],
                        );
                }),
            20.heightBox,
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
            SizedBox(
              height: context.screenHeight / 4,
            )
          ],
        ),
      ),
    );
  }
}
