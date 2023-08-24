import 'package:antaji_app/features/add_a_product_or_service/screens/leasing_screen.dart';

import '../../../constant/const.dart';

class AddProductsScreen extends StatefulWidget {
  const AddProductsScreen({super.key});

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);

    super.initState();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.heightBox,
          TabBar(
            controller: tabController,
            indicatorColor: blackColor.value,
            labelColor: blackColor.value,
            unselectedLabelColor: blackColor.value,
            tabs: [
              Tab(
                text: Leasing.tr,
              ),
              Tab(
                text: Leasing.tr,
              ),
            ],
          ),
          TabBarView(
            controller: tabController,
            children: [
              LeasingScreen(),
              LeasingScreen(),
            ],
          ).box.height(context.screenHeight).make(),
        ],
      ),
    );
  }
}
