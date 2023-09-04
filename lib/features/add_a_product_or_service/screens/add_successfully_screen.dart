import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/add_screen.dart';
import 'package:antaji_app/features/home_page/screens/buying_and_renting_a_product/product_details_add_screen.dart';
import 'package:lottie/lottie.dart';

import '../../../constant/const.dart';

class addSuccessfullyScreen extends StatefulWidget {
  final String type;
  final String uuid;

  const addSuccessfullyScreen({super.key, required this.type, required this.uuid});

  @override
  State<addSuccessfullyScreen> createState() => _addSuccessfullyScreenState();
}

class _addSuccessfullyScreenState extends State<addSuccessfullyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                DoneTicks,
              ),
              ANewProductHasBeenAddedSuccessfully.tr.text
                  .color(blackColor.value)
                  .fontFamily(bold)
                  .size(20)
                  .make(),
              10.heightBox,
              YouCanViewTheProductOrAddMore.tr.text
                  .color(greyColor)
                  .medium
                  .size(12)
                  .make(),
              20.heightBox,
              CustomButton(
                text: ProductShow.tr,
                textColor: whiteColor.value,
                backgroundColor: blackColor.value,
                borderColor: blackColor.value,
                onPressed: () {
                  Get.off(
                    () => ProductDetailsAddScreen(
                      type: widget.type,
                      uuid: widget.uuid,
                    ),
                    transition: Transition.rightToLeft,
                  );
                },
              )
                  .box
                  .height(100)
                  .width(context.screenWidth)
                  .roundedLg
                  .padding(EdgeInsets.all(20))
                  .make(),
              20.heightBox,
              AddABewProduct.tr.text.medium
                  .size(16)
                  .color(blackColor.value)
                  .make()
                  .onTap(() {
                Get.off(() => AddScreen(), transition: Transition.leftToRight);
              }),
              10.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
