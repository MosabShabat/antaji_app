import 'package:antaji_app/constant/const.dart';

import '../../../../common/widgets/cart_pay_ment.dart';
import '../../../../common/widgets/custom_button.dart';
// import 'course_details_screen.dart';

class BuyTheCourseScreen extends StatefulWidget {
  const BuyTheCourseScreen({super.key});

  @override
  State<BuyTheCourseScreen> createState() => _BuyTheCourseScreenState();
}

class _BuyTheCourseScreenState extends State<BuyTheCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value ,
      appBar: AppBar(),
      bottomNavigationBar: CustomButton(
        text: pay.tr,
        textColor: whiteColor.value ,
        backgroundColor: blackColor.value ,
        borderColor: blackColor.value ,
        onPressed: () {
          // Get.off(
          //   () => CourseDetailsScreen(
          //     isPay: true,
          //     DoneWid: ,
          //   ),
          //   transition: Transition.rightToLeft,
          // );
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
              ProductRental.tr.text.fontFamily(bold).size(20).make(),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(UserImage),
                  ),
                  20.widthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      'ميلا الزهراني'
                          .text
                          .black
                          .fontFamily(bold)
                          .size(12)
                          .make(),
                      '1 عنصر'.text.black.fontFamily(medium).size(12).make(),
                    ],
                  ).box.height(40).make()
                ],
              ),
              20.heightBox,
              Row(
                children: [
                  Container(
                    width: context.screenWidth / 2.5,
                    height: context.screenHeight / 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage(imageCamSta), fit: BoxFit.cover),
                    ),
                  ),
                  10.widthBox,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: context.screenWidth / 2.5,
                        height: context.screenHeight / 22,
                        child: 'أساسيات التصوير السينمائي بالكاميرات الاحترافية'
                            .text
                            .maxLines(2)
                            .fontFamily(bold)
                            .size(12)
                            .color(blackColor.value )
                            .make(),
                      ),
                      Courses.tr.text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value )
                          .make(),
                      '280 ر.س'
                          .text
                          .fontFamily(bold)
                          .size(14)
                          .color(blackColor.value )
                          .make(),
                    ],
                  )
                ],
              )
                  .box
                  .height(context.screenHeight / 6)
                  //.color(greenColor)
                  .margin(EdgeInsets.symmetric(vertical: 12))
                  .make(),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Center(
                            child: Icon(
                              Icons.add,
                            ),
                          ),
                        )
                            .box
                            .width(25)
                            .height(25)
                            .roundedSM
                            .border(width: 1.5, color: blackColor.value )
                            .make(),
                        10.widthBox,
                        AddADiscountCode.tr.text.black.bold.size(12).make(),
                      ],
                    ),
                  ),
                ],
              ),
              cartPayMent(
                LocWid: SizedBox(),
                currency: '00',
                id: 0,
                price: '00',
                promoCodeAmount: '00',
                screen: '00',
                total: '00',
                vat: '00',
                rowWid: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
