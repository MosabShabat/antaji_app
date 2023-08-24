import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/add_screen.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/add_successfully_screen.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/product_edit_rent_screen.dart';

import '../../../constant/const.dart';

class ProductEditScreen extends StatefulWidget {
  const ProductEditScreen({super.key});

  @override
  State<ProductEditScreen> createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container()
                  .box
                  .height(context.screenHeight / 150)
                  .width(context.screenWidth / 12)
                  .rounded
                  .color(blackColor.value)
                  .make(),
              Container()
                  .box
                  .height(context.screenHeight / 150)
                  .width(context.screenWidth / 12)
                  .rounded
                  .color(lightColor.value)
                  .make(),
            ],
          )
              .box
              .margin(EdgeInsets.symmetric(horizontal: 15))
              .width(context.screenWidth / 5)
              .make()
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              saveText.tr.text
                  .fontFamily(regular)
                  .size(14)
                  .color(whiteColor.value)
                  .make(),
            ],
          )
              .box
              .rounded
              .padding(EdgeInsets.symmetric(
                horizontal: 12,
              ))
              .color(blackColor.value)
              .height(context.screenHeight / 8)
              .width(context.screenWidth / 2.3)
              .make()
              .onTap(() {
            Get.to(
              () => addSuccessfullyScreen(),
              transition: Transition.rightToLeft,
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              deleteText.tr.text
                  .fontFamily(regular)
                  .size(14)
                  .color(whiteColor.value)
                  .make(),
            ],
          )
              .box
              .height(context.screenHeight / 15)
              .width(context.screenWidth / 2.3)
              .rounded
              .padding(EdgeInsets.symmetric(
                horizontal: 12,
              ))
              .color(redColor)
              .make()
              .onTap(() {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                backgroundColor: whiteColor.value,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        20.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DeleteTheProduct.tr.text
                                .fontFamily(regular)
                                .size(14)
                                .align(TextAlign.start)
                                .color(blackColor.value)
                                .make(),
                          ],
                        ),
                        20.heightBox,
                        DoYouWantToDeleteTheProduct.tr.text
                            .fontFamily(bold)
                            .size(20)
                            .color(blackColor.value)
                            .make(),
                        20.heightBox,
                        ThisStepCannotBeUndone.tr.text
                            .fontFamily(regular)
                            .size(14)
                            .color(blackColor.value)
                            .make(),
                        20.heightBox,
                        CustomButton(
                          text: YesDelete.tr,
                          textColor: whiteColor.value,
                          backgroundColor: redColor,
                          borderColor: redColor,
                          onPressed: () {
                            Get.off(
                              () => AddScreen(),
                              transition: Transition.rightToLeft,
                            );
                          },
                        )
                            .box
                            .height(100)
                            .width(context.screenWidth - 40)
                            .padding(EdgeInsets.all(20))
                            .make(),
                        CustomButton(
                          text: no.tr,
                          textColor: blackColor.value,
                          backgroundColor: lightColor.value,
                          borderColor: lightColor.value,
                          onPressed: () {
                            Get.back();
                          },
                        )
                            .box
                            .height(100)
                            .width(context.screenWidth - 40)
                            .padding(EdgeInsets.all(20))
                            .make(),
                      ],
                    )
                        .box
                        .height(context.screenHeight / 2.5)
                        .width(context.screenWidth)
                        .color(whiteColor.value)
                        .make(),
                  );
                });
          })
        ],
      )
          .box
          .height(context.screenHeight / 16)
          .width(context.screenWidth)
          .margin(EdgeInsets.symmetric(vertical: 12, horizontal: 20))
          .make(),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddANewProduct.tr.text
                  .fontFamily(bold)
                  .color(blackColor.value)
                  .size(24)
                  .make(),
              20.heightBox,
              Container(
                height: context.screenHeight / 15,
                width: context.screenWidth,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: lightColor.value,
                    borderRadius: BorderRadius.circular(25.0)),
                child: TabBar(
                  controller: tabController,
                  indicator: BoxDecoration(
                      color: blackColor.value,
                      borderRadius: BorderRadius.circular(25.0)),
                  labelColor: whiteColor.value,
                  unselectedLabelColor: blackColor.value,
                  tabs: [
                    Tab(
                      text: Leasing.tr,
                    ),
                    Tab(
                      text: sale.tr,
                    ),
                  ],
                ),
              ),
              20.heightBox,
              TabBarView(
                controller: tabController,
                children: [
                  ProductEditRent(),
                  ProductEditRent(),
                ],
              ).box.height(context.screenHeight / 1.3).make(),
            ],
            //ProductEditRent
          ),
        ),
      ),
    );
  }
}
