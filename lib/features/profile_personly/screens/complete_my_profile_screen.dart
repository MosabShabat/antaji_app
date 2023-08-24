import 'package:antaji_app/constant/const.dart';
import 'package:dotted_border/dotted_border.dart';

class CompleteMyProfileScreen extends StatefulWidget {
  const CompleteMyProfileScreen({super.key});

  @override
  State<CompleteMyProfileScreen> createState() =>
      _CompleteMyProfileScreenState();
}

class _CompleteMyProfileScreenState extends State<CompleteMyProfileScreen> {
  late List<String> SpecializationItems;
  String? selectedSpecialization;
  @override
  void initState() {
    SpecializationItems = [];
    super.initState();
  }

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
              CompleteMyProfile.tr.text
                  .fontFamily(bold)
                  .size(24)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Stack(
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
                      .height(context.screenHeight / 4)
                      .width(context.screenWidth)
                      .rounded
                      .make()
                      .onTap(() {
                    print('object 2');
                  }),
                  Positioned(
                      bottom: context.screenHeight / 200,
                      right: context.screenWidth / 2.8,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: lightColor.value,
                        child: SvgPicture.asset(
                          galleryAddIcon,
                          color: blackColor.value,
                        ),
                      ))
                ],
              )
                  .box
                  .height(context.screenHeight / 3.3)
                  .width(context.screenWidth)
                  .rounded
                  .make()
                  .onTap(() {
                print('object');
              }),
              20.heightBox,
              SpecializationGText.tr.text
                  .fontFamily(medium)
                  .size(14)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Container(
                width: context.screenWidth,
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                decoration: BoxDecoration(
                  color: greyColor.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<String>(
                  hint: SpecializationGText.tr.text
                      .color(blackColor.value)
                      .fontFamily((medium))
                      .size(12)
                      .make(),
                  value: selectedSpecialization,
                  items: SpecializationItems.map((city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(
                        city,
                        style: TextStyle(
                          fontFamily: (medium),
                          fontSize: 16,
                          color: blackColor.value,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    // setState(() {
                    //   selectedCity = value;
                    //   final selectedCountryData =
                    //       countriesData.firstWhere(
                    //     (country) => country.name == selectedCountry,
                    //   );

                    //   if (selectedCountryData != null) {
                    //     final selectedCityData =
                    //         selectedCountryData.cities!.firstWhere(
                    //       (city) => city.name == selectedCity,
                    //       orElse: () =>
                    //           countriesCities.Cities(id: 0, name: ''),
                    //     );

                    //     selectedCountryId =
                    //         selectedCityData.id.toString();
                    //     _cityTextController.text = selectedCountryId!;
                    //   } else {
                    //     selectedCountryId = null;
                    //     _cityTextController.text = '';
                    //   }
                    // });
                  },
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  isExpanded: true,
                  underline: SizedBox(),
                ),
              ).onTap(() {
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
                        title: SpecializationGText,
                        searchTitle: SearchForASpecialty,
                        subTitle: 'تصوير',
                      );
                    });
              }),
              20.heightBox,
              Brief.tr.text
                  .fontFamily(medium)
                  .size(14)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  'تجارية إلى غير هادفة للربح ، سرد للوثيقة ، لقد صورت الكثير للعلامات التجارية التي تبيع بورش إلى شركة Teen Vogue  أود مساعدتك في التقاط رؤيتك.'
                      .text
                      .fontFamily(regular)
                      .size(14)
                      .lineHeight(2)
                      .color(blackColor.value)
                      .make()
                ],
              )
                  .box
                  .height(context.screenHeight / 6)
                  .width(context.screenWidth)
                  .rounded
                  .padding(EdgeInsets.all(20))
                  .color(lightColor.value)
                  .make(),
              20.heightBox,
              skillsText.tr.text
                  .fontFamily(medium)
                  .size(14)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  research.tr.text
                      .fontFamily(regular)
                      .size(14)
                      .color(blackColor.value)
                      .make()
                ],
              )
                  .box
                  .height(context.screenHeight / 18)
                  .width(context.screenWidth)
                  .padding(EdgeInsets.symmetric(
                    horizontal: 12,
                  ))
                  .rounded
                  .color(lightColor.value)
                  .make()
                  // MyTextField(
                  //   Radius: 10.0,
                  //   readOnly: true,
                  //   maxLines: 1,
                  //   obscureText: false,
                  //   keyboardType: TextInputType.emailAddress,
                  //   hintText: research.tr,
                  // )
                  .box
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
                        title: skillsText,
                        searchTitle: SearchForSkills,
                        subTitle: 'مصور سينمائي',
                      );
                    });
              }),
              20.heightBox,
              GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: context.height / 18,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 4,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      'مصور سينمائي'
                          .text
                          .fontFamily(regular)
                          .size(12)
                          .color(whiteColor.value)
                          .make(),
                      5.widthBox,
                      Icon(
                        Icons.close,
                        size: 18,
                        color: whiteColor.value,
                      )
                    ],
                  )
                      .box
                      .height(context.screenHeight / 18)
                      .width(context.screenWidth / 3)
                      .withRounded(
                        value: 24,
                      )
                      .padding(EdgeInsets.all(4))
                      .color(blackColor.value)
                      .make();
                },
              ),
              20.heightBox,
              IntroductoryVideo.tr.text
                  .fontFamily(regular)
                  .size(16)
                  .color(blackColor.value)
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
                      Icon(
                        Icons.add,
                        color: blackColor.value,
                      ).box.border(color: blackColor.value).roundedFull.make(),
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
                  .height(context.screenHeight / 4)
                  .width(context.screenWidth)
                  .rounded
                  .make()
                  .onTap(() {
                print('object 2');
              }),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        LightLocationIcon,
                        color: blackColor.value,
                      ),
                      10.widthBox,
                      'الرياض ، شارع الملك عبدالله'
                          .text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                    ],
                  )
                      .box
                      .height(context.screenHeight / 15)
                      .width(context.screenWidth / 1.5)
                      .color(lightColor.value)
                      .padding(EdgeInsets.symmetric(
                        horizontal: 8,
                      ))
                      .rounded
                      .make()
                      .onTap(() {}),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        locationAdd,
                        color: whiteColor.value,
                      ),
                      5.widthBox,
                      toChoose.tr.text
                          .fontFamily(regular)
                          .size(12)
                          .color(whiteColor.value)
                          .make(),
                    ],
                  )
                      .box
                      .height(context.screenHeight / 15)
                      .rounded
                      .width(context.screenWidth / 4.5)
                      .color(blackColor.value)
                      .make()
                ],
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  saveText.tr.text
                      .fontFamily(regular)
                      .size(16)
                      .color(whiteColor.value)
                      .make(),
                ],
              )
                  .box
                  .height(context.screenHeight / 15)
                  .rounded
                  .width(context.screenWidth)
                  .color(blackColor.value)
                  .make()
                  .onTap(() {})
            ],
          ),
        ),
      ),
    );
  }
}
