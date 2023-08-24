import 'package:antaji_app/features/Settings/screens/about_the_application_screen.dart';
import 'package:antaji_app/features/Settings/screens/language_screen.dart';
import 'package:antaji_app/features/Settings/screens/settings_screen.dart';
import 'package:antaji_app/features/Settings/screens/technical_support_screen.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/add_screen.dart';
import 'package:antaji_app/features/conversationss_sessions_notifications/screens/courses_drawer_screen.dart';
import 'package:antaji_app/features/conversationss_sessions_notifications/screens/notices_screen.dart';
import 'package:antaji_app/features/delivery_addresses/screens/delivery_addresses_empty_screen.dart';
import 'package:antaji_app/features/favorite/screens/favorite_screen.dart';
import 'package:antaji_app/features/profile_personly/screens/profile_personly_screen.dart';
import 'package:antaji_app/features/requests_user/screens/types_of_orders/order_products_screen.dart';
import 'package:antaji_app/features/subscription_packages/screens/subscription_packages_screen.dart';
import 'package:antaji_app/local/my_local_controller.dart';

import '../../constant/const.dart';
import '../../features/conversationss_sessions_notifications/screens/chat_drawer_screen.dart';

class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  var controller = MyLocalController();
  GoToScreen(index) {
    if (index == 0) {
      Get.to(
        () => ProfilePersonallyScreen(),
        transition: Transition.rightToLeft,
      );
    }
    if (index == 1) {
      Get.to(
        () => NoticesScreen(),
        transition: Transition.rightToLeft,
      );
    }
    if (index == 2) {
      Get.to(
        () => ChatDrawerScreen(),
        transition: Transition.rightToLeft,
      );
    }
    if (index == 3) {
      Get.to(
        () => coursesDrawerScreen(),
        transition: Transition.rightToLeft,
      );
    }
    if (index == 4) {
      Get.to(
        () => orderProductsScreen(),
        transition: Transition.rightToLeft,
      );
    }
    if (index == 5) {
      Get.to(
        () => SubscriptionPackagesScreen(),
        transition: Transition.rightToLeft,
      );
    }
    if (index == 6) {
      Get.to(
        () => AddScreen(),
        transition: Transition.rightToLeft,
      );
    }
    if (index == 7) {
      Get.to(
        () => FavoriteScreen(),
        transition: Transition.rightToLeft,
      );
    }
    if (index == 8) {
      Get.to(
        () => DeliveryAddressesEmpty(),
        transition: Transition.rightToLeft,
      );
    }
    if (index == 9) {
      Get.to(
        () => technicalSupportScreen(),
        transition: Transition.rightToLeft,
      );
    }
    if (index == 10) {
      Get.to(
        () => AboutTheApplicationScreen(),
        transition: Transition.rightToLeft,
      );
    }
    if (index == 11) {
      Get.to(
        () => languageScreen(),
        transition: Transition.rightToLeft,
      );
    }
    if (index == 12) {
      Get.to(
        () => SettingsScreen(),
        transition: Transition.rightToLeft,
      );
    }
    if (index == 13) {
      print('LogOut');
    }
  }

  @override
  void initState() {
    controller.isDark.value = controller.isDarkMode.read('isDarkMode') == null
        ? false
        : controller.isDarkMode.read('isDarkMode');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.screenWidth / 1.5,
      backgroundColor: whiteColor.value,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: context.screenWidth,
              height: context.screenHeight / 3,
              decoration: BoxDecoration(
                color: lightColor.value,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(24)),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Obx(
                    () => Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print(controller.isDark.value);
                            setState(() {
                              if (controller.isDark.value == true) {
                                setState(() {
                                  controller.isDark.value = false;
                                  controller.isDarkMode.write(
                                      'isDarkMode', controller.isDark.value);
                                  whiteColor.value = Color(0xFF12171D);
                                  blackColor.value = Color(0xFFFFFFFF);
                                  lightColor.value = Color(0xFF1A2027);
                                });
                              } else if (controller.isDark.value == false) {
                                setState(() {
                                  controller.isDark.value = true;
                                  controller.isDarkMode.write(
                                      'isDarkMode', controller.isDark.value);
                                  whiteColor.value = Color(0xFFFFFFFF);
                                  blackColor.value = Color(0xFF000000);
                                  lightColor.value = Color(0xFFF4F4F5);
                                });
                              }
                            });
                            Get.forceAppUpdate();
                            //  Get.appUpdate();
                          },
                          child: SvgPicture.asset(
                            controller.isDarkMode.read('isDarkMode') == null
                                ? LightModeIcon
                                : controller.isDarkMode.read('isDarkMode') ==
                                        false
                                    ? darkModeIcon
                                    : LightModeIcon,
                            width: context.screenWidth / 10,
                            height: context.screenHeight / 20,
                            fit: BoxFit.fill,
                          ).box.alignTopLeft.roundedFull.make(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              controller.isDarkMode.read('isDarkMode') == null
                                  ? LightLogoIcon
                                  : controller.isDarkMode.read('isDarkMode') ==
                                          false
                                      ? LightLogoIcon
                                      : DarkLogoIcon,
                              width: context.screenWidth / 10,
                              height: context.screenHeight / 20,
                            ),
                            'إنتاجي'
                                .text
                                .fontFamily(bold)
                                .size(16)
                                .color(blackColor.value)
                                .make()
                          ],
                        ),
                        20.heightBox,
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(UserImage),
                        ),
                        10.heightBox,
                        'حسن مختار'
                            .text
                            .fontFamily(bold)
                            .size(14)
                            .color(blackColor.value)
                            .make(),
                        10.heightBox,
                        'مستخدم'
                            .text
                            .fontFamily(regular)
                            .size(12)
                            .color(blackColor.value)
                            .make()
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: drawerListIcons.length,
              itemBuilder: (context, index) {
                return ListTile(
                    onTap: () {
                      GoToScreen(index);
                    },
                    leading: SvgPicture.asset(
                      drawerListIcons[index],
                      color: blackColor.value,
                    ),
                    title: drawerListText[index]
                        .tr
                        .text
                        .fontFamily(regular)
                        .size(14)
                        .color(blackColor.value)
                        .make(),
                    trailing: index == 1
                        ? CircleAvatar(
                            radius: 13,
                            backgroundColor: redColor,
                            child: '12'
                                .text
                                .fontFamily(bold)
                                .size(8)
                                .color(whiteColor.value)
                                .make(),
                          )
                        : SizedBox());
              },
            ),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}
