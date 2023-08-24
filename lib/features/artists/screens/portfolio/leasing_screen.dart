import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/home_page/screens/buying_and_renting_a_product/product_details_screen.dart';

class LeasingScreen extends StatefulWidget {
  const LeasingScreen({super.key});

  @override
  State<LeasingScreen> createState() => _LeasingScreenState();
}

class _LeasingScreenState extends State<LeasingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: context.height / 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 0,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: context.screenWidth / 2.3,
                          height: context.screenHeight / 4.5,
                          decoration: BoxDecoration(
                              color: greenColor,
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(imageCamSta),
                                fit: BoxFit.cover,
                              )),
                        ),
                        20.heightBox,
                        Text(
                          'سوني ألفا a7S III كاميرا رقمية ميرورليس ',
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: medium,
                            fontSize: 12,
                            color: blackColor.value,
                          ),
                        ),
                        10.heightBox,
                        '300 ر.س / يوم'
                            .text
                            .fontFamily(bold)
                            .size(16)
                            .color(blackColor.value)
                            .make(),
                      ],
                    )
                        .box
                        .height(context.screenHeight / 9)
                        .color(whiteColor.value)
                        // .padding(EdgeInsets.all(8))
                        .margin(EdgeInsets.symmetric(
                          horizontal: 4,
                        ))
                        .roundedSM
                        .width(context.screenWidth / 2.5)
                        .make()
                        .onTap(() {
                      Get.to(
                        () => ProductDetailsScreen(),
                        transition: Transition.rightToLeft,
                      );
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
