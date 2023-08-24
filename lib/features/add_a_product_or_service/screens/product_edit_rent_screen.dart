import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../constant/const.dart';

class ProductEditRent extends StatefulWidget {
  const ProductEditRent({super.key});

  @override
  State<ProductEditRent> createState() => _ProductEditRentState();
}

class _ProductEditRentState extends State<ProductEditRent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        //  physics: BouncingScrollPhysics(),
        child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.heightBox,
          productName.tr.text
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
                  .width(context.screenWidth / 4.5)
                  .height(context.screenHeight / 15)
                  .rounded
                  .color(blackColor.value)
                  .make()
            ],
          ).box.width(context.screenWidth).make(),
          20.heightBox,
          BasicClassification.tr.text
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
                    title: BasicClassification,
                    searchTitle: SearchForARating,
                    subTitle: 'كاميرات السينما',
                  );
                });
          }),
          20.heightBox,
          subcategory.tr.text
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
                    title: subcategory,
                    searchTitle: SearchForARating,
                    subTitle: 'حزم الصوت',
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
                  .width(context.screenWidth / 4.5)
                  .height(context.screenHeight / 15)
                  .rounded
                  .color(blackColor.value)
                  .make()
            ],
          ).box.width(context.screenWidth).make(),
          20.heightBox,
          AddSpecifications.tr.text
              .fontFamily(bold)
              .size(16)
              .color(blackColor.value)
              .make(),
          20.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
              )
                  .box
                  .width(context.screenWidth / 12)
                  .height(context.screenHeight / 24)
                  .withRounded(value: 12.0)
                  .color(redColor)
                  .make(),
              10.widthBox,
              addNew.tr.text
                  .fontFamily(regular)
                  .size(14)
                  .color(redColor)
                  .make(),
            ],
          ),
          20.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Specifications.tr.text
                  .fontFamily(regular)
                  .size(14)
                  .color(blackColor.value)
                  .make(),
              Row(
                children: [
                  Icon(
                    Icons.close,
                    color: blackColor.value,
                  ),
                  5.widthBox,
                  Removal.tr.text
                      .fontFamily(regular)
                      .size(14)
                      .color(blackColor.value)
                      .make(),
                ],
              ),
            ],
          ),
          20.heightBox,
          MyTextField(
            Radius: 12.0,
            hintText: 'الاسم : مثال الموديل',
            keyboardType: TextInputType.text,
            maxLines: 1,
            obscureText: false,
            readOnly: false,
          ),
          20.heightBox,
          MyTextField(
            Radius: 12.0,
            hintText: 'القيمة : مثال سوني',
            keyboardType: TextInputType.text,
            maxLines: 1,
            obscureText: false,
            readOnly: false,
          ),
          20.heightBox,
          ProductPictures.tr.text
              .fontFamily(bold)
              .color(blackColor.value)
              .size(24)
              .make(),
          20.heightBox,
          GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: context.height / 4.5,
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
          SizedBox(
            height: context.screenHeight / 7,
          )
        ],
      ),
    ));
  }
}
