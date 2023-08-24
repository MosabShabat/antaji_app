import 'package:antaji_app/features/Settings/screens/Delete_my_account_screen.dart';
import 'package:antaji_app/features/Settings/screens/privacy_policy_screen.dart';
import 'package:antaji_app/features/auth/screens/terms_and_conditions_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../../constant/const.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  GoToScreen(index) {
    if (index == 0) {
      // Get.to(
      //   () => ViewProfileScreen(),
      //   transition: Transition.rightToLeft,
      // );
    }
    if (index == 1) {
      Get.to(
        () => privacyPolicyScreen(),
        transition: Transition.rightToLeft,
      );
    }
    if (index == 2) {
      Get.to(
        () => TermsAndConditionsScreen(),
        transition: Transition.rightToLeft,
      );
    }
    if (index == 3) {
      Get.to(
        () => DeleteMyAccountScreen(),
        transition: Transition.rightToLeft,
      );
    }
  }

  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Settings.tr.text
                .color(blackColor.value)
                .fontFamily(bold)
                .size(24)
                .make(),
            20.heightBox,
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: SettingsImages.length,
              itemBuilder: (context, index) {
                return ListTile(
                        onTap: () {
                          GoToScreen(index);
                        },
                        leading: SvgPicture.asset(
                          SettingsImages[index],
                          //   color: blackColor.value,
                        ),
                        title: SettingsText[index]
                            .tr
                            .text
                            .fontFamily(regular)
                            .size(14)
                            .color(blackColor.value)
                            .make(),
                        trailing: index == 0
                            ? CupertinoSwitch(
                                value: _switchValue,
                                onChanged: (value) {
                                  setState(() {
                                    _switchValue = value;
                                  });
                                },
                              )
                            : Icon(
                                Icons.arrow_forward_ios,
                                color: blackColor.value,
                              ))
                    .box
                    .margin(EdgeInsets.symmetric(vertical: 12))
                    .make();
              },
            ),
          ],
        ),
      ),
    );
  }
}
