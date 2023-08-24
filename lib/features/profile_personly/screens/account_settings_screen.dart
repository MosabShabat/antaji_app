import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/constant/const.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class accountSettingsScreen extends StatefulWidget {
  const accountSettingsScreen({super.key});

  @override
  State<accountSettingsScreen> createState() => _accountSettingsScreenState();
}

class _accountSettingsScreenState extends State<accountSettingsScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _FirstNameTextController;
  late TextEditingController _LastNameTextController;
  late TextEditingController _userTextController;
  late TextEditingController _phoneTextController;
  late TextEditingController _countryTextController;
  late TextEditingController _cityTextController;

  bool _isChecked1 = false;
  bool _isChecked2 = false;

  FocusNode focusNode = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey();
  late List<String> countryItems;
  late List<String> cityItems;
  @override
  void initState() {
    super.initState();

    // controller.getCountries();
    cityItems = [];

    _emailTextController = TextEditingController();
    _FirstNameTextController = TextEditingController();
    _LastNameTextController = TextEditingController();
    _userTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _countryTextController = TextEditingController();
    _cityTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _FirstNameTextController.dispose();
    _LastNameTextController.dispose();
    _userTextController.dispose();
    _phoneTextController.dispose();
    _countryTextController.dispose();
    _cityTextController.dispose();
    super.dispose();
  }

  // var controller = Get.put(ApiController());
  // String _selectedItem = 'English';

  // List<countriesCities.Cities> getCitiesByCountry(
  //     String country, List<countriesCities.Countries> countries) {
  //   final selectedCountry =
  //       countries.firstWhere((element) => element.name == country);
  //   return selectedCountry.cities!;
  // }

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
        body:

            // Obx(() {
            //   if (controller.isCountries.value) {
            //     return const Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   } else {
            //     final countriesData = controller.Countries_Var;
            //     countryItems = countriesData.map((country) => country.name!).toList();
            //     return

            SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                accountSettings.tr.text
                    .color(blackColor.value)
                    .fontFamily(bold)
                    .size(24)
                    .make(),
                20.heightBox,
                FirstName.tr.text
                    .color(blackColor.value)
                    .fontFamily(regular)
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
                    .fontFamily(regular)
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
                    .fontFamily(regular)
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
                    .fontFamily(regular)
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
                            borderSide: const BorderSide(
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
                          .fontFamily(regular)
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
                        //           fontFamily: (regular),
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
                              .fontFamily((regular))
                              .size(14)
                              .make(),
                          value: selectedCity,
                          items: cityItems.map((city) {
                            return DropdownMenuItem<String>(
                              value: city,
                              child: Text(
                                city,
                                style: TextStyle(
                                  fontFamily: (regular),
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
                    ],
                  ),
                ),
                20.heightBox,
                PersonalIdentityVerification.tr.text
                    .color(blackColor.value)
                    .fontFamily((regular))
                    .size(14)
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
                        SvgPicture.asset(
                          galleryAddIcon,
                          color: blackColor.value,
                        ),
                        10.heightBox,
                        AddAPhotoID.tr.text
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
                CustomButton(
                  text: SaveModifications.tr,
                  textColor: whiteColor.value,
                  backgroundColor: blackColor.value,
                  borderColor: blackColor.value,
                  onPressed: () {
                    // Get.to(
                    //   () => VerificationScreen(),
                    //   transition: Transition.rightToLeft,
                    // );
                  },
                ).box.height(56).width(context.screenWidth - 40).make(),
                20.heightBox,
              ],
            ),
          ),
        )
        //   }
        // }),
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
        _userTextController.text.isNotEmpty &&
        _phoneTextController.text.isNotEmpty &&
        _countryTextController.text.isNotEmpty &&
        _cityTextController.text.isNotEmpty &&
        _isChecked1 == true &&
        _isChecked2 == true) {
      return true;
    }
    Get.snackbar('Error', 'Enter required data!');
    return false;
  }

  Future<void> _register() async {
    // Response.Response response = await Get.find<AuthGetxController>().register(
    //   first_name: _FirstNameTextController,
    //   last_name: _LastNameTextController,
    //   email: _emailTextController.text,
    //   user_name: _userTextController.text,
    //   mobile: '$CountryId${_phoneTextController.text}',
    //   password: _passwordTextController.text,
    //   country_id: _countryTextController.text,
    //   city_id: _cityTextController.text,
    // );
    // if (response.status!) {
    //   Get.to(
    //       () => VerificationSingUp(
    //             email: _emailTextController.text,
    //           ),
    //       transition: Transition.downToUp);
    // }
    // Get.snackbar("message", response.message!,
    //     backgroundColor: response.status! ? Colors.green : Colors.red,
    //     colorText: Colors.white);
  }
}
