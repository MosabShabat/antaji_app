import 'package:antaji_app/features/auth/controller/auth_getx_controller.dart';
import 'package:antaji_app/features/auth/screens/Verification%20_screen.dart';
import 'package:antaji_app/features/auth/screens/singup_artist_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../constant/const.dart';
import 'package:antaji_app/models/response.dart' as Response;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _phoneTextController;

  @override
  void initState() {
    super.initState();
    _phoneTextController = TextEditingController();
  }

  // var controller = Get.put(HomeController());

  @override
  void dispose() {
    _phoneTextController.dispose();
    super.dispose();
  }

  FocusNode focusNode = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey();

  String? phoneNum;
  var CountryId;

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => AuthGetxController());
    Get.put(AuthGetxController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor.value,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.screenHeight / 6,
                ),
                Login.tr.text
                    .color(blackColor.value)
                    .fontFamily(bold)
                    .size(24)
                    .make(),
                10.heightBox,
                EnterTheMobile.tr.text
                    .color(blackColor.value)
                    .fontFamily(medium)
                    .size(12)
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
                        ])),
                40.heightBox,
                CustomButton(
                  text: Continuation.tr,
                  textColor: whiteColor.value,
                  backgroundColor: blackColor.value,
                  borderColor: blackColor.value,
                  onPressed: () async => await _performLogin(),
                ).box.height(56).width(context.screenWidth - 40).make(),
                //   100.heightBox,
                // 120.heightBox,
                SizedBox(
                  height: context.screenHeight / 3,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DonHave.tr.text
                        .color(blackColor.value)
                        .fontFamily(medium)
                        .size(16)
                        .make(),
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          backgroundColor: whiteColor.value,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: context.screenHeight / 4,
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      leading: SvgPicture.asset(IconPerson),
                                      title: userPerson.tr.text
                                          .fontFamily(bold)
                                          .color(blackColor.value)
                                          .size(16)
                                          .make(),
                                      subtitle: BuyingSellingAnd.tr.text
                                          .fontFamily(medium)
                                          .color(blackColor.value)
                                          .size(12)
                                          .make(),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: blackColor.value,
                                      ),
                                    )
                                        .box
                                        .height(85)
                                        .padding(EdgeInsets.all(8))
                                        .width(context.screenWidth - 20)
                                        .color(lightColor.value)
                                        .rounded
                                        .make()
                                        .onTap(() {
                                      Get.to(
                                        () => SingUpArtistScreen(
                                          title: user.tr,
                                          type: 'user',
                                        ),
                                        transition: Transition.rightToLeft,
                                      );
                                    }),
                                    20.heightBox,
                                    ListTile(
                                      leading: SvgPicture.asset(IconPerson1),
                                      title: artistPerson.tr.text
                                          .fontFamily(bold)
                                          .color(blackColor.value)
                                          .size(16)
                                          .make(),
                                      subtitle: ProvidingProfessional.tr.text
                                          .fontFamily(medium)
                                          .color(blackColor.value)
                                          .size(12)
                                          .make()
                                          .onTap(() {
                                        //SingUpArtistScreen
                                        Get.to(
                                          () => SingUpArtistScreen(
                                            title: artistPerson.tr,
                                            type: 'artist',
                                          ),
                                          transition: Transition.rightToLeft,
                                        );
                                      }),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: blackColor.value,
                                      ),
                                    )
                                        .box
                                        .height(85)
                                        .width(context.screenWidth - 20)
                                        .color(lightColor.value)
                                        .rounded
                                        .make(),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: CreateAnAccount.tr.text
                          .color(blackColor.value)
                          .fontFamily(bold)
                          .size(16)
                          .make(),
                    ),
                  ],
                ),
              ],
            ),
          )
              .box
              .height(context.screenHeight)
              .width(context.screenWidth)
              // .color(greenColor)
              .make(),
        ],
      ),
    );
  }

  Future<void> _performLogin() async {
    if (_checkData()) {
      await _login();
    }
  }

  bool _checkData() {
    if (_phoneTextController.text.isNotEmpty) {
      return true;
    }
    Get.snackbar(
      'Error',
      'Pleas Fill the phone number',
      backgroundColor: redColor.withOpacity(0.5),
    );
    return false;
  }

  Future<void> _login() async {
    //  _phoneTextController.text = '0595457344';
    Response.Response response = await Get.find<AuthGetxController>().login(
      phone: '$CountryId-${_phoneTextController.text}',
    );
    if (response.status!) {
      print('$CountryId-${_phoneTextController.text}');
      Get.to(
        () => VerificationScreen(
          phone: '$CountryId${_phoneTextController.text}',
        ),
        transition: Transition.downToUp,
      );
    }
    Get.snackbar("message", response.message!,
        backgroundColor: response.status! ? Colors.green : Colors.pink,
        colorText: Colors.white);
  }
}
