import 'package:antaji_app/models/product_data.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../controller/home_page_controller.dart';

class BrowseCategoriesScreen extends StatefulWidget {
  final String title;
  final String url;
  const BrowseCategoriesScreen(
      {super.key, required this.title, required this.url});

  @override
  State<BrowseCategoriesScreen> createState() => _BrowseCategoriesScreenState();
}

class _BrowseCategoriesScreenState extends State<BrowseCategoriesScreen> {
  var controller_home_pag_var = Get.put(HomePageController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller_home_pag_var.getCategoriesData(
        url: widget.url,
      );
    });
  }

  Future<void> _refreshData() async {
    await controller_home_pag_var.getCategoriesData(
      refresh: true,
      url: widget.url,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: SameAppBar(context, hint: searchByCategories.tr),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Obx(
          () => controller_home_pag_var.isDataCategoriesLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          '${widget.title}'
                              .text
                              .fontFamily(bold)
                              .color(blackColor.value)
                              .size(24)
                              .make(),
                          20.heightBox,
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisExtent: context.height / 4,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                            ),
                            itemCount: controller_home_pag_var
                                .prod_det_categories_var.length,
                            itemBuilder: (context, index) {
                              ProductDataDet data = controller_home_pag_var
                                  .prod_det_categories_var[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: context.screenWidth / 4.1,
                                        height: context.screenHeight / 8,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  '${data.image!}'),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ],
                                  ),
                                  10.heightBox,
                                  '${data.nameTranslate!}'
                                      .text
                                      .fontFamily(bold)
                                      .size(12)
                                      .color(blackColor.value)
                                      .make(),
                                  10.heightBox,
                                  '${data.productCount!} ${product.tr}'
                                      .text
                                      .fontFamily(medium)
                                      .size(12)
                                      .color(blackColor.value)
                                      .make(),
                                ],
                              )
                                  .box
                                  .height(context.screenHeight / 4)
                                  .color(lightColor.value)
                                  .padding(EdgeInsets.all(8))
                                  .roundedSM
                                  .width(context.screenWidth / 4)
                                  .make()
                                  .onTap(() {
                                Get.to(
                                  () => audioEquipmentScreen(
                                    title: data.nameTranslate!,
                                    url: '/${data.uuid!}',
                                  ),
                                  transition: Transition.rightToLeft,
                                );
                              });
                            },
                          ).box.height(context.screenHeight).rounded.make(),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
