import 'package:antaji_app/features/home/screens/home_screen.dart';
import 'package:get_storage/get_storage.dart';

import '../../constant/const.dart';
import '../onboarding/screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationControllerLogo;
  late Animation<Offset> _animationLogo;

  late AnimationController _animationControllerMaskGroup4;
  late Animation<Offset> _animationMaskGroup4;

  @override
  void initState() {
    super.initState();

    _animationControllerLogo = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animationLogo = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationControllerLogo,
      curve: Curves.easeOut,
    ));

    _animationControllerLogo.forward();

    _animationControllerMaskGroup4 = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animationMaskGroup4 = Tween<Offset>(
      begin: Offset(1.0, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationControllerMaskGroup4,
      curve: Curves.easeOut,
    ));

    _animationControllerMaskGroup4.forward();

    changeScreen();
  }

  @override
  void dispose() {
    _animationControllerLogo.dispose();
    _animationControllerMaskGroup4.dispose();
    super.dispose();
  }

  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      GetStorage().read(
                'token',
              ) ==
              null
          ? Get.offAll(
              () => OnboardingScreen(),
              transition: Transition.fade,
            )
          : Get.offAll(
              () => HomeScreen(
                initialTabIndex: 0,
              ),
              transition: Transition.fade,
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SlideTransition(
            position: _animationMaskGroup4,
            child: Image.asset(
              MaskGroup4,
              width: context.screenWidth,
              height: context.screenHeight,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: context.screenHeight / 4,
            right: context.screenWidth / 3,
            left: context.screenWidth / 3,
            child: SlideTransition(
              position: _animationLogo,
              child: Column(
                children: [
                  SvgPicture.asset(
                    LightLogoIcon,
                    width: context.screenWidth / 8,
                    height: context.screenHeight / 18,
                  ),
                  10.heightBox,
                  'إنتاجي'
                      .text
                      .fontFamily(bold)
                      .size(24)
                      .color(Colors.white)
                      .make()
                ],
              ),
            ),
          ),
          Positioned(
            top: context.screenHeight / 4,
            right: context.screenWidth / 3,
            left: context.screenWidth / 3,
            child: Column(
              children: [
                SvgPicture.asset(
                  LightLogoIcon,
                  width: context.screenWidth / 8,
                  height: context.screenHeight / 18,
                ).opacity(value: 0.5),
                10.heightBox,
                'إنتاجي'
                    .text
                    .fontFamily(bold)
                    .size(24)
                    .color(Colors.white.withOpacity(0.5))
                    .make()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
