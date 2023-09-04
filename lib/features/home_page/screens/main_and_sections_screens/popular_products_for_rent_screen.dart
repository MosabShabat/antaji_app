import 'package:antaji_app/features/home_page/controller/home_page_controller.dart';
import 'package:antaji_app/models/product_data.dart';
import '../../../../common/widgets/custom_button.dart';

class PopularProductsForRentScreen extends StatefulWidget {
  final String title;
  final String url;
  final int type;
  PopularProductsForRentScreen(
      {super.key, required this.title, required this.url, required this.type});

  @override
  State<PopularProductsForRentScreen> createState() =>
      _PopularProductsForRentScreenState();
}

class _PopularProductsForRentScreenState
    extends State<PopularProductsForRentScreen> {
  var controller_home_pag_var = Get.put(HomePageController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller_home_pag_var.getSeeAll(
        type: widget.type,
        url: widget.url,
      );
    });
  }

  Future<void> _refreshData() async {
    await controller_home_pag_var.getSeeAll(
      refresh: true,
      type: widget.type,
      url: widget.url,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: SameAppBar(context, hint: SearchForProducts.tr),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Obx(
          () => controller_home_pag_var.isDataSeeAllLoading.value
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
                                  .size(24)
                                  .color(blackColor.value)
                                  .make(),
                              20.heightBox,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  RankingBottomSheet(),
                                  FilterBottomSheet(),
                                ],
                              ),
                              20.heightBox,
                              GridView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: context.height / 3,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 0,
                                  ),
                                  itemCount: controller_home_pag_var
                                      .prod_det_var.length,
                                  itemBuilder: (context, index) {
                                    print(
                                      controller_home_pag_var
                                          .prod_det_var.length,
                                    );
                                    // print(widget.url);
                                    ProductDetails data =
                                        controller_home_pag_var
                                            .prod_det_var[index];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: context.screenWidth / 2.3,
                                          height: context.screenHeight / 4.5,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    '${data.image!}'),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        20.heightBox,
                                        Text(
                                          '${data.name!}',
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontFamily: medium,
                                            fontSize: 12,
                                            color: blackColor.value,
                                          ),
                                        ),
                                        10.heightBox,
                                        Row(
                                          children: [
                                            '${data.price!}  ${data.currency!} /'
                                                .text
                                                .fontFamily(bold)
                                                .size(14)
                                                .color(blackColor.value)
                                                .make(),
                                            '  ${Today.tr}'
                                                .text
                                                .fontFamily(regular)
                                                .size(12)
                                                .color(blackColor.value)
                                                .make(),
                                          ],
                                        ),
                                      ],
                                    )
                                        .box
                                        .height(context.screenHeight / 9)
                                        .color(whiteColor.value)
                                        // .padding(EdgeInsets.all(8))
                                        .margin(EdgeInsets.symmetric(
                                          horizontal: 4,
                                        ))
                                        .roundedSM
                                        .width(context.screenWidth / 2.5)
                                        .make();
                                  }),
                            ]))
                  ],
                ),
        ),
      ),
    );
  }
}
