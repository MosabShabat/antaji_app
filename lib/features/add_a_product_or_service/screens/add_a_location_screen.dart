import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/features/add_a_product_or_service/controller/add_controller.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/locations_pictures_screen.dart';
import 'package:antaji_app/features/delivery_addresses/screens/maps_select_screen.dart';
import '../../../constant/const.dart';

class AddALocationScreen extends StatefulWidget {
  const AddALocationScreen({super.key});

  @override
  State<AddALocationScreen> createState() => _AddALocationScreenState();
}

class _AddALocationScreenState extends State<AddALocationScreen> {
  var add_prod_controller = Get.put(AddController());
  TextEditingController _searchController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _detController = TextEditingController();

  @override
  void initState() {
    _searchController = TextEditingController();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _detController = TextEditingController();

    super.initState();
  }

  List<String> selectedItems = [];

  RxBool isSearch = false.obs;

  @override
  void dispose() {
    _searchController.dispose();
    _nameController.dispose();
    _priceController.dispose();
    _detController.dispose();
    super.dispose();
  }

  var cat;
  int? selectedIndex;
  var CatTitle;
  var latitude;
  var longitude;
  @override
  Widget build(BuildContext context) {
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
          .margin(EdgeInsets.symmetric(vertical: 12, horizontal: 20))
          .color(blackColor.value)
          .rounded
          .make()
          .onTap(() {
        if (_nameController.text.isNotEmpty &&
            _priceController.text.isNotEmpty &&
            selectedItems.isNotEmpty &&
            latitude != null &&
            longitude != null &&
            _detController.text.isNotEmpty) {
          Get.snackbar(
            'Success',
            'All fields are not empty',
            backgroundColor: greenColor,
          );
          Get.to(
            () => LocationsPicturesScreen(
              name: _nameController.text,
              address: 'Mak',
              category_uuid: selectedItems,
              details: _detController.text,
              lat: '${latitude}',
              lng: '${longitude}',
              price: _priceController.text,
            
           
            ),
            transition: Transition.rightToLeft,
          );
        } else {
          print('Some fields are empty');
          Get.snackbar(
            'Error',
            'Some fields are empty',
            backgroundColor: redColor,
          );
        }
        // Get.to(
        //   () => LocationPhotosScreen(),
        //   transition: Transition.rightToLeft,
        // );
      }),
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            AddASite.tr.text
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
                CatTitle == null
                    ? Choose.tr.text
                        .fontFamily(regular)
                        .size(14)
                        .color(blackColor.value)
                        .make()
                    : '${CatTitle}'
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
                                    ? add_prod_controller.getCutLocationData(
                                        url: '?name=${_searchController.text}')
                                    : add_prod_controller.getCutLocationData(
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
                                        bool isSelected =
                                            selectedItems.contains(data.uuid);

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
                                                  selectedItems.add(data.uuid);
                                                } else {
                                                  selectedItems
                                                      .remove(data.uuid);
                                                }
                                              }
                                            });
                                          },
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
                                            // CatTitle =
                                            //     '${snapshot.data![selectedIndex].nameTranslate!}';
                                            cat = '${data.uuid}';
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
              hintText: theDetails.tr,
              controller: _detController,
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
          ],
        ),
      )),
    );
  }
}
