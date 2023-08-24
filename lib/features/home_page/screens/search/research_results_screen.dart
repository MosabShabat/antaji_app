import 'package:antaji_app/constant/const.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../artists/city_change_screen.dart';

class researchResultsScreen extends StatefulWidget {
  const researchResultsScreen({super.key});

  @override
  State<researchResultsScreen> createState() => _researchResultsScreenState();
}

class _researchResultsScreenState extends State<researchResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
              ),
              5.widthBox,
              'الرياض'
                  .text
                  .fontFamily(medium)
                  .size(12)
                  .color(blackColor.value)
                  .make(),
              5.widthBox,
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
              )
            ],
          )
              .box
              .height(30)
              .width(context.screenWidth / 4)
              .color(lightColor.value)
              .margin(EdgeInsets.all(8))
              .withRounded(value: 24)
              .make()
              .onTap(() {
            Get.to(
              () => CityChangeScreen(),
              transition: Transition.rightToLeft,
            );
          })
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              researchResults.tr.text
                  .fontFamily(bold)
                  .size(24)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              MyTextField(
                prefixIcon: Icon(
                  Icons.search,
                  color: blackColor.value,
                ),
                Radius: 12.0,
                keyboardType: TextInputType.text,
                hintText: FindPhotography.tr,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: greyColor,
                    child: Icon(
                      Icons.close,
                      color: blackColor.value,
                    ),
                  ),
                ),
                maxLines: 1,
                obscureText: false,
                readOnly: false,
              ),
              20.heightBox,
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
                        .make();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
