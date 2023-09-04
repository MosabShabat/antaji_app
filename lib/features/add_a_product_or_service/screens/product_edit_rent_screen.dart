import 'dart:io';

import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/features/add_a_product_or_service/controller/add_controller.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/add_a_new_product_tap_bar_screen.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/add_screen.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/add_successfully_screen.dart';
import 'package:antaji_app/features/auth/controller/auth_getx_controller.dart';
import 'package:antaji_app/features/delivery_addresses/screens/maps_select_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../../../constant/const.dart';

class ProductEditRent extends StatefulWidget {
  final String uuid;
  final String type;
  const ProductEditRent({super.key, required this.uuid, required this.type});

  @override
  State<ProductEditRent> createState() => _ProductEditRentState();
}

class _ProductEditRentState extends State<ProductEditRent> {
  var add_controller = Get.put(AddController());

  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _detController = TextEditingController();
  var add_prod_controller = Get.put(AddController());
  int? selectedIndex;
  int? selectedIndexSubCat;
  var autController = Get.put(AuthGetxController());
  List<File> selectedImages = []; 
  final picker = ImagePicker();

  Future<void> _pickImages() async {
    final pickedImages = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedImages != null) {
      setState(() {
        selectedImages.add(File(pickedImages.path));
      });
    }
  }

  List<String> keyText = [];
  List<String> valueText = [];
  Widget _buildSelectedImages() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: context.screenHeight / 3.5,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: selectedImages.isEmpty ? 1 : selectedImages.length + 1,
      itemBuilder: (context, index) {
        var imageFile;
        // = selectedImages[index];
        index == 0 ? "" : imageFile = selectedImages[index - 1];

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
              ).box.rounded.padding(const EdgeInsets.all(8.0)).make().onTap(() {
                _pickImages();
              })
            : Container(
                width: context.screenWidth / 2.2,
                height: context.screenHeight / 3.5,
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: FileImage(imageFile), fit: BoxFit.fill)),
                child: Stack(
                  children: [
                    Positioned(
                      top: 5,
                      left: 5,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedImages.removeAt(index);
                          });
                        },
                        child: Icon(
                          Icons.close,
                          size: 20,
                          color: whiteColor.value,
                        ).box.roundedFull.color(blackColor.value).make(),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  @override
  void initState() {
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _detController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await add_controller.getEditProduct(widget.uuid);
      await add_prod_controller.getCutData();
      if (add_prod_controller.cat_model_Var.isNotEmpty &&
          selectedIndex != null) {
        await add_prod_controller.getSubCutData(
            url: add_prod_controller.cat_model_Var[selectedIndex!].uuid!);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _detController.dispose();
    super.dispose();
  }

  var latitude;
  var longitude;

  var cat;
  var subCat;
  List<Part> parts = [];
  bool isTabNew = false;
  bool isTabNewImages = false;
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
      () => add_controller.isDataEditProductLoading.value &&
              add_prod_controller.isDataCatLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : add_controller.edit_product_model_var == null
              ? Center(
                  child: ThereIsNoDataYet.tr.text
                      .fontFamily(bold)
                      .size(20)
                      .color(blackColor.value)
                      .make(),
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
                        hintText:
                            '${add_controller.edit_product_model_var!.item!.name!}',
                        controller: _nameController,
                        // initialValue:
                        //     '${add_controller.edit_product_model_var!.item!.name!}',
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
                            hintText:
                                '${add_controller.edit_product_model_var!.item!.price!}',
                            keyboardType: TextInputType.text,
                            // initialValue:
                            //     '${add_controller.edit_product_model_var!.item!.price!}',
                            controller: _priceController,
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
                          (selectedIndex == null
                                  ? '${add_controller.edit_product_model_var!.item!.categoryName!}'
                                  : '${add_prod_controller.cat_model_Var[selectedIndex!].nameTranslate!}')
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                      itemCount: add_prod_controller
                                          .cat_model_Var.length,
                                      itemBuilder: (context, index) {
                                        var data = add_prod_controller
                                            .cat_model_Var[index]
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
                                            // .color(greenColor)
                                            .make()
                                            .onTap(() {
                                          setState(() {
                                            selectedIndex = index;

                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (_) async {
                                              add_prod_controller.getSubCutData(
                                                  url: add_prod_controller
                                                      .cat_model_Var[
                                                          selectedIndex!]
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
                          (selectedIndexSubCat == null
                                  ? '${add_controller.edit_product_model_var!.item!.subCategoryName!}'
                                  : '${add_prod_controller.sub_cat_model_Var[selectedIndexSubCat!].nameTranslate!}')
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                .height(
                                                    context.screenHeight / 18)
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
                      theDetails.tr.text
                          .fontFamily(regular)
                          .size(14)
                          .color(blackColor.value)
                          .make(),
                      20.heightBox,
                      MyTextField(
                        Radius: 12.0,
                        controller: _detController,
                        hintText:
                            '${add_controller.edit_product_model_var!.item!.details!}',
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
                        setState(() {
                          isTabNew = true;
                        });
                        addNewPart();
                      }),
                      20.heightBox,
                      isTabNew == false
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: add_controller.edit_product_model_var!
                                  .item!.specifications!.length,
                              itemBuilder: (context, index) {
                                var spc_data = add_controller
                                    .edit_product_model_var!
                                    .item!
                                    .specifications![index];

                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                    MyTextField(
                                      Radius: 12.0,
                                      hintText: '${spc_data.key!}',
                                      //  controller: part.keyControllers[0],
                                      keyboardType: TextInputType.text,
                                      maxLines: 1,
                                      obscureText: false,
                                      readOnly: false,
                                    ),
                                    20.heightBox,
                                    MyTextField(
                                      Radius: 12.0,
                                      hintText: '${spc_data.value!}',
                                      keyboardType: TextInputType.text,
                                      maxLines: 1,
                                      obscureText: false,
                                      readOnly: false,
                                    ),
                                    20.heightBox,
                                  ],
                                );
                              },
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: parts.length,
                              itemBuilder: (context, index) {
                                final part = parts[index];

                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                      isTabNewImages == false
                          ? ClickToEditPhotos.tr.text
                              .fontFamily(bold)
                              .size(18)
                              .color(redColor)
                              .make()
                              .onTap(() {
                              setState(() {
                                isTabNewImages = true;
                              });
                            })
                          : ''.text.make(),
                      20.heightBox,
                      isTabNewImages
                          ? _buildSelectedImages()
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: context.screenHeight / 3.5,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                              ),
                              itemCount: add_controller
                                  .edit_product_model_var!.item!.images!.length,
                              itemBuilder: (context, index) {
                                var img_data = add_controller
                                    .edit_product_model_var!
                                    .item!
                                    .images![index];
                                return Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                '${img_data.attachment!}'),
                                            fit: BoxFit.cover,
                                          )),
                                    )
                                        .box
                                        .height(context.screenHeight / 3)
                                        .color(lightColor.value)
                                        .roundedSM
                                        .make()
                                    
                            ],
                                );
                              }),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              saveText.tr.text
                                  .fontFamily(regular)
                                  .size(14)
                                  .color(whiteColor.value)
                                  .make(),
                            ],
                          )
                              .box
                              .rounded
                              .color(blackColor.value)
                              .height(context.screenHeight / 8)
                              .width(context.screenWidth / 2.5)
                              .make()
                              .onTap(() {
                            _performEdProd();
                          }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              deleteText.tr.text
                                  .fontFamily(regular)
                                  .size(14)
                                  .color(whiteColor.value)
                                  .make(),
                            ],
                          )
                              .box
                              .height(context.screenHeight / 15)
                              .width(context.screenWidth / 2.5)
                              .rounded
                              // .padding(EdgeInsets.symmetric(
                              //   horizontal: 12,
                              // ))
                              .color(redColor)
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        20.heightBox,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            DeleteTheProduct.tr.text
                                                .fontFamily(regular)
                                                .size(14)
                                                .align(TextAlign.start)
                                                .color(blackColor.value)
                                                .make(),
                                          ],
                                        ),
                                        20.heightBox,
                                        DoYouWantToDeleteTheProduct.tr.text
                                            .fontFamily(bold)
                                            .size(20)
                                            .color(blackColor.value)
                                            .make(),
                                        20.heightBox,
                                        ThisStepCannotBeUndone.tr.text
                                            .fontFamily(regular)
                                            .size(14)
                                            .color(blackColor.value)
                                            .make(),
                                        20.heightBox,
                                        CustomButton(
                                          text: YesDelete.tr,
                                          textColor: whiteColor.value,
                                          backgroundColor: redColor,
                                          borderColor: redColor,
                                          onPressed: () {
                                            DeleteProd();
                                          },
                                        )
                                            .box
                                            .height(100)
                                            .width(context.screenWidth - 40)
                                            .padding(EdgeInsets.all(20))
                                            .make(),
                                        CustomButton(
                                          text: no.tr,
                                          textColor: blackColor.value,
                                          backgroundColor: lightColor.value,
                                          borderColor: lightColor.value,
                                          onPressed: () {
                                            Get.back();
                                          },
                                        )
                                            .box
                                            .height(100)
                                            .width(context.screenWidth - 40)
                                            .padding(EdgeInsets.all(20))
                                            .make(),
                                      ],
                                    )
                                        .box
                                        .height(context.screenHeight / 2.5)
                                        .width(context.screenWidth)
                                        .color(whiteColor.value)
                                        .make(),
                                  );
                                });
                          })
                        ],
                      )
                          .box
                          .height(context.screenHeight / 16)
                          .width(context.screenWidth)
                          // .margin(EdgeInsets.symmetric(vertical: 12, horizontal: 20))
                          .make(),
                      SizedBox(
                        height: context.screenHeight / 10,
                      )
                    ],
                  ),
                )),
    );
  }

  Future<void> _performEdProd() async {
    print('============== here we go =============');

    if (_checkData()) {
      await _EdProf();
    }
  }

  bool _checkData() {
    bool isValidationSuccessful = true;

    for (int index = 0; index < parts.length; index++) {
      final part = parts[index];

      if (part.keyControllers.isEmpty || part.valueControllers.isEmpty) {
        isValidationSuccessful = false;
        break;
      }

      for (TextEditingController controller in part.keyControllers) {
        keyText.add(controller.text);
      }

      for (TextEditingController controller in part.valueControllers) {
        valueText.add(controller.text);
      }
    }
    print('<<<<<<<<<<<<<<<<<<<object>>>>>>>>>>>>>>>>>>>');
    print(widget.uuid);
    print(_nameController.text);
    print(_priceController.text);
    print(_detController.text);
    print(cat);
    print(subCat);
    print(latitude);
    print(longitude);
    print(selectedImages.length);
    print(isValidationSuccessful);
    print('<<<<<<<<<<<<<<<<<<<object>>>>>>>>>>>>>>>>>>>');

    if (_nameController.text.isNotEmpty &&
        _priceController.text.isNotEmpty &&
        _detController.text.isNotEmpty &&
        cat != null &&
        subCat != null &&
        latitude != null &&
        longitude != null &&
        selectedImages.isNotEmpty &&
        isValidationSuccessful) {
      print('All fields are not empty');

      Get.snackbar(
        'title',
        'true',
        backgroundColor: greenColor,
      );
      return true;
    } else {
      print('Some fields are empty');
      Get.snackbar(
        'Message',
        'Some fields are empty',
        backgroundColor: redColor,
      );
      return false;
    }
  }

  Future<void> _EdProf() async {
    final response = await autController.Edit_prod(
      url: widget.uuid,
      name: _nameController.text,
      address: 'Mak',
      category_uuid: cat,
      details: _detController.text,
      lat: '${latitude}',
      lng: '${longitude}',
      price: _priceController.text,
      sub_category_uuid: subCat,
      type: widget.type,
      image: selectedImages,
      keys: keyText,
      values: valueText,
    );

    if (response.status!) {
      VxToast.show(context, msg: 'Edit Product Successfully');
      Get.off(
        () => addSuccessfullyScreen(
          type: 'products',
          uuid: widget.uuid,
        ),
        transition: Transition.rightToLeft,
      );
    }
    print(response.message);

    Get.snackbar(
      "message",
      response.message!,
      backgroundColor: response.status! ? Colors.green : Colors.red,
      colorText: Colors.white,
    );
  }

  Future<void> DeleteProd() async {
    final response = await add_prod_controller.deleteProduct(uuid: widget.uuid);
    if (response.status!) {
      VxToast.show(context, msg: 'Edit Product Successfully');
      Get.off(
        () => AddScreen(),
        transition: Transition.rightToLeft,
      );
    }
    print(response.message);

    Get.snackbar(
      "message",
      response.message!,
      backgroundColor: response.status! ? Colors.green : Colors.red,
      colorText: Colors.white,
    );
  }
  //deleteProduct
}
