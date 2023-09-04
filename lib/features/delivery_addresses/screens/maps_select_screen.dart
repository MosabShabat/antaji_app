import 'package:antaji_app/constant/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class MapsSelectScreen extends StatefulWidget {
  const MapsSelectScreen({Key? key}) : super(key: key);

  @override
  State<MapsSelectScreen> createState() => _MapsSelectScreenState();
}

class _MapsSelectScreenState extends State<MapsSelectScreen> {
  late GoogleMapController mapController;
  Set<Marker> markers = Set<Marker>();
  LatLng? selectedLocation;
  double? selectedLatitude;
  double? selectedLongitude;
  String? selectedCity;
  String? selectedCountry;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  TextEditingController controller = TextEditingController();
  void _onMapTapped(LatLng latLng) {
    setState(() {
      selectedLocation = latLng;
      selectedLatitude = latLng.latitude;
      selectedLongitude = latLng.longitude;

      selectedCity = "City";
      selectedCountry = "Country";

      markers.clear();
      markers.add(
        Marker(
          markerId: MarkerId("selectedLocation"),
          position: selectedLocation!,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueRed,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          mapType: MapType.terrain,
          onTap: _onMapTapped,
          initialCameraPosition: CameraPosition(
            target: LatLng(24.7136, 46.6753),
            zoom: 14.0,
          ),
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
            Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer()),
          ].toSet(),
          markers: markers,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: whiteColor.value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      5.widthBox,
                      Icon(
                        Icons.arrow_back_ios,
                        color: blackColor.value,
                      )
                    ],
                  ),
                ).onTap(() {
                  Get.back();
                }),
                20.heightBox,
                placesAutoCompleteTextField(),
                // MyTextField(
                //   Radius: 24.0,
                //   readOnly: false,
                //   maxLines: 1,
                //   obscureText: false,
                //   prefixIcon: Icon(
                //     Icons.search,
                //     color: blackColor.value,
                //   ),
                //   keyboardType: TextInputType.name,
                //   hintText: FindAPlace.tr,
                // ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      pathIcon,
                      color: blackColor.value,
                      width: context.screenWidth / 18,
                      height: context.screenHeight / 36,
                    )
                        .box
                        .width(context.screenWidth / 10)
                        .height(context.screenHeight / 20)
                        .color(lightColor.value)
                        .alignCenter
                        .withRounded(value: 12)
                        .make(),
                  ],
                ),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    toChoose.tr.text
                        .fontFamily(regular)
                        .size(16)
                        .color(whiteColor.value)
                        .make(),
                  ],
                )
                    .box
                    .height(context.screenHeight / 16)
                    .width(context.screenWidth)
                    .rounded
                    .color(blackColor.value)
                    .make()
                    .onTap(() {
                  Get.back(result: {
                    'latitude': selectedLatitude,
                    'longitude': selectedLongitude,
                  });
                  print(selectedCity);
                  print(selectedCountry);
                  print(selectedLatitude);
                  print(selectedLongitude);
                  print(selectedLocation);
                })
              ],
            ),
          ),
        ),
      ]),
    );
  }

  placesAutoCompleteTextField() {
    try {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: GooglePlaceAutoCompleteTextField(
          textEditingController: controller,
          googleAPIKey: "AIzaSyBP-edTianaEF_m4JDGJ2jdhPCD77IAeqE",
          inputDecoration: InputDecoration(
            hintText: FindAPlace.tr,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
          debounceTime: 400,
          countries: ["in", "fr"],
          isLatLngRequired: false,
          getPlaceDetailWithLatLng: (Prediction prediction) {
            print("placeDetails" + prediction.lat.toString());
          },

          itemClick: (Prediction prediction) {
            controller.text = prediction.description ?? "";
            controller.selection = TextSelection.fromPosition(
                TextPosition(offset: prediction.description?.length ?? 0));
          },
          seperatedBuilder: Divider(),
          // OPTIONAL// If you want to customize list view item builder
          itemBuilder: (context, index, Prediction prediction) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(
                    width: 7,
                  ),
                  Expanded(child: Text("${prediction.description ?? ""}"))
                ],
              ),
            );
          },

          isCrossBtnShown: true,

          // default 600 ms ,
        ),
      );
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }
}
