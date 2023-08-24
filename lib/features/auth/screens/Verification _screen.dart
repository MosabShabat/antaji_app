import 'package:antaji_app/features/home/screens/home_screen.dart';
import '../../../common/widgets/code_text_field.dart';
import '../../../constant/const.dart';
import '../../../common/widgets/custom_button.dart';

class VerificationScreen extends StatefulWidget {
  // final String email;

  const VerificationScreen({
    super.key,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;
  String _code = '';
  @override
  void initState() {
    super.initState();

    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();

    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.heightBox,
                verificationCode.tr.text
                    .color(blackColor.value)
                    .fontFamily(bold)
                    .size(24)
                    .make(),
                40.heightBox,
                EnterThe4Digit.tr.text
                    .color(blackColor.value)
                    .fontFamily(medium)
                    .size(12)
                    .make(),
                10.heightBox,
                '+966 123 456 78'
                    .text
                    .color(blackColor.value)
                    .fontFamily(medium)
                    .size(12)
                    .make(),
                30.heightBox,
                Row(
                  children: [
                    CodeTextField(
                      controller: _firstCodeTextController,
                      focusNode: _firstFocusNode,
                      onChanged: (String value) {
                        if (value.isNotEmpty) {
                          _secondFocusNode.requestFocus();
                        }
                      },
                      onSubmitted: (String value) {},
                    ),
                    const SizedBox(width: 10),
                    CodeTextField(
                      controller: _secondCodeTextController,
                      focusNode: _secondFocusNode,
                      onChanged: (String value) {
                        value.isNotEmpty
                            ? _thirdFocusNode.requestFocus()
                            : _firstFocusNode.requestFocus();
                      },
                      onSubmitted: (String value) {},
                    ),
                    const SizedBox(width: 10),
                    CodeTextField(
                      controller: _thirdCodeTextController,
                      focusNode: _thirdFocusNode,
                      onChanged: (String value) {
                        value.isNotEmpty
                            ? _fourthFocusNode.requestFocus()
                            : _secondFocusNode.requestFocus();
                      },
                      onSubmitted: (String value) {},
                    ),
                    const SizedBox(width: 10),
                    CodeTextField(
                      controller: _fourthCodeTextController,
                      focusNode: _fourthFocusNode,
                      onChanged: (String value) {
                        if (value.isEmpty) {
                          _thirdFocusNode.requestFocus();
                        }
                      },
                      onSubmitted: (String value) {},
                    ),
                  ],
                ),
                40.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IDidNot.tr.text.color(blackColor.value).medium.size(16).make(),
                    TextButton(
                      onPressed: () {},
                      child: Resend.tr.text
                          .color(blackColor.value)
                          .medium
                          .color(yalowColor)
                          .size(16)
                          .make(),
                    )
                  ],
                ),
                40.heightBox,
                CustomButton(
                  text: verification.tr,
                  textColor: whiteColor.value,
                  backgroundColor: blackColor.value,
                  borderColor: blackColor.value,
                  onPressed: () {
                    Get.offAll(
                      () => HomeScreen(initialTabIndex: 0),
                      transition: Transition.rightToLeft,
                    );
                  },
                ).box.height(56).width(context.screenWidth - 40).make(),
                10.heightBox,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _performResetVerification() async {
    if (_checkData()) {
      await _resetVerification();
    }
  }

  bool _checkData() {
    return _checkCode();
  }

  bool _checkCode() {
    _code = _firstCodeTextController.text +
        _secondCodeTextController.text +
        _thirdCodeTextController.text +
        _fourthCodeTextController.text;
    if (_code.length == 4) {
      return true;
    }
    Get.snackbar('Message', 'Code is not correct');
    return false;
  }

  Future<void> _resetVerification() async {
    // Response.Response response = await Get.find<AuthGetxController>().reset(
    //   email: widget.email,
    //   code: _code,
    // );
    // if (response.status!) {
    //   Get.to(
    //     () => NewPasswordScreen(
    //       email: widget.email,
    //       code: _code,
    //     ),
    //     transition: Transition.downToUp,
    //   );
    // }
    // Get.snackbar("message", response.message!,
    //     backgroundColor:
    //         response.status! ? Colors.greenAccent : Colors.redAccent,
    //     colorText: Colors.white);
  }
}
