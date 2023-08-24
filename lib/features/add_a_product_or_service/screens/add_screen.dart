import 'package:antaji_app/features/add_a_product_or_service/screens/add_a_courses_screen.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/add_a_location_screen.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/add_a_new_product_screen.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/add_a_service_screen.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/add_courses_screen.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/add_location_screen.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/add_products_screen.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/add_service_screen.dart';

import '../../../constant/const.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);

    super.initState();
  }

  GetTo(index) {
    if (index == 0) {
      Get.to(
        () => AddANewProductScreen(),
        transition: Transition.rightToLeft,
      );
    }
    if (index == 1) {
      Get.to(
        () => AddALocationScreen(),
        transition: Transition.rightToLeft,
      );
      //AddALocationScreen
    }
    if (index == 2) {
      Get.to(
        () => AddAServiceScreen(),
        transition: Transition.rightToLeft,
      );
      //AddAServiceScreen
    }
    if (index == 3) {
      Get.to(
        () => AddACoursesScreen(),
        transition: Transition.rightToLeft,
      );

      //AddACoursesScreen
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: CircleAvatar(
        radius: 30,
        backgroundColor: redColor,
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ).onTap(() {
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
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            GetTo(index);
                          },
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: lightColor.value.withOpacity(1),
                            child: SvgPicture.asset(
                              AddBottomSheetImages[index],
                              color: blackColor.value,
                            ),
                          ),
                          title: AddBottomSheetText[index]
                              .tr
                              .text
                              .fontFamily(bold)
                              .size(16)
                              .color(blackColor.value)
                              .make(),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: blackColor.value,
                          ),
                        )
                            .box
                            .width(context.screenWidth)
                            .height(context.screenHeight / 14)
                            .color(lightColor.value.withOpacity(0.4))
                            .rounded
                            .padding(EdgeInsets.all(8))
                            .margin(EdgeInsets.symmetric(
                              vertical: 8,
                            ))
                            .make()
                            .onTap(() {});
                      },
                    ).box.height(context.screenHeight / 2.7).make()
                  ],
                )
                    .box
                    .height(context.screenHeight / 2.7)
                    .width(context.screenWidth)
                    .color(whiteColor.value)
                    .make(),
              );
            });
      }),
      appBar: AppBar(),
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
              20.heightBox,
              TabBarView(
                controller: tabController,
                children: [
                  AddProductsScreen(),
                  AddLocationScreen(),
                  AddServiceScreen(),
                  AddCoursesScreen(),
                ],
              ).box.height(context.screenHeight).make(),
            ],
          ),
        ),
      ),
    );
  }
}
