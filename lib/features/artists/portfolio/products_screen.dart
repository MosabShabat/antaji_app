import 'package:antaji_app/constant/const.dart';
import 'leasing_screen.dart';

class productsScreen extends StatefulWidget {
  const productsScreen({super.key});

  @override
  State<productsScreen> createState() => _productsScreenState();
}

class _productsScreenState extends State<productsScreen>
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            Container(
              height: 45,
              width: context.screenWidth,
              decoration: BoxDecoration(
                  color: lightColor.value, borderRadius: BorderRadius.circular(25.0)),
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
                    text: buying.tr,
                  ),
                ],
              ),
            ),
            20.heightBox,
            TabBarView(
              controller: tabController,
              children: [
                Center(
                  child: LeasingScreen(),
                ),
                Center(
                  child: LeasingScreen(),
                ),
              ],
            ).box.height(context.screenHeight / 1.8).make(),
          ],
        ),
      ),
    );
  }
}
