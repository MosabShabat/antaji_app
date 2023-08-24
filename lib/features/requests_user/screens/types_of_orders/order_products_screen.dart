import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/requests_user/screens/types_of_orders/courses_order_screen.dart';
import 'package:antaji_app/features/requests_user/screens/types_of_orders/products_screen.dart';
import 'package:antaji_app/features/requests_user/screens/types_of_orders/service_order_screen.dart';
import 'package:antaji_app/features/requests_user/screens/types_of_orders/sites_screen.dart';
import '../../../home_page/controller/home_page_controller.dart';

class orderProductsScreen extends StatefulWidget {
  const orderProductsScreen({super.key});

  @override
  State<orderProductsScreen> createState() => _orderProductsScreenState();
}

class _orderProductsScreenState extends State<orderProductsScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: whiteColor.value,
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                builder: (BuildContext context) {
                  return orderProductBottomSheet();
                },
              );
            },
            child: Container(
                width: context.screenWidth / 18,
                height: context.screenHeight / 25,
                child: SvgPicture.asset(
                  ImagesFilter,
                  color: blackColor.value,
                )),
          ),
          30.widthBox,
        ],
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Requests.tr.text
                  .fontFamily(bold)
                  .size(24)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
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
                        text: productsText.tr,
                      ),
                      Tab(
                        text: sitesText.tr,
                      ),
                      Tab(
                        text: serviceText.tr,
                      ),
                      Tab(
                        text: Courses.tr,
                      ),
                    ],
                  ),
                ),
              ),
              TabBarView(
                controller: tabController,
                children: [
                  productsScreen(),
                  SitesScreen(),
                  serviceOrderScreen(),
                  CoursesOrderScreen(),
                ],
              ).box.height(context.screenHeight).make(),
            ],
          ),
        ),
      ),
    );
  }
}
