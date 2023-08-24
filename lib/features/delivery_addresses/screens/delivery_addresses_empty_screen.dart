import 'package:antaji_app/features/delivery_addresses/screens/delivery_addresses_screen.dart';
import 'package:lottie/lottie.dart';
import '../../../constant/const.dart';

class DeliveryAddressesEmpty extends StatefulWidget {
  const DeliveryAddressesEmpty({super.key});

  @override
  State<DeliveryAddressesEmpty> createState() => _DeliveryAddressesEmptyState();
}

class _DeliveryAddressesEmptyState extends State<DeliveryAddressesEmpty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(LocationPinJson),
                  20.heightBox,
                  MyAddressIsNotReserved.tr.text
                      .fontFamily(bold)
                      .size(20)
                      .color(blackColor.value)
                      .make(),
                ],
              ),
              40.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AddANewAddress.tr.text
                      .fontFamily(regular)
                      .size(16)
                      .color(whiteColor.value)
                      .make(),
                ],
              )
                  .box
                  .height(context.screenHeight / 16)
                  .width(context.screenWidth)
                  .rounded
                  .color(blackColor.value)
                  .make()
                  .onTap(() {
                Get.to(
                  () => DeliveryAddressesScreen(),
                  transition: Transition.rightToLeft,
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
