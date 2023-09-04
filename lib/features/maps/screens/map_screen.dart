import 'package:antaji_app/features/maps/controller/map_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../constant/const.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var map_controller = Get.put(MapController());
  late GoogleMapController mapController;

  List<int> selectedMarkerIndices = []; // Keep track of selected markers

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await map_controller.getMaps();
      if (map_controller.map_model_var != null) {
        setState(() {
          selectedMarkerIndices = List.generate(
            map_controller.map_model_var!.items!.length,
            (index) => -1,
          );
        });
      }
    });

    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: Obx(
        () => map_controller.isDataMapLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Container(
                    width: context.screenWidth,
                    height: context.screenHeight,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(24)),
                    child: map_controller.map_model_var == null
                        ? SizedBox()
                        : FutureBuilder(
                            future: map_controller.getLocationsMapItems(
                                url: map_controller.map_model_var!
                                    .categories![selectedIndex].uuid),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.connectionState ==
                                      ConnectionState.done &&
                                  snapshot.data != null &&
                                  snapshot.data!.isNotEmpty) {
                                return Stack(
                                  children: [
                                    GoogleMap(
                                      onMapCreated: _onMapCreated,
                                      mapType: MapType.terrain,
                                      initialCameraPosition: CameraPosition(
                                        target: LatLng(
                                          double.parse(map_controller
                                              .map_model_var!
                                              .items![selectedIndex]
                                              .lat!),
                                          double.parse(map_controller
                                              .map_model_var!
                                              .items![selectedIndex]
                                              .lng!),
                                        ),
                                        zoom: 11.0,
                                      ),
                                      gestureRecognizers: <Factory<
                                          OneSequenceGestureRecognizer>>[
                                        Factory<OneSequenceGestureRecognizer>(
                                            () => EagerGestureRecognizer()),
                                      ].toSet(),
                                      markers: Set<Marker>.of(
                                        List.generate(
                                          map_controller
                                              .map_model_var!.items!.length,
                                          (index) {
                                            final site = LatLng(
                                              double.parse(map_controller
                                                  .map_model_var!
                                                  .items![index]
                                                  .lat!),
                                              double.parse(map_controller
                                                  .map_model_var!
                                                  .items![index]
                                                  .lng!),
                                            );
                                            final markerId =
                                                MarkerId('marker_$index');
                                            final isMarkerSelected =
                                                selectedMarkerIndices[index] !=
                                                    -1;

                                            return Marker(
                                              markerId: markerId,
                                              position: site,
                                              icon: BitmapDescriptor
                                                  .defaultMarkerWithHue(
                                                      isMarkerSelected
                                                          ? BitmapDescriptor
                                                              .hueBlue
                                                          : BitmapDescriptor
                                                              .hueRed),
                                              infoWindow: InfoWindow(
                                                title:
                                                    '${map_controller.map_model_var!.items![index].price}  ${map_controller.map_model_var!.items![index].currency}',
                                              ),
                                              onTap: () {
                                                // Toggle the selected state
                                                setState(() {
                                                  if (isMarkerSelected) {
                                                    selectedMarkerIndices[
                                                        index] = -1;
                                                  } else {
                                                    selectedMarkerIndices[
                                                        index] = index;
                                                  }
                                                });
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Stack(
                                      children: List.generate(
                                        map_controller
                                            .map_model_var!.items!.length,
                                        (index) {
                                          final isMarkerSelected =
                                              selectedMarkerIndices[index] !=
                                                  -1;

                                          return Positioned(
                                            left: context.screenWidth / 10,
                                            right: context.screenWidth / 10,
                                            top: context.screenHeight / 2,
                                            child: AnimatedOpacity(
                                              opacity:
                                                  isMarkerSelected ? 1.0 : 0.0,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: isMarkerSelected
                                                  ? Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: context
                                                                  .screenWidth /
                                                              3.5,
                                                          height: context
                                                                  .screenHeight /
                                                              6,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              image: DecorationImage(
                                                                  image: NetworkImage(
                                                                      '${map_controller.map_model_var!.items![index].image}'),
                                                                  fit: BoxFit
                                                                      .cover)),
                                                        ).onTap(() {}),
                                                        10.widthBox,
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            '${map_controller.map_model_var!.items![index].name!}'
                                                                .text
                                                                .fontFamily(
                                                                    regular)
                                                                .size(14)
                                                                .color(
                                                                    blackColor
                                                                        .value)
                                                                .make(),
                                                            Row(
                                                              children: [
                                                                '${map_controller.map_model_var!.items![index].price!}  ${map_controller.map_model_var!.items![index].currency!} /'
                                                                    .text
                                                                    .fontFamily(
                                                                        bold)
                                                                    .size(14)
                                                                    .color(blackColor
                                                                        .value)
                                                                    .make(),
                                                                '  ${Today.tr}'
                                                                    .text
                                                                    .fontFamily(
                                                                        regular)
                                                                    .size(12)
                                                                    .color(blackColor
                                                                        .value)
                                                                    .make(),
                                                              ],
                                                            ),
                                                          ],
                                                        )
                                                            .box
                                                            .height(context
                                                                    .screenHeight /
                                                                6)
                                                            .width(context
                                                                    .screenWidth /
                                                                2.7)
                                                            .make(),
                                                        5.widthBox,
                                                        CircleAvatar(
                                                          radius: 12,
                                                          backgroundColor:
                                                              Colors.black,
                                                          child: Icon(
                                                            Icons.close,
                                                            color: Colors.white,
                                                            size: 15,
                                                          ),
                                                        ).onTap(() {
                                                          setState(() {
                                                            selectedMarkerIndices[
                                                                index] = -1;
                                                          });
                                                        })
                                                      ],
                                                    )
                                                      .box
                                                      .color(
                                                        whiteColor.value,
                                                      )
                                                      .padding(
                                                          EdgeInsets.all(8))
                                                      .rounded
                                                      .make()
                                                  : SizedBox(),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                    .height(context.screenHeight)
                                    .make();
                              }
                            },
                          ),
                  ),
                  SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.heightBox,
                        map_controller.map_model_var == null
                            ? SizedBox()
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: map_controller
                                    .map_model_var!.categories!.length,
                                itemBuilder: (context, index) {
                                  var cat_map_data = map_controller
                                      .map_model_var!.categories![index];
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      '${cat_map_data.nameTranslate!}'
                                          .tr
                                          .text
                                          .fontFamily(medium)
                                          .size(12)
                                          .color(whiteColor.value)
                                          .make(),
                                    ],
                                  )
                                      .box
                                      .height(context.screenHeight / 20)
                                      .width(context.screenWidth / 4)
                                      .color(index == selectedIndex
                                          ? redColor
                                          : blackColor.value)
                                      .withRounded(value: 24)
                                      .padding(EdgeInsets.all(8))
                                      .margin(EdgeInsets.only(left: 8))
                                      .make()
                                      .onTap(() {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  });
                                },
                              ).box.height(context.screenHeight / 20).make(),
                        20.heightBox,
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              MyTextField(
                                hintText: FindPhotograPhyRequirement.tr,
                                Radius: 12.0,
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                obscureText: false,
                                readOnly: false,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: blackColor.value,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SvgPicture.asset(globeEarthIcon),
                                Divider(
                                  height: 5,
                                  color: greyColor,
                                ),
                                SvgPicture.asset(pathIcon),
                              ],
                            )
                                .box
                                .height(context.screenHeight / 10)
                                .width(context.screenWidth / 8)
                                .color(lightColor.value)
                                .rounded
                                .make(),
                            12.widthBox,
                          ],
                        ).box.height(context.screenHeight / 10).make(),
                        40.heightBox,
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
