import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/home_page/screens/buying_and_renting_a_product/endorsement_screen.dart';

import '../../../../common/widgets/cart_pay_ment.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  int selectedIndex = 0;
  late TextEditingController _PaymentTextController;
  @override
  void initState() {
    _PaymentTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _PaymentTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Get.to(
            () => EndorsementScreen(),
            transition: Transition.rightToLeft,
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: redColor, width: 2),
          ),
          primary: redColor,
          minimumSize: Size(context.screenWidth, 50),
        ),
        child: Continuation.tr.text
            .fontFamily(medium)
            .size(16)
            .color(whiteColor.value)
            .make(),
      )
          .box
          .height(80)
          .width(context.screenWidth - 40)
          .padding(EdgeInsets.all(12))
          .make(),
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          UserImage,
                        ),
                      ),

                      // .box
                      // .width(context.screenWidth / 5.15)
                      // .height(context.screenHeight / 18)
                      // .rounded
                      // .make(),
                      10.widthBox,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'كاتي سانت جون'
                              .text
                              .fontFamily(bold)
                              .size(12)
                              .color(blackColor.value)
                              .make(),
                          5.heightBox,
                          '2 عنصر'
                              .text
                              .fontFamily(medium)
                              .size(12)
                              .color(blackColor.value)
                              .make(),
                        ],
                      ),
                    ],
                  )
                      .box
                      //   .height(context.screenHeight / 12)
                      .width(context.screenWidth / 2.2)
                      .margin(const EdgeInsets.only(left: 8))
                      .color(whiteColor.value)
                      .padding(const EdgeInsets.all(4))
                      .border(
                        width: 1,
                        color: index == selectedIndex ? redColor : greyColor,
                      )
                      .color(whiteColor.value)
                      .withRounded(value: 50)
                      .make()
                      .onTap(() {
                    setState(() {
                      selectedIndex = index;
                      print(index);
                    });
                  });
                },
              ).box.height(context.screenHeight / 12).rounded.make(),
              30.heightBox,
              ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    // var data = products[index];
                    // if (widget.ind == 0) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(
                                      12,
                                    )),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        imageCamSta,
                                      ),
                                      fit: BoxFit.cover,
                                    )))
                            .box
                            .rounded
                            .height(
                              context.screenHeight / 7,
                            )
                            .width(
                              context.screenWidth / 3.5,
                            )
                            .make(),
                        20.widthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            'Godox AD400Pro WITSTRO'
                                .text
                                .fontFamily(bold)
                                .size(12)
                                .fontWeight(FontWeight.w500)
                                .color(blackColor.value)
                                .make(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                '6 أيام'
                                    .text
                                    .fontFamily(medium)
                                    .size(14)
                                    .make(),
                                Icon(Icons.edit_outlined)
                              ],
                            )
                                .box
                                .width(context.screenWidth / 4.5)
                                .height(50)
                                .padding(EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 8,
                                ))
                                .withRounded(value: 24)
                                .color(Color(0xFFF4F4F5))
                                .make()
                                .onTap(() {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                builder: (BuildContext context) {
                                  return cartBottomSheet()
                                      .box
                                      .width(context.screenWidth)
                                      .height(context.screenHeight / 1.1)
                                      .color(whiteColor.value)
                                      .make();
                                },
                              );
                            }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    '4800 ر.س'
                                        .text
                                        .fontFamily(bold)
                                        .size(14)
                                        .color(greenColor)
                                        .make(),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.close),
                                    5.widthBox,
                                    Removal.tr.text
                                        .fontFamily(medium)
                                        .size(12)
                                        .color(Color(0xFF4E4E4E))
                                        .make(),
                                  ],
                                )
                              ],
                            ).box.width(context.screenWidth / 1.8).make(),
                          ],
                        ).box.height(context.screenHeight / 8).make()
                      ],
                    )
                        .box
                        .margin(const EdgeInsets.symmetric(
                          vertical: 8,
                        ))
                        .make();
                  }
                  // },
                  ).box.height(context.screenHeight / 3.1).make(),
              20.heightBox,
              Bill.tr.text.color(blackColor.value).bold.size(20).make(),
              20.heightBox,
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    builder: (context) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AddADiscountCode.tr.text
                              .fontFamily(medium)
                              .size(14)
                              .color(blackColor.value)
                              .make(),
                          Row(
                            children: [
                              TextField(
                                controller: _PaymentTextController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  hintText: discountCode.tr,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: whiteColor.value,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              )
                                  .box
                                  .height(60)
                                  .width(context.screenWidth / 1.7)
                                  .make(),
                              10.widthBox,
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          duration: Duration(seconds: 2),
                                          backgroundColor: whiteColor.value,
                                          dismissDirection:
                                              DismissDirection.horizontal,
                                          content: Column(
                                            children: [
                                              VxDivider(
                                                width: 3,
                                                color: greenColor,
                                              )
                                                  .box
                                                  .width(context.screenWidth)
                                                  .make(),
                                              ListTile(
                                                leading: CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor:
                                                      blackColor.value,
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.done,
                                                      color: whiteColor.value,
                                                    ),
                                                  ),
                                                ),
                                                title: TheDiscountCodeHasBeen
                                                    .tr.text
                                                    .fontFamily(medium)
                                                    .color(blackColor.value)
                                                    .size(14)
                                                    .make(),
                                              )
                                                  .box
                                                  .width(context.screenWidth)
                                                  .height(
                                                      context.screenHeight / 18)
                                                  .color(whiteColor.value)
                                                  .make(),
                                            ],
                                          )));
                                },
                                child: Container(
                                  width: context.screenWidth / 3.5,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: blackColor.value,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      )),
                                  child: Center(
                                    child: application.tr.text
                                        .color(whiteColor.value)
                                        .fontFamily(bold)
                                        .size(14)
                                        .make(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                          .box
                          .height(context.screenHeight / 7)
                          .color(whiteColor.value)
                          .width(context.screenWidth)
                          .padding(EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 12,
                          ))
                          .make();
                    },
                  );

                  //application
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: blackColor.value,
                        ),
                      ),
                    )
                        .box
                        .width(25)
                        .height(25)
                        .roundedSM
                        .border(width: 1.5, color: blackColor.value)
                        .make(),
                    10.widthBox,
                    AddADiscountCode.tr.text
                        .color(blackColor.value)
                        .bold
                        .size(12)
                        .make(),
                  ],
                ),
              ),
              20.heightBox,
              payMentListTail(),
            ],
          ),
        ),
      ),
    );
  }
}
