import 'package:antaji_app/features/add_a_product_or_service/screens/add_a_new_product_tap_bar_screen.dart';
import '../../../constant/const.dart';

class AddANewProductScreen extends StatefulWidget {
  const AddANewProductScreen({super.key});

  @override
  State<AddANewProductScreen> createState() => _AddANewProductScreenState();
}

class _AddANewProductScreenState extends State<AddANewProductScreen>
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
                //    padding: EdgeInsets.all(8),
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
                  addANewProductTapBarScreen(
                    type: 'rent',
                  ),
                  addANewProductTapBarScreen(
                    type: 'sale',
                  ),
                ],
              ).box.height(context.screenHeight / 1.3).make(),
            ],
          ),
        ),
      ),
    );
  }
}
