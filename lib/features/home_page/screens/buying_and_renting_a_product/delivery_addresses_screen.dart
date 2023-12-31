import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/delivery_addresses/screens/add_a_new_address_screen.dart';

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
            ],
          )
              .box
              .width(context.screenWidth / 4)
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
                        radius: 40,
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
                          ' السعودية ، الرياض'
                              .text
                              .fontFamily(regular)
                              .color(blackColor.value)
                              .size(14)
                              .make(),
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
