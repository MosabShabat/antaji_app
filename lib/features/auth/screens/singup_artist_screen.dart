import 'package:antaji_app/api/api_controller.dart';
import 'package:antaji_app/features/auth/controller/auth_getx_controller.dart';
import 'package:antaji_app/features/auth/screens/terms_and_conditions_screen.dart';
import 'package:antaji_app/models/countries.dart' as countriesCities;
import 'package:flutter/gestures.dart';
import 'package:get_storage/get_storage.dart';
import '../../../constant/const.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../common/widgets/custom_button.dart';
import 'package:antaji_app/models/response.dart' as Response;
import 'Verification _screen.dart';

class SingUpArtistScreen extends StatefulWidget {
  final String title;
  final String type;
  const SingUpArtistScreen(
      {super.key, required this.title, required this.type});

  @override
  State<SingUpArtistScreen> createState() => _SingUpArtistScreenState();
}

class _SingUpArtistScreenState extends State<SingUpArtistScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _FirstNameTextController;
  late TextEditingController _LastNameTextController;
  late TextEditingController _phoneTextController;
  late TextEditingController _countryTextController;
  late TextEditingController _cityTextController;

  bool _isChecked1 = false;

  FocusNode focusNode = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey();
  late List<String> countryItems;
  late List<String> cityItems;
  var controller = Get.put(ApiController());
  @override
  void initState() {
    super.initState();

    controller.getCountries();
    cityItems = [];

    _emailTextController = TextEditingController();
    _FirstNameTextController = TextEditingController();
    _LastNameTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _countryTextController = TextEditingController();
    _cityTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _FirstNameTextController.dispose();
    _LastNameTextController.dispose();
    _phoneTextController.dispose();
    _countryTextController.dispose();
    _cityTextController.dispose();
    super.dispose();
  }

  // var controller = Get.put(ApiController());
  // String _selectedItem = 'English';

  List<countriesCities.Cities> getCitiesByCountry(
      String country, List<countriesCities.Countries> countries) {
    final selectedCountry =
        countries.firstWhere((element) => element.nameTranslate == country);
    return selectedCountry.cities!;
  }

  String? phoneNum;
  var CountryId;
  String? selectedCountry;
  String? selectedCity;
  String? selectedCountryId;
  @override
  Widget build(BuildContext context) {
    // Get.put(AuthGetxController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor.value,
      appBar: AppBar(),
      body: Obx(() {
        if (controller.isCountries.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final countriesData = controller.Countries_Var;
          countryItems =
              countriesData.map((country) => country.nameTranslate!).toList();
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  '${CreateAnAccount.tr} ${widget.title}'
                      .text
                      .color(blackColor.value)
                      .fontFamily(bold)
                      .size(24)
                      .make(),
                  20.heightBox,
                  FillInYourData.tr.text
                      .color(blackColor.value)
                      .fontFamily(medium)
                      .size(14)
                      .make(),
                  20.heightBox,
                  FirstName.tr.text
                      .color(blackColor.value)
                      .fontFamily(medium)
                      .size(14)
                      .make(),
                  20.heightBox,
                  MyTextField(
                    Radius: 10.0,
                    readOnly: false,
                    maxLines: 1,
                    obscureText: false,
                    controller: _FirstNameTextController,
                    keyboardType: TextInputType.name,
                    hintText: FirstName.tr,
                  ),
                  20.heightBox,
                  lastName.tr.text
                      .color(blackColor.value)
                      .fontFamily(medium)
                      .size(14)
                      .make(),
                  20.heightBox,
                  MyTextField(
                    Radius: 10.0,
                    readOnly: false,
                    maxLines: 1,
                    obscureText: false,
                    controller: _LastNameTextController,
                    keyboardType: TextInputType.name,
                    hintText: lastName.tr,
                  ),
                  20.heightBox,
                  Email.tr.text
                      .color(blackColor.value)
                      .fontFamily(medium)
                      .size(14)
                      .make(),
                  20.heightBox,
                  MyTextField(
                    Radius: 10.0,
                    readOnly: false,
                    maxLines: 1,
                    obscureText: false,
                    controller: _emailTextController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: Email.tr,
                  ),
                  20.heightBox,
                  MobileNumber.tr.text
                      .color(blackColor.value)
                      .fontFamily(medium)
                      .size(14)
                      .make(),
                  20.heightBox,
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IntlPhoneField(
                          controller: _phoneTextController,
                          focusNode: focusNode,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: greyColor.shade200,
                            hintText: MobileNumber.tr,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 1,
                                color: whiteColor.value,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 1,
                                color: blueColor,
                              ),
                            ),
                          ),
                          languageCode: GetStorage().read('lang') == null
                              ? 'en'
                              : GetStorage().read('lang'),
                          onChanged: (phone) {
                            phoneNum = phone.completeNumber;

                            CountryId = phone.countryCode;
                            CountryId = CountryId.substring(1);
                          },
                          onCountryChanged: (country) {
                            setState(() {});
                          },
                        ),
                        20.heightBox,
                        Countries.tr.text
                            .color(blackColor.value)
                            .fontFamily(medium)
                            .size(14)
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
                            underline: SizedBox(),
                            value: selectedCountry,
                            hint: Countries.tr.text.make(),
                            items: countryItems.map((country) {
                              print(country);
                              return DropdownMenuItem<String>(
                                value: country,
                                child: Row(
                                  children: [
                                    // selectedCountry == null
                                    //     ? SizedBox()
                                    //     : Image.network(
                                    //         '${countriesData[countryItems.indexOf(selectedCountry!)].image}',
                                    //         width: context.screenWidth / 10,
                                    //         height: context.screenHeight / 20,
                                    //       ),
                                    // 10.widthBox,
                                    Text(
                                      country,
                                      style: TextStyle(
                                        fontFamily: (medium),
                                        fontSize: 16,
                                        color: blackColor.value,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCountry = value;
                                selectedCity = null;
                                final selectedCountryData =
                                    countriesData.firstWhereOrNull(
                                  (country) =>
                                      country.nameTranslate == selectedCountry,
                                );
                                if (selectedCountryData != null) {
                                  selectedCountryId =
                                      selectedCountryData.uuid.toString();
                                  _countryTextController.text =
                                      selectedCountryId!;
                                  cityItems = selectedCountryData.cities!
                                      .map((city) => city.nameTranslate!)
                                      .toList();
                                  //   print(selectedCountryId);
                                }
                              });
                            },
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            isExpanded: true,
                          ),
                        ),
                        20.heightBox,
                        City.tr.text
                            .color(blackColor.value)
                            .fontFamily((medium))
                            .size(14)
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
                            hint: City.tr.text
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
                              setState(() {
                                selectedCity = value;
                                final selectedCountryData =
                                    countriesData.firstWhere(
                                  (country) =>
                                      country.nameTranslate == selectedCountry,
                                );

                                if (selectedCountryData != null) {
                                  final selectedCityData =
                                      selectedCountryData.cities!.firstWhere(
                                    (city) =>
                                        city.nameTranslate == selectedCity,
                                    orElse: () => countriesCities.Cities(
                                        uuid: '0', nameTranslate: ''),
                                  );

                                  selectedCountryId =
                                      selectedCityData.uuid.toString();
                                  _cityTextController.text = selectedCountryId!;
                                } else {
                                  selectedCountryId = null;
                                  _cityTextController.text = '';
                                }
                              });
                            },
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            isExpanded: true,
                            underline: SizedBox(),
                          ),
                        ),
                        //     ],
                        20.heightBox,
                      ],
                    ),
                  ),
                  20.heightBox,
                  ListTile(
                      leading: Checkbox(
                        value: _isChecked1,
                        activeColor: greenColor,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked1 = value!;
                          });
                        },
                      ),
                      title: ''.text.make(),
                      subtitle: Container(
                        height: 40,
                        width: context.screenWidth - 10,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: bold,
                              color: blackColor.value,
                            ),
                            children: [
                              TextSpan(text: IAgreeTo.tr),
                              TextSpan(
                                text: TermsAndConditions.tr,
                                style: TextStyle(
                                  color: redColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.to(
                                      () => TermsAndConditionsScreen(),
                                      transition: Transition.rightToLeft,
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      )),
                  20.heightBox,
                  CustomButton(
                    text: CreateAnAccount.tr,
                    textColor: whiteColor.value,
                    backgroundColor: blackColor.value,
                    borderColor: blackColor.value,
                    onPressed: () async => await _performRegister(),
                  ).box.height(56).width(context.screenWidth - 40).make(),
                  20.heightBox,
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  Future<void> _performRegister() async {
    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    if (_FirstNameTextController.text.isNotEmpty &&
        _LastNameTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
        _phoneTextController.text.isNotEmpty &&
        _countryTextController.text.isNotEmpty &&
        _cityTextController.text.isNotEmpty &&
        _isChecked1 == true) {
      return true;
    }
    Get.snackbar(
      'Error',
      'Enter required data!',
      backgroundColor: redColor.withOpacity(0.5),
    );
    return false;
  }

  Future<void> _register() async {
    print(_countryTextController.text);
    print(_cityTextController.text);
    Response.Response response = await Get.find<AuthGetxController>().register(
      name: '${_FirstNameTextController.text} ${_LastNameTextController.text}',
      email: _emailTextController.text,
      mobile: '$CountryId-${_phoneTextController.text}',
      country_uuid: _countryTextController.text,
      city_uuid: _cityTextController.text,
      type: widget.type,
    );
    print(response.status);

    if (response.status!) {
      Get.to(
        () => VerificationScreen(
          phone: '$CountryId-${_phoneTextController.text}',
        ),
        transition: Transition.rightToLeft,
      );
    }
    Get.snackbar("message", response.message!,
        backgroundColor: response.status! ? Colors.green : Colors.pink,
        colorText: Colors.white);
  }
}
