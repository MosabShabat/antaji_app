import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/features/subscription_packages/screens/successfully_screen.dart';

import '../../../constant/const.dart';

class PackagePurchaseScreen extends StatefulWidget {
  const PackagePurchaseScreen({super.key});

  @override
  State<PackagePurchaseScreen> createState() => _PackagePurchaseScreenState();
}

class _PackagePurchaseScreenState extends State<PackagePurchaseScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(),
      bottomNavigationBar: CustomButton(
        text: pay.tr,
        textColor: whiteColor.value,
        backgroundColor: blackColor.value,
        borderColor: blackColor.value,
        onPressed: () {
          Get.to(
            () => successfullyScreen(),
            transition: Transition.rightToLeft,
          );
        },
      )
          .box
          .height(100)
          .width(context.screenWidth - 40)
          .padding(EdgeInsets.all(20))
          .make(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PackagePurchase.tr.text.fontFamily(bold).size(20).make(),
              20.heightBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Professionals.tr.text
                      .fontFamily(bold)
                      .size(18)
                      .color(blackColor.value)
                      .make(),
                  '800 ${RS.tr}'
                      .tr
                      .text
                      .fontFamily(bold)
                      .size(18)
                      .color(blackColor.value)
                      .make(),
                ],
              )
                  .box
                  .height(context.screenHeight / 9)
                  .width(context.screenWidth)
                  .padding(EdgeInsets.symmetric(
                    horizontal: 12,
                  ))
                  .rounded
                  .color(Color(0xFFEBF7F4))
                  .make(),
              20.heightBox,
              paymentMethod.tr.text
                  .fontFamily(bold)
                  .size(20)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              SizedBox(
                  height: 70,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            width: 100,
                            height: 50,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: index == selectedIndex
                                    ? redColor
                                    : greyColor,
                                width: 1.5,
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(
                                  payMentTypes[index],
                                ),
                              ],
                            ),
                          ),
                        );
                      })),
              20.heightBox,
              Bill.tr.text
                  .fontFamily(bold)
                  .size(20)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Container(
                height: context.screenHeight / 6.5,
                width: context.screenWidth,
                decoration: BoxDecoration(
                  color: whiteColor.value,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: lightColor.value,
                      offset: Offset(0, 4.0),
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: PackagePrice.tr.text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                      trailing: '3000 ر.س'
                          .tr
                          .text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                    ),
                    Divider(
                      indent: 5,
                      endIndent: 5,
                      color: greyColor,
                    ),
                    ListTile(
                      leading: Total.tr.text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                      trailing: '3000 ر.س'
                          .tr
                          .text
                          .fontFamily(regular)
                          .size(12)
                          .color(greenColor)
                          .make(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
