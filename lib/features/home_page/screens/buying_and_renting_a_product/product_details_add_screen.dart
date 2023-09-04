import 'package:antaji_app/features/home_page/controller/home_page_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../common/widgets/cart_pay_ment.dart';
import '../../../../common/widgets/small_containers.dart';

class ProductDetailsAddScreen extends StatefulWidget {
  final String uuid;
  final String type;
  const ProductDetailsAddScreen(
      {super.key, required this.uuid, required this.type});

  @override
  State<ProductDetailsAddScreen> createState() =>
      _ProductDetailsAddScreenState();
}

class _ProductDetailsAddScreenState extends State<ProductDetailsAddScreen> {
  var controller_home_pag_var = Get.put(HomePageController());
  late GoogleMapController mapController;

  // late LatLng _center = ;
  Set<Marker> _markers = {};

  void _onMapCreated(
    GoogleMapController controller,
    lat,
    lng,
  ) {
    mapController = controller;

    Marker newMarker = Marker(
      markerId: MarkerId('red_marker'),
      position: LatLng(double.parse(lat), double.parse(lng)),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow: InfoWindow(title: 'Red Marker'),
    );

    setState(() {
      _markers.add(newMarker);
    });
  }

  @override
  void initState() {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    print(widget.uuid);
    print(widget.type);
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller_home_pag_var.getProdDetails(
        type: widget.type,
        uuid: widget.uuid,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('${controller_home_pag_var.Locations_model_var!.image!}');
    // print('${controller_home_pag_var.Locations_model_var!.name!}');
    return Scaffold(
      backgroundColor: whiteColor.value,
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            builder: (BuildContext context) {
              return cartBottomSheet()
                  .box
                  .width(context.screenWidth)
                  .height(context.screenHeight / 1.1)
                  .color(whiteColor.value)
                  .make();
            },
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: redColor, width: 2),
          ),
          primary: redColor,
          minimumSize: Size(context.screenWidth, 50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              vuesaxOutlineShoppingCart,
              color: blackColor.value,
            ),
            10.widthBox,
            AddToCart.tr.text
                .fontFamily(medium)
                .size(16)
                .color(whiteColor.value)
                .color(blackColor.value)
                .make(),
          ],
        ),
      )
          .box
          .height(80)
          .width(context.screenWidth - 40)
          .padding(EdgeInsets.all(12))
          .make(),
      body: Obx(
        () => controller_home_pag_var.isDataProductDetailsModelLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: widget.type == 'products'
                    ? controller_home_pag_var.product_details_model_var == null
                        ? Center(
                            child: ThereIsNoDataYet.tr.text
                                .fontFamily(bold)
                                .size(20)
                                .color(blackColor.value)
                                .make(),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Image.network(
                                    '${controller_home_pag_var.product_details_model_var!.image!}',
                                    width: context.screenWidth,
                                    height: context.screenHeight / 2.2,
                                    fit: BoxFit.fill,
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                      height: context.screenHeight / 2.2,
                                      width: context.screenWidth,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: context.screenHeight / 25,
                                          horizontal: context.screenWidth / 38,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            10.heightBox,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundColor:
                                                        whiteColor.value,
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.arrow_back_ios,
                                                        color: blackColor.value,
                                                        size: 17,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundColor:
                                                        whiteColor.value,
                                                    child: Center(
                                                      child: SvgPicture.asset(
                                                        IconsUpload,
                                                        color: blackColor.value,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            10.heightBox,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundColor:
                                                        whiteColor.value,
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.favorite_border,
                                                        color: blackColor.value,
                                                        size: 17,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                                  .box
                                  .height(context.screenHeight / 2.2)
                                  .width(context.screenWidth)
                                  .make(),
                              10.heightBox,
                              smallContainers(
                                widthSize: 70.0,
                                heightSize: 70.0,
                                image: controller_home_pag_var
                                    .product_details_model_var!.attachments!,
                                length: controller_home_pag_var
                                    .product_details_model_var!
                                    .attachments!
                                    .length,
                              )
                                  .box
                                  .height(80)
                                  .width(context.screenWidth)
                                  .padding(EdgeInsets.only(
                                    right: 16,
                                  ))
                                  .make(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    20.heightBox,
                                    Row(
                                      children: [
                                        '${controller_home_pag_var.product_details_model_var!.price!}  ${controller_home_pag_var.product_details_model_var!.currency!} /'
                                            .text
                                            .fontFamily(bold)
                                            .size(20)
                                            .color(blackColor.value)
                                            .make(),
                                        '  ${Today.tr}'
                                            .text
                                            .fontFamily(regular)
                                            .size(16)
                                            .color(blackColor.value)
                                            .make(),
                                      ],
                                    ),
                                    20.heightBox,
                                    '${controller_home_pag_var.product_details_model_var!.name!}'
                                        .text
                                        .fontFamily(bold)
                                        .size(18)
                                        .color(blackColor.value)
                                        .make(),
                                    20.heightBox,
                                    theDetails.tr.text
                                        .fontFamily(bold)
                                        .size(12)
                                        .color(blackColor.value)
                                        .make(),
                                    20.heightBox,
                                    '${controller_home_pag_var.product_details_model_var!.details!}'
                                        .text
                                        .fontFamily(medium)
                                        .size(12)
                                        .maxLines(20)
                                        .color(blackColor.value)
                                        .make(),
                                    //Specifications
                                    20.heightBox,
                                    Specifications.tr.text
                                        .fontFamily(bold)
                                        .size(12)
                                        .color(blackColor.value)
                                        .make(),
                                    controller_home_pag_var
                                                .product_details_model_var!
                                                .specifications ==
                                            null
                                        ? SizedBox()
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            physics: BouncingScrollPhysics(),
                                            itemCount: controller_home_pag_var
                                                .product_details_model_var!
                                                .specifications!
                                                .length,
                                            itemBuilder: (context, index) {
                                              var spec_data =
                                                  controller_home_pag_var
                                                      .product_details_model_var!
                                                      .specifications![index];
                                              print('${spec_data.key!}');
                                              print('${spec_data.value!}');
                                              return ListTile(
                                                leading: '${spec_data.key!}'
                                                    .text
                                                    .fontFamily(regular)
                                                    .size(12)
                                                    .color(blackColor.value)
                                                    .make(),
                                                trailing: '${spec_data.value!}'
                                                    .text
                                                    .fontFamily(regular)
                                                    .size(12)
                                                    .color(blackColor.value)
                                                    .make(),
                                              );
                                            },
                                          ),

                                    20.heightBox,
                                    LocationOnTheMap.tr.text
                                        .fontFamily(bold)
                                        .size(14)
                                        .color(blackColor.value)
                                        .make(),
                                    20.heightBox,
                                    Container(
                                      width: context.screenWidth,
                                      height: context.screenHeight / 3.5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(24)),
                                      child: GoogleMap(
                                        onMapCreated: (controller) =>
                                            _onMapCreated(
                                                controller,
                                                controller_home_pag_var
                                                    .product_details_model_var!
                                                    .lat!,
                                                controller_home_pag_var
                                                    .product_details_model_var!
                                                    .lng!),
                                        onCameraMove: (position) {},
                                        mapType: MapType.terrain,
                                        initialCameraPosition: CameraPosition(
                                          target: LatLng(
                                              double.parse(
                                                  controller_home_pag_var
                                                      .product_details_model_var!
                                                      .lat!),
                                              double.parse(
                                                  controller_home_pag_var
                                                      .product_details_model_var!
                                                      .lng!)),
                                          zoom: 11.0,
                                        ),
                                        gestureRecognizers: <Factory<
                                            OneSequenceGestureRecognizer>>[
                                          Factory<OneSequenceGestureRecognizer>(
                                              () => EagerGestureRecognizer()),
                                        ].toSet(),
                                        markers: _markers,
                                      ),
                                    ),
                                    20.heightBox,
                                    publisher.tr.text
                                        .fontFamily(bold)
                                        .size(12)
                                        .color(blackColor.value)
                                        .make(),
                                    20.heightBox,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundImage: NetworkImage(
                                              '${controller_home_pag_var.product_details_model_var!.owner!.image!}'),
                                        ),
                                        15.widthBox,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            '${controller_home_pag_var.product_details_model_var!.owner!.name!}'
                                                .text
                                                .fontFamily(bold)
                                                .color(blackColor.value)
                                                .size(12)
                                                .make(),
                                            5.heightBox,
                                            '${controller_home_pag_var.product_details_model_var!.owner!.productsCount!}   ${product.tr}'
                                                .text
                                                .fontFamily(medium)
                                                .color(blackColor.value)
                                                .size(12)
                                                .make(),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                    : widget.type == 'locations'
                        ? controller_home_pag_var.Locations_model_var == null
                            ? Center(
                                child: ThereIsNoDataYet.tr.text
                                    .fontFamily(bold)
                                    .size(20)
                                    .color(blackColor.value)
                                    .make(),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Image.network(
                                        '${controller_home_pag_var.Locations_model_var!.image!}',
                                        width: context.screenWidth,
                                        height: context.screenHeight / 2.2,
                                        fit: BoxFit.fill,
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                          height: context.screenHeight / 2.2,
                                          width: context.screenWidth,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical:
                                                  context.screenHeight / 25,
                                              horizontal:
                                                  context.screenWidth / 38,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                10.heightBox,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: CircleAvatar(
                                                        radius: 20,
                                                        backgroundColor:
                                                            whiteColor.value,
                                                        child: Center(
                                                          child: Icon(
                                                            Icons
                                                                .arrow_back_ios,
                                                            color: blackColor
                                                                .value,
                                                            size: 17,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: CircleAvatar(
                                                        radius: 20,
                                                        backgroundColor:
                                                            whiteColor.value,
                                                        child: Center(
                                                          child:
                                                              SvgPicture.asset(
                                                            IconsUpload,
                                                            color: blackColor
                                                                .value,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                10.heightBox,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: CircleAvatar(
                                                        radius: 20,
                                                        backgroundColor:
                                                            whiteColor.value,
                                                        child: Center(
                                                          child: Icon(
                                                            Icons
                                                                .favorite_border,
                                                            color: blackColor
                                                                .value,
                                                            size: 17,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                      .box
                                      .height(context.screenHeight / 2.2)
                                      .width(context.screenWidth)
                                      .make(),
                                  10.heightBox,
                                  smallContainers(
                                    widthSize: 70.0,
                                    heightSize: 70.0,
                                    image: controller_home_pag_var
                                        .Locations_model_var!.attachments!,
                                    length: controller_home_pag_var
                                        .Locations_model_var!
                                        .attachments!
                                        .length,
                                  )
                                      .box
                                      .height(80)
                                      .width(context.screenWidth)
                                      .padding(EdgeInsets.only(
                                        right: 16,
                                      ))
                                      .make(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        20.heightBox,
                                        Row(
                                          children: [
                                            '${controller_home_pag_var.Locations_model_var!.price!}  ${controller_home_pag_var.Locations_model_var!.currency!} /'
                                                .text
                                                .fontFamily(bold)
                                                .size(20)
                                                .color(blackColor.value)
                                                .make(),
                                            '  ${Today.tr}'
                                                .text
                                                .fontFamily(regular)
                                                .size(16)
                                                .color(blackColor.value)
                                                .make(),
                                          ],
                                        ),
                                        20.heightBox,
                                        '${controller_home_pag_var.Locations_model_var!.name!}'
                                            .text
                                            .fontFamily(bold)
                                            .size(18)
                                            .color(blackColor.value)
                                            .make(),
                                        20.heightBox,
                                        theDetails.tr.text
                                            .fontFamily(bold)
                                            .size(12)
                                            .color(blackColor.value)
                                            .make(),
                                        20.heightBox,
                                        '${controller_home_pag_var.Locations_model_var!.details!}'
                                            .text
                                            .fontFamily(medium)
                                            .size(12)
                                            .maxLines(20)
                                            .color(blackColor.value)
                                            .make(),
                                        20.heightBox,
                                        LocationOnTheMap.tr.text
                                            .fontFamily(bold)
                                            .size(14)
                                            .color(blackColor.value)
                                            .make(),
                                        20.heightBox,
                                        Container(
                                          width: context.screenWidth,
                                          height: context.screenHeight / 3.5,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(24)),
                                          child: GoogleMap(
                                            onMapCreated: (controller) =>
                                                _onMapCreated(
                                                    controller,
                                                    controller_home_pag_var
                                                        .Locations_model_var!
                                                        .lat!,
                                                    controller_home_pag_var
                                                        .Locations_model_var!
                                                        .lng!),
                                            onCameraMove: (position) {},
                                            mapType: MapType.terrain,
                                            initialCameraPosition:
                                                CameraPosition(
                                              target: LatLng(
                                                  double.parse(
                                                      controller_home_pag_var
                                                          .Locations_model_var!
                                                          .lat!),
                                                  double.parse(
                                                      controller_home_pag_var
                                                          .Locations_model_var!
                                                          .lng!)),
                                              zoom: 11.0,
                                            ),
                                            gestureRecognizers: <Factory<
                                                OneSequenceGestureRecognizer>>[
                                              Factory<OneSequenceGestureRecognizer>(
                                                  () =>
                                                      EagerGestureRecognizer()),
                                            ].toSet(),
                                            markers: _markers,
                                          ),
                                        ),
                                        20.heightBox,
                                        publisher.tr.text
                                            .fontFamily(bold)
                                            .size(12)
                                            .color(blackColor.value)
                                            .make(),
                                        20.heightBox,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              radius: 25,
                                              backgroundImage: NetworkImage(
                                                  '${controller_home_pag_var.Locations_model_var!.owner!.image!}'),
                                            ),
                                            15.widthBox,
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                '${controller_home_pag_var.Locations_model_var!.owner!.name!}'
                                                    .text
                                                    .fontFamily(bold)
                                                    .color(blackColor.value)
                                                    .size(12)
                                                    .make(),
                                                5.heightBox,
                                                '${controller_home_pag_var.Locations_model_var!.owner!.productsCount!}   ${product.tr}'
                                                    .text
                                                    .fontFamily(medium)
                                                    .color(blackColor.value)
                                                    .size(12)
                                                    .make(),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                        : SizedBox()),
      ),
    );
  }
}
