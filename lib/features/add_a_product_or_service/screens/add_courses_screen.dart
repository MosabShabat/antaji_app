import 'package:antaji_app/common/widgets/custom_button.dart';

import '../../../constant/const.dart';

class AddCoursesScreen extends StatefulWidget {
  const AddCoursesScreen({super.key});

  @override
  State<AddCoursesScreen> createState() => _AddCoursesScreenState();
}

class _AddCoursesScreenState extends State<AddCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            MyTextField(
                Radius: 24.0,
                hintText: SearchForProducts.tr,
                keyboardType: TextInputType.text,
                maxLines: 1,
                obscureText: false,
                readOnly: false,
                prefixIcon: Icon(
                  Icons.search,
                  color: blackColor.value,
                )),
            20.heightBox,
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: context.screenWidth,
                      height: context.screenHeight / 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          image: DecorationImage(
                            image: AssetImage(imageCamSta),
                            fit: BoxFit.fitWidth,
                          )),
                    ),
                    20.heightBox,
                    Text(
                      'أساسيات التصوير السينمائي بالكاميرات الاحترافية',
                      maxLines: 2,
                      style: TextStyle(
                          fontFamily: bold,
                          fontSize: 12,
                          color: blackColor.value),
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        '280 ر.س'
                            .text
                            .fontFamily(bold)
                            .size(14)
                            .color(blackColor.value)
                            .make(),
                        10.widthBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              editIcon,
                              color: blackColor.value,
                            ),
                            10.widthBox,
                            EditText.tr.text
                                .fontFamily(regular)
                                .size(14)
                                .color(
                                  blackColor.value,
                                )
                                .make(),
                          ],
                        )
                      ],
                    )
                  ],
                )
                    .box
                    .height(context.screenHeight / 3.2)
                    .color(whiteColor.value)
                    .width(context.screenWidth / 1.5)
                    .make()
                    .onTap(() {
                  // Get.to(
                  //   () => CourseDetailsScreen(
                  //     DoneWid: '280 ر.س'
                  //         .text
                  //         .fontFamily(bold)
                  //         .size(14)
                  //         .color(blackColor.value)
                  //         .make(),
                  //     isPay: false,
                  //   ),
                  //   transition: Transition.rightToLeft,
                  // );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
