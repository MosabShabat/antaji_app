import 'package:antaji_app/features/home_page/screens/buying_and_renting_a_product/shopping_cart_subscribed_screen.dart';

import '../../../../common/widgets/cart_pay_ment.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../constant/const.dart';
import 'delivery_addresses_screen.dart';

class EquipmentRentalScreen extends StatefulWidget {
  const EquipmentRentalScreen({super.key});

  @override
  State<EquipmentRentalScreen> createState() => _EquipmentRentalScreenState();
}

class _EquipmentRentalScreenState extends State<EquipmentRentalScreen> {
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
            () => SubscribedScreen(),
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
              ProductRental.tr.text
                  .fontFamily(bold)
                  .color(blackColor.value)
                  .size(20)
                  .make(),
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
                          .color(blackColor.value)
                          .fontFamily(bold)
                          .size(12)
                          .make(),
                      '1 عنصر'
                          .text
                          .color(blackColor.value)
                          .fontFamily(medium)
                          .size(12)
                          .make(),
                    ],
                  ).box.height(40).make()
                ],
              ),
              20.heightBox,
              DeliveryAddress.tr.text
                  .color(blackColor.value)
                  .fontFamily(bold)
                  .size(20)
                  .make(),
              cartPayMent(
                LocWid: Row(
                  children: [
                    TextField(
                      readOnly: true,
                      controller: _PaymentTextController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        hintText: LocationOnTheMap.tr,
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
                        .make()
                        .onTap(() {
                      Get.to(
                        () => DeliveryAddressesScreen(),
                        transition: Transition.rightToLeft,
                      );
                    }),
                    10.widthBox,
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => DeliveryAddressesScreen(),
                          transition: Transition.rightToLeft,
                        );
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
                          child: changing.tr.text
                              .color(whiteColor.value)
                              .fontFamily(bold)
                              .size(14)
                              .make(),
                        ),
                      ),
                    ),
                  ],
                ).onTap(() {
                  Get.to(
                    () => DeliveryAddressesScreen(),
                    transition: Transition.rightToLeft,
                  );
                }),
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
