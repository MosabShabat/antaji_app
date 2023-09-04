import 'package:antaji_app/api/api_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../constant/const.dart';
import '../../auth/screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  var controller = Get.put(ApiController());

  @override
  void initState() {
    controller.getInit();
    super.initState();
  }

  void _navigateToNextPage() {
    setState(() {});
    if (_currentPage == controller.intros_var.lastIndex) {
      Get.off(
        () => LoginScreen(),
        transition: Transition.downToUp,
      );
    } else if (_currentPage < controller.intros_var.length + 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget buildIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SmoothPageIndicator(
        controller: _pageController,
        count: controller.intros_var.length,
        effect: ExpandingDotsEffect(
          activeDotColor: Colors.white,
          dotHeight: 7,
          dotColor: Colors.white.withOpacity(0.5),
          dotWidth: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.isDataLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.intros_var.length,
                    itemBuilder: (context, index) {
                      var dataIntro = controller.intros_var[index];
                      return Container(
                        width: context.screenWidth,
                        height: context.screenHeight,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(dataIntro.image!),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                  ),
                  Positioned(
                    top: 50,
                    left: 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Skip.tr.text.bold.size(20).black.make().onTap(() {
                          Get.off(
                            () => LoginScreen(),
                            transition: Transition.downToUp,
                          );
                        }),
                        SizedBox(
                          width: context.screenWidth / 1.3,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          Group118782,
                          width: context.screenWidth,
                          height: context.screenHeight / 2.8,
                        ),
                        Positioned(
                          bottom: context.screenHeight / 22,
                          //  left: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                controller.intros_var[_currentPage]
                                    .titleTranslate!.text
                                    .fontFamily(bold)
                                    .size(20)
                                    .white
                                    .make(),
                                10.heightBox,
                                controller.intros_var[_currentPage]
                                    .supTitleTranslate!.text
                                    .fontFamily(regular)
                                    .size(14)
                                    .white
                                    .make(),
                                20.heightBox,
                                Row(
                                  children: [
                                    SizedBox(
                                      width: context.screenWidth / 4,
                                    ),
                                    buildIndicator(),
                                  ],
                                ),
                                20.heightBox,
                                CustomButton(
                                  text: Continuation.tr,
                                  textColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  borderColor: Colors.white,
                                  onPressed: _navigateToNextPage,
                                )
                                    .box
                                    .height(56)
                                    .width(context.screenWidth - 40)
                                    .make(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
