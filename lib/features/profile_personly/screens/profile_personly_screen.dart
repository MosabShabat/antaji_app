import 'package:antaji_app/constant/colors.dart';
import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/profile_personly/screens/account_settings_screen.dart';
import 'package:antaji_app/features/profile_personly/screens/business_fair/portfolio_photo_screen.dart';
import 'package:antaji_app/features/profile_personly/screens/view_profile_screen.dart';

class ProfilePersonallyScreen extends StatefulWidget {
  const ProfilePersonallyScreen({super.key});

  @override
  State<ProfilePersonallyScreen> createState() =>
      _ProfilePersonallyScreenState();
}

class _ProfilePersonallyScreenState extends State<ProfilePersonallyScreen> {
  GoToScreen(index) {
    if (index == 0) {
      Get.to(
        () => ViewProfileScreen(),
        transition: Transition.rightToLeft,
      );
    }
    if (index == 1) {
      Get.to(
        () => PortfolioPhotoScreen(),
        transition: Transition.rightToLeft,
      );
    }
    if (index == 2) {
      Get.to(
        () => accountSettingsScreen(),
        transition: Transition.rightToLeft,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor.value,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfilePersonal.tr.text
                    .fontFamily(bold)
                    .size(24)
                    .color(blackColor.value)
                    .make(),
                20.heightBox,
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: profilePersonalImages.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                            onTap: () {
                              GoToScreen(index);
                            },
                            leading: SvgPicture.asset(
                              profilePersonalImages[index],
                              //   color: blackColor.value,
                            ),
                            title: profilePersonalText[index]
                                .tr
                                .text
                                .fontFamily(regular)
                                .size(14)
                                .color(blackColor.value)
                                .make(),
                            trailing: Icon(
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
        ));
  }
}
