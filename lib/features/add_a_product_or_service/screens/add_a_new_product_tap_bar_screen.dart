import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/constant/const.dart';
import 'package:flutter/cupertino.dart';

class addANewProductTapBarScreen extends StatefulWidget {
  const addANewProductTapBarScreen({super.key});

  @override
  State<addANewProductTapBarScreen> createState() =>
      _addANewProductTapBarScreenState();
}

class _addANewProductTapBarScreenState
    extends State<addANewProductTapBarScreen> {
  bool _switchValue = false;

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
          ListTile(
            title: DoYouWantToActivate.tr.text
                .color(blackColor.value)
                .fontFamily(regular)
                .size(14)
                .make(), // Replace with your desired title
            leading: CupertinoSwitch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ),
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
          SizedBox(
            height: context.screenHeight / 7,
          )
        ],
      ),
    ));
  }
}
