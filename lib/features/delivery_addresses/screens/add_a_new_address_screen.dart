import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/features/delivery_addresses/screens/maps_select_screen.dart';
import 'package:antaji_app/features/home_page/screens/buying_and_renting_a_product/delivery_addresses_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../../constant/const.dart';

class AddANewAddressScreen extends StatefulWidget {
  const AddANewAddressScreen({super.key});

  @override
  State<AddANewAddressScreen> createState() => _AddANewAddressScreenState();
}

class _AddANewAddressScreenState extends State<AddANewAddressScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  late List<String> countryItems;
  late List<String> cityItems;
  var CountryId;
  String? selectedCountry;
  String? selectedCity;
  String? selectedCountryId;
  @override
  void initState() {
    cityItems = [];
    super.initState();
  }

  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            saveText.tr.text
                .color(whiteColor.value)
                .fontFamily(bold)
                .size(14)
                .make(),
          ],
        )
            .box
            .height(60)
            .width(context.screenWidth)
            .withRounded(value: 10)
            .color(blackColor.value)
            .make()
            .onTap(() {
          Get.off(
            () => DeliveryAddressesScreen(),
            transition: Transition.rightToLeft,
          );
        }),
      ),
      backgroundColor: whiteColor.value,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddANewAddress.tr.text
                  .fontFamily(bold)
                  .size(24)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              theAddress.tr.text
                  .fontFamily(regular)
                  .size(12)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              MyTextField(
                Radius: 10.0,
                readOnly: false,
                maxLines: 1,
                obscureText: false,
                keyboardType: TextInputType.name,
                hintText: EnterTheAddress.tr,
              ),
              20.heightBox,
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Country.tr.text
                        .color(blackColor.value)
                        .fontFamily(regular)
                        .size(12)
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
                      // child:
                      // DropdownButton<String>(
                      //   underline: SizedBox(),
                      //   value: selectedCountry,
                      //   hint: Countries.tr.text.make(),
                      //   items: countryItems.map((country) {
                      //     print('here');
                      //     return DropdownMenuItem<String>(
                      //       value: country,
                      //       child: Text(
                      //         country,
                      //         style: TextStyle(
                      //           fontFamily: (medium),
                      //           fontSize: 16,
                      //           color: blackColor.value,
                      //         ),
                      //       ),
                      //     );
                      //   }).toList(),
                      //   onChanged: (value) {
                      //     // setState(() {
                      //     //   selectedCountry = value;
                      //     //   selectedCity = null;
                      //     //   final selectedCountryData =
                      //     //       countriesData.firstWhereOrNull(
                      //     //     (country) => country.name == selectedCountry,
                      //     //   );
                      //     //   if (selectedCountryData != null) {
                      //     //     selectedCountryId =
                      //     //         selectedCountryData.id.toString();
                      //     //     _countryTextController.text =
                      //     //         selectedCountryId!;
                      //     //     cityItems = selectedCountryData.cities!
                      //     //         .map((city) => city.name!)
                      //     //         .toList();
                      //     //   }
                      //     // });
                      //   },
                      //   icon: Icon(Icons.arrow_drop_down),
                      //   iconSize: 24,
                      //   isExpanded: true,
                      // ),
                    ),
                    20.heightBox,
                    City.tr.text
                        .color(blackColor.value)
                        .fontFamily((regular))
                        .size(12)
                        .make(),
                    20.heightBox,
                    // if (selectedCountry != null) ...[
                    Container(
                      width: context.screenWidth,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      decoration: BoxDecoration(
                        color: greyColor.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                        hint: SelectTheCity.tr.text
                            .color(blackColor.value)
                            .fontFamily((medium))
                            .size(14)
                            .make(),
                        value: selectedCity,
                        items: cityItems.map((city) {
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
                    ),
                    //     ],
                    20.heightBox,
                    LocationOnTheMap.tr.text
                        .color(blackColor.value)
                        .fontFamily((regular))
                        .size(14)
                        .make(),
                    20.heightBox,
                    Row(
                      children: [
                        TextField(
                          readOnly: true,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            hintText: ChooseTheLocation.tr,
                            hintStyle: TextStyle(
                              fontFamily: regular,
                              fontSize: 12,
                              color: blackColor.value,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                width: 1,
                                color: whiteColor.value,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        )
                            .box
                            .height(60)
                            .width(context.screenWidth / 1.7)
                            .make()
                            .onTap(() {
                          // Get.to(
                          //   () => DeliveryAddressesScreen(),
                          //   transition: Transition.rightToLeft,
                          // );
                        }),
                        10.widthBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              locationAdd,
                              color: whiteColor.value,
                            ),
                            10.widthBox,
                            toChoose.tr.text
                                .color(whiteColor.value)
                                .fontFamily(bold)
                                .size(14)
                                .make(),
                          ],
                        )
                            .box
                            .height(60)
                            .width(context.screenWidth / 3.5)
                            .withRounded(value: 10)
                            .color(blackColor.value)
                            .make()
                            .onTap(() {
                          Get.to(
                            () => MapsSelectScreen(),
                            transition: Transition.rightToLeft,
                          );
                        }),
                      ],
                    ).onTap(() {
                      // Get.to(
                      //   () => DeliveryAddressesScreen(),
                      //   transition: Transition.rightToLeft,
                      // );
                    }),
                  ],
                ),
              ),
              20.heightBox,
              ListTile(
                title: SetAsDefaultAddress.tr.text
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
