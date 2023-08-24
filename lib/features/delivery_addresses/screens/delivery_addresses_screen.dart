import 'package:antaji_app/features/delivery_addresses/screens/add_a_new_address_screen.dart';
import 'package:antaji_app/features/delivery_addresses/screens/edit_delivery_address_screen.dart';

import '../../../constant/const.dart';

class DeliveryAddressesScreen extends StatefulWidget {
  const DeliveryAddressesScreen({super.key});

  @override
  State<DeliveryAddressesScreen> createState() =>
      _DeliveryAddressesScreenState();
}

class _DeliveryAddressesScreenState extends State<DeliveryAddressesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(
        actions: [
          Row(
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
              addAddress.tr.text
                  .color(blackColor.value)
                  .fontFamily(bold)
                  .size(12)
                  .make(),
              //10.widthBox,
            ],
          )
              .box
              .width(context.screenWidth / 3.8)
              //.color(greenColor)
              .make()
              .onTap(() {
            Get.to(
              () => AddANewAddressScreen(),
              transition: Transition.rightToLeft,
            );
          }),
          20.widthBox,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DeliveryAddress.tr.text
                  .fontFamily(bold)
                  .size(24)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: lightColor.value,
                        child: SvgPicture.asset(
                          LightLocationIcon,
                          color: blackColor.value,
                        ),
                      ),
                      10.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          'شارع الملك عبدالله'
                              .text
                              .fontFamily(bold)
                              .size(14)
                              .color(blackColor.value)
                              .make(),
                          10.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ' السعودية ، الرياض'
                                  .text
                                  .fontFamily(regular)
                                  .color(blackColor.value)
                                  .size(14)
                                  .make(),
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
                              ).onTap(() {
                                Get.to(
                                  () => EditDeliveryAddressScreen(),
                                  transition: Transition.rightToLeft,
                                );
                              })
                            ],
                          ).box.width(context.screenWidth / 1.5).make(),
                        ],
                      ),
                    ],
                  )
                      .box
                      .height(context.screenHeight / 9)
                      .padding(EdgeInsets.symmetric(
                        vertical: 12,
                        //   horizontal: 8,
                      ))
                      .margin(EdgeInsets.symmetric(
                        vertical: 12,
                      ))
                      .make();
                },
              ).box.height(context.screenHeight / 1.5).make()
            ],
          ),
        ),
      ),
    );
  }
}
