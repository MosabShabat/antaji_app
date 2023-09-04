import 'dart:io';

import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/features/add_a_product_or_service/controller/add_controller.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/add_screen.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/add_successfully_screen.dart';
import 'package:antaji_app/features/auth/controller/auth_getx_controller.dart';
import 'package:antaji_app/features/delivery_addresses/screens/maps_select_screen.dart';
import 'package:antaji_app/models/edit_location_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

import '../../home_page/controller/home_page_controller.dart';

class EditLocationScreen extends StatefulWidget {
  final String uuid;

  const EditLocationScreen({super.key, required this.uuid});

  @override
  State<EditLocationScreen> createState() => _EditLocationScreenState();
}

class _EditLocationScreenState extends State<EditLocationScreen> {
  var add_controller = Get.put(AddController());
  var autController = Get.put(AuthGetxController());
  var add_prod_controller = Get.put(AddController());

  TextEditingController _searchController = TextEditingController();
  TextEditingController? _nameController;
  TextEditingController? _priceController;
  TextEditingController? _detController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await add_controller.getEditLocation(widget.uuid);
    });

    setState(() {
      selectedImages.clear();
    });

    _searchController = TextEditingController();

    super.initState();
  }

  List<String> selectedItems = [];

  RxBool isSearch = false.obs;

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  var selectedImages = [];
  final picker = ImagePicker();

  Future<void> _pickImages() async {
    final pickedImages = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedImages != null) {
      setState(() {
        selectedImages.add(File(pickedImages.path)); // Add File directly
      });
    }
  }

  int? selectedIndex;
  var latitude;
  var longitude;
  @override
  Widget build(BuildContext context) {
    //   selectedImages.clear();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container()
                  .box
                  .height(context.screenHeight / 150)
                  .width(context.screenWidth / 12)
                  .rounded
                  .color(blackColor.value)
                  .make(),
              Container()
                  .box
                  .height(context.screenHeight / 150)
                  .width(context.screenWidth / 12)
                  .rounded
                  .color(lightColor.value)
                  .make(),
            ],
          )
              .box
              .margin(EdgeInsets.symmetric(horizontal: 15))
              .width(context.screenWidth / 5)
              .make()
        ],
      ),
      bottomNavigationBar: Row(
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
            _performEdLoc();
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        20.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
          .margin(EdgeInsets.symmetric(vertical: 12, horizontal: 20))
          .make(),
      backgroundColor: whiteColor.value,
      body: Obx(() {
        if (add_controller.isDataEditLocationLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (add_controller.edit_location_model_var == null) {
          return Center(
            child: ThereIsNoDataYet.tr.text
                .fontFamily(bold)
                .size(20)
                .color(blackColor.value)
                .make(),
          );
        } else {
          for (var i = 0;
              i < add_controller.edit_location_model_var!.item!.images!.length;
              i++) {
            selectedImages.add(add_controller
                .edit_location_model_var!.item!.images![i].attachment!);
          }
          // selectedImages =
          //     add_controller.edit_location_model_var!.item!.images!;
          return SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.heightBox,
                ModifyTheSite.tr.text
                    .fontFamily(bold)
                    .size(24)
                    .color(blackColor.value)
                    .make(),
                20.heightBox,
                WebSiteName.tr.text
                    .fontFamily(regular)
                    .size(14)
                    .color(blackColor.value)
                    .make(),
                20.heightBox,
                MyTextField(
                  Radius: 12.0,
                  controller: _nameController = TextEditingController(
                      text:
                          '${add_controller.edit_location_model_var!.item!.name!}'),
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
                      controller: _priceController = TextEditingController(
                          text:
                              '${add_controller.edit_location_model_var!.item!.price!}'),
                      keyboardType: TextInputType.number,
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
                        .width(context.screenWidth / 3.8)
                        .height(context.screenHeight / 15)
                        .rounded
                        .color(blackColor.value)
                        .make()
                  ],
                ).box.width(context.screenWidth).make(),
                20.heightBox,
                Category.tr.text
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
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: StatefulBuilder(
                            builder: (context, setState) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  20.heightBox,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Category.tr.text
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
                                    onSubmitted: (value) {
                                      setState(() {
                                        isSearch.value = !isSearch.value;
                                      });
                                    },
                                    maxLines: 1,
                                    controller: _searchController,
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: blackColor.value,
                                    ),
                                    obscureText: false,
                                    keyboardType: TextInputType.text,
                                    hintText: searchByCategories.tr,
                                  ),
                                  20.heightBox,
                                  FutureBuilder(
                                    future: isSearch.value
                                        ? add_controller.getCutLocationData(
                                            url:
                                                '?name=${_searchController.text}')
                                        : add_controller.getCutLocationData(
                                            url: ''),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else if (snapshot.connectionState ==
                                              ConnectionState.done &&
                                          snapshot.data != null &&
                                          snapshot.data!.isNotEmpty) {
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          physics: BouncingScrollPhysics(),
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (context, index) {
                                            var data = snapshot.data![index];
                                            bool isSelected = selectedItems
                                                .contains(data.uuid);

                                            return CheckboxListTile(
                                              activeColor: greenColor,
                                              title: '${data.nameTranslate}'
                                                  .text
                                                  .fontFamily(regular)
                                                  .size(14)
                                                  .color(blackColor.value)
                                                  .make(),
                                              value: isSelected,
                                              onChanged: (bool? newValue) {
                                                setState(() {
                                                  if (newValue != null) {
                                                    if (newValue) {
                                                      selectedItems
                                                          .add(data.uuid);
                                                    } else {
                                                      selectedItems
                                                          .remove(data.uuid);
                                                    }
                                                  }
                                                });
                                              },
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
                                                selectedIndex = index;

                                                Get.back();
                                              });
                                            });
                                          },
                                        )
                                            .box
                                            .height(context.screenHeight / 4.5)
                                            .make();
                                      } else {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ThereIsNoDataYet.tr.text
                                                .fontFamily(bold)
                                                .size(20)
                                                .color(blackColor.value)
                                                .make(),
                                          ],
                                        )
                                            .box
                                            .width(context.screenWidth)
                                            .height(context.screenHeight / 4.3)
                                            .make();
                                      }
                                    },
                                  ),
                                ],
                              )
                                  .box
                                  .height(context.screenHeight / 2.5)
                                  .width(context.screenWidth)
                                  .color(whiteColor.value)
                                  .make();
                            },
                          ),
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
                  controller: _detController = TextEditingController(
                      text:
                          '${add_controller.edit_location_model_var!.item!.details!}'),
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
                        .width(context.screenWidth / 3.8)
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
                40.heightBox,
                GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: context.screenHeight / 3.5,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: selectedImages.length +

                        //  add_controller.edit_location_model_var!
                        //         .item!.images!.length +
                        1,
                    itemBuilder: (context, index) {
                      print(selectedImages.length);
                      var img_data;

                      index == 0 ? "" : img_data = selectedImages[index - 1];
                      // print(selectedImages[3].uuid);
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
                            )
                              .box
                              .rounded
                              .padding(const EdgeInsets.all(8.0))
                              .make()
                              .onTap(() {
                              _pickImages();
                            })
                          : Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    image: DecorationImage(
                                      image: ResizeImage.resizeIfNeeded(1024,
                                          null, FileImage(File('${img_data}'
                                              //.to.file!.path

                                              ))),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                                    .box
                                    .height(context.screenHeight / 3)
                                    .color(lightColor.value)
                                    .roundedSM
                                    .make(),
                                Positioned(
                                  top: 5,
                                  left: 5,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedImages.removeAt(index - 1);
                                      });
                                    },
                                    child: Icon(
                                      Icons.close,
                                      size: 20,
                                      color: whiteColor.value,
                                    )
                                        .box
                                        .roundedFull
                                        .color(blackColor.value)
                                        .make(),
                                  ),
                                ),
                              ],
                            );
                    }),
                20.heightBox,
              ],
            ),
          ));
        }
      }),
    );
  }

  Future<void> _performEdLoc() async {
    print('============== here we go =============');

    if (_checkData()) {
      await _EdLoc();
    }
  }

  bool _checkData() {
    print('<<<<<<<<<<<<<<<<<<<object>>>>>>>>>>>>>>>>>>>');
    print(widget.uuid);
    print(_nameController!.text);
    print(_priceController!.text);
    print(_detController!.text);
    print(selectedItems);
    print(latitude);
    print(longitude);
    print(selectedImages.length);
    print('<<<<<<<<<<<<<<<<<<<object>>>>>>>>>>>>>>>>>>>');
    if (_nameController!.text.isNotEmpty &&
        _priceController!.text.isNotEmpty &&
        _detController!.text.isNotEmpty &&
        selectedItems.isNotEmpty &&
        latitude != null &&
        longitude != null &&
        selectedImages.isNotEmpty) {
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

  Future<void> _EdLoc() async {
    final response = await autController.Edi_Loc(
      url: widget.uuid,
      name: _nameController!.text,
      address: 'Mak',
      details: _detController!.text,
      lat: '${latitude}',
      lng: '${longitude}',
      price: _priceController!.text,
      category_contents_uuid: selectedItems,
      images: selectedImages,
    );

    if (response.status!) {
      VxToast.show(context, msg: 'Edit Product Successfully');
      Get.off(
        () => addSuccessfullyScreen(
          type: 'locations',
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
    final response =
        await add_prod_controller.deleteLocation(uuid: widget.uuid);
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

  showImage(image) {
    var pic;
    try {
      pic = NetworkImage(image!);
      return pic;
    } catch (e) {
      pic = FileImage(File(image!));
      return pic;
    }
  }
}
