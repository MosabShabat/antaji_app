import 'package:antaji_app/features/home_page/screens/main_and_sections_screens/audio_equipment_dt_screen.dart';
import 'package:antaji_app/models/product_data.dart';
import 'package:lottie/lottie.dart';

import '../../controller/home_page_controller.dart';

class audioEquipmentScreen extends StatefulWidget {
  final String title;
  final String url;
  const audioEquipmentScreen(
      {super.key, required this.title, required this.url});

  @override
  State<audioEquipmentScreen> createState() => _audioEquipmentScreenState();
}

class _audioEquipmentScreenState extends State<audioEquipmentScreen> {
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
      appBar: AppBar(),
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
                          controller_home_pag_var
                                  .prod_det_categories_var.isEmpty
                              ? Column(
                                  children: [
                                    Lottie.asset(NoResults),
                                    ThereIsNoDataYet.tr.text
                                        .fontFamily(bold)
                                        .size(20)
                                        .color(blackColor.value)
                                        .make()
                                  ],
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: controller_home_pag_var
                                      .prod_det_categories_var.length,
                                  itemBuilder: (context, index) {
                                    print(controller_home_pag_var
                                        .prod_det_categories_var.length);
                                    ProductDataDet data =
                                        controller_home_pag_var
                                            .prod_det_categories_var[index];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                '${data.nameTranslate!}'
                                                    .text
                                                    .fontFamily(bold)
                                                    .size(18)
                                                    .color(blackColor.value)
                                                    .make(),
                                                10.heightBox,
                                                '${data.productCount!} ${product.tr}'
                                                    .text
                                                    .fontFamily(medium)
                                                    .size(14)
                                                    .color(blackColor.value)
                                                    .make()
                                              ],
                                            ),
                                            Image.network(
                                              '${data.image!}',
                                              width: context.screenWidth / 3,
                                              height:
                                                  context.screenHeight / 7.5,
                                              fit: BoxFit.cover,
                                            ),
                                          ],
                                        ),
                                        20.heightBox,
                                        Divider(
                                          thickness: 1,
                                        )
                                      ],
                                    )
                                        .box
                                        .height(context.screenHeight / 4.5)
                                        .color(whiteColor.value)
                                        .width(context.screenWidth / 1.5)
                                        .make()
                                        .onTap(() {
                                      Get.to(
                                        () => audioEquipmentDtScreen(
                                          title: data.nameTranslate!,
                                          url: '${widget.url}/${data.uuid!}',
                                        ),
                                        transition: Transition.rightToLeft,
                                      );
                                    });
                                  },
                                ),
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
