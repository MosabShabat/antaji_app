import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/add_a_product_or_service/controller/add_controller.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/product_pictures_screen.dart';
import 'package:antaji_app/features/delivery_addresses/screens/maps_select_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

// class Part {
//   String name;
//   String value;

//   Part({required this.name, required this.value});
// }

class addANewProductTapBarScreen extends StatefulWidget {
  final String type;
  const addANewProductTapBarScreen({super.key, required this.type});

  @override
  State<addANewProductTapBarScreen> createState() =>
      _addANewProductTapBarScreenState();
}

class _addANewProductTapBarScreenState
    extends State<addANewProductTapBarScreen> {
  bool _switchValue = false;
  var add_prod_controller = Get.put(AddController());

  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _detController = TextEditingController();

  @override
  void initState() {
    print(widget.type);
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _detController = TextEditingController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await add_prod_controller.getCutData();
      if (add_prod_controller.cat_model_Var.isNotEmpty &&
          selectedIndex != null) {
        await add_prod_controller.getSubCutData(
            url: add_prod_controller.cat_model_Var[selectedIndex!].uuid!);
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _detController.dispose();
    super.dispose();
  }

  // final keyController = TextEditingController();
  // final valueController = TextEditingController();
  var latitude;
  var longitude;

  var cat;
  var subCat;

  int? selectedIndex;
  int? selectedIndexSubCat;

  List<Part> parts = [];

  void addNewPart() {
    setState(() {
      parts.add(Part(
        keyControllers: [TextEditingController()],
        valueControllers: [TextEditingController()],
      ));
    });
  }

  void removePart(int index) {
    if (index >= 0 && index < parts.length) {
      final part = parts[index];

      for (var controller in part.keyControllers) {
        controller.dispose();
      }

      for (var controller in part.valueControllers) {
        controller.dispose();
      }

      setState(() {
        parts.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => add_prod_controller.isDataCatLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
                    controller: _nameController,
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
                        hintText: thePrice.tr,
                        controller: _priceController,
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
                      selectedIndex == null
                          ? Choose.tr.text
                              .fontFamily(regular)
                              .size(14)
                              .color(blackColor.value)
                              .make()
                          : '${add_prod_controller.cat_model_Var[selectedIndex!].nameTranslate!}'
                              .text
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
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                20.heightBox,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    BasicClassification.tr.text
                                        .fontFamily(regular)
                                        .size(14)
                                        .align(TextAlign.start)
                                        .color(blackColor.value)
                                        .make(),
                                  ],
                                ),
                                20.heightBox,
                                MyTextField(
                                  Radius: 24.0,
                                  readOnly: false,
                                  maxLines: 1,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: blackColor.value,
                                  ),
                                  obscureText: false,
                                  keyboardType: TextInputType.text,
                                  hintText: searchByCategories.tr,
                                ),
                                20.heightBox,
                                ListView.builder(
                                  itemCount:
                                      add_prod_controller.cat_model_Var.length,
                                  itemBuilder: (context, index) {
                                    var data = add_prod_controller
                                        .cat_model_Var[index].nameTranslate!;
                                    return Row(
                                      children: [
                                        '${data}'
                                            .text
                                            .fontFamily(regular)
                                            .size(14)
                                            .color(blackColor.value)
                                            .make(),
                                      ],
                                    )
                                        .box
                                        .height(context.screenHeight / 18)
                                        .width(context.screenWidth)
                                        .margin(EdgeInsets.symmetric(
                                          vertical: 8,
                                        ))
                                        // .color(greenColor)
                                        .make()
                                        .onTap(() {
                                      setState(() {
                                        selectedIndex = index;

                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) async {
                                          add_prod_controller.getSubCutData(
                                              url: add_prod_controller
                                                  .cat_model_Var[selectedIndex!]
                                                  .uuid!);
                                        });
                                        print(add_prod_controller
                                            .cat_model_Var[selectedIndex!]
                                            .nameTranslate!);
                                        cat = add_prod_controller
                                            .cat_model_Var[selectedIndex!]
                                            .uuid!;
                                        Get.back();
                                      });
                                    });
                                  },
                                ).box.height(context.screenHeight / 4.5).make()
                              ],
                            )
                                .box
                                .height(context.screenHeight / 2.5)
                                .width(context.screenWidth)
                                .color(whiteColor.value)
                                .make(),
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
                      selectedIndexSubCat == null
                          ? Choose.tr.text
                              .fontFamily(regular)
                              .size(14)
                              .color(blackColor.value)
                              .make()
                          : '${add_prod_controller.sub_cat_model_Var[selectedIndexSubCat!].nameTranslate!}'
                              .text
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
                    add_prod_controller.cat_model_Var.isNotEmpty &&
                            selectedIndex != null
                        ? showModalBottomSheet(
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
                              return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    20.heightBox,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        subcategory.tr.text
                                            .fontFamily(regular)
                                            .size(14)
                                            .align(TextAlign.start)
                                            .color(blackColor.value)
                                            .make(),
                                      ],
                                    ),
                                    20.heightBox,
                                    MyTextField(
                                      Radius: 24.0,
                                      readOnly: false,
                                      maxLines: 1,
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: blackColor.value,
                                      ),
                                      obscureText: false,
                                      keyboardType: TextInputType.text,
                                      hintText: searchByCategories.tr,
                                    ),
                                    20.heightBox,
                                    ListView.builder(
                                      itemCount: add_prod_controller
                                          .sub_cat_model_Var.length,
                                      itemBuilder: (context, index) {
                                        if (add_prod_controller
                                            .sub_cat_model_Var.isEmpty) {
                                          return Column(children: [
                                            Lottie.asset(NoResults),
                                            ThereIsNoDataYet.tr.text
                                                .fontFamily(bold)
                                                .size(20)
                                                .color(blackColor.value)
                                                .make()
                                          ]);
                                        }
                                        var data = add_prod_controller
                                            .sub_cat_model_Var[index]
                                            .nameTranslate!;
                                        return Row(
                                          children: [
                                            '${data}'
                                                .text
                                                .fontFamily(regular)
                                                .size(14)
                                                .color(blackColor.value)
                                                .make(),
                                          ],
                                        )
                                            .box
                                            .height(context.screenHeight / 18)
                                            .width(context.screenWidth)
                                            .margin(EdgeInsets.symmetric(
                                              vertical: 8,
                                            ))
                                            .make()
                                            .onTap(() {
                                          setState(() {
                                            selectedIndexSubCat = index;
                                            print(add_prod_controller
                                                .sub_cat_model_Var[
                                                    selectedIndexSubCat!]
                                                .nameTranslate!);
                                            subCat = add_prod_controller
                                                .sub_cat_model_Var[
                                                    selectedIndexSubCat!]
                                                .uuid!;
                                            Get.back();
                                          });
                                        });
                                      },
                                    )
                                        .box
                                        .height(context.screenHeight / 4.5)
                                        .make()
                                  ],
                                )
                                    .box
                                    .height(context.screenHeight / 2.5)
                                    .width(context.screenWidth)
                                    .color(whiteColor.value)
                                    .make(),
                              );
                            })
                        : Get.snackbar(
                            'Error', 'Please choose the main category');
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
                          .onTap(() async {
                        final result = await Get.to<Map<String, dynamic>>(
                          () => MapsSelectScreen(),
                          transition: Transition.rightToLeft,
                        );

                        if (result != null &&
                            result.containsKey('latitude') &&
                            result.containsKey('longitude')) {
                          latitude = result['latitude'];
                          longitude = result['longitude'];
                        }
                      })
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
                    controller: _detController,
                    obscureText: false,
                    readOnly: false,
                  ),
                  20.heightBox,
                  ListTile(
                    title: DoYouWantToActivate.tr.text
                        .color(blackColor.value)
                        .fontFamily(regular)
                        .size(14)
                        .make(),
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
                  ).onTap(() {
                    addNewPart();
                  }),
                  20.heightBox,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: parts.length,
                    itemBuilder: (context, index) {
                      final part = parts[index];

                      return Column(
                        children: [
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
                                  ).onTap(() {
                                    removePart(index);
                                  }),
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
                          if (part.keyControllers
                              .isNotEmpty) // Check if keyControllers is not empty
                            MyTextField(
                              Radius: 12.0,
                              controller: part.keyControllers[
                                  0], // Access the first element
                              hintText: 'الاسم : مثال الموديل',
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              obscureText: false,
                              readOnly: false,
                            ),
                          20.heightBox,
                          if (part.valueControllers
                              .isNotEmpty) // Check if valueControllers is not empty
                            MyTextField(
                              Radius: 12.0,
                              hintText: 'القيمة : مثال سوني',
                              controller: part.valueControllers[
                                  0], // Access the first element
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              obscureText: false,
                              readOnly: false,
                            ),
                          20.heightBox,
                        ],
                      );
                    },
                  ),
                  20.heightBox,
                  Row(
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
                      .color(blackColor.value)
                      .rounded
                      .make()
                      .onTap(() {
                    List<String> keyText = [];
                    List<String> valueText = [];

                    bool isValidationSuccessful = true; 

                    for (int index = 0; index < parts.length; index++) {
                      final part = parts[index];

                      if (part.keyControllers.isEmpty ||
                          part.valueControllers.isEmpty) {
                        isValidationSuccessful = false;
                        break;     }

                      for (TextEditingController controller
                          in part.keyControllers) {
                        keyText.add(controller.text);
                      }

                      for (TextEditingController controller
                          in part.valueControllers) {
                        valueText.add(controller.text);
                      }
                    }

                    if (_nameController.text.isNotEmpty &&
                        _priceController.text.isNotEmpty &&
                        cat != null &&
                        subCat != null &&
                        latitude != null &&
                        longitude != null &&
                        _detController.text.isNotEmpty &&
                        isValidationSuccessful) {
                      print('All fields are not empty');

                      Get.snackbar(
                        'title',
                        'true',
                        backgroundColor: greenColor,
                      );
                      Get.to(
                        () => ProductPicturesScreen(
                          name: _nameController.text,
                          address: 'Mak',
                          category_uuid: cat,
                          details: _detController.text,
                          lat: '${latitude}',
                          lng: '${longitude}',
                          price: _priceController.text,
                          sub_category_uuid: subCat,
                          type: widget.type,
                          keyText: keyText,
                          valueText: valueText,
                        ),
                        transition: Transition.rightToLeft,
                      );
                    } else {
                      print('Some fields are empty');
                      Get.snackbar(
                        'Message',
                        'Some fields are empty',
                        backgroundColor: redColor,
                      );
                    }
                  }),
                  SizedBox(
                    height: context.screenHeight / 10,
                  )
                ],
              ),
            )),
    );
  }
}

class Part {
  List<TextEditingController> keyControllers;
  List<TextEditingController> valueControllers;

  Part({
    required this.keyControllers,
    required this.valueControllers,
  });
}
