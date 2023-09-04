import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/artists/controller/artists_controller.dart';
import 'package:antaji_app/features/home_page/screens/buying_and_renting_a_product/product_details_add_screen.dart';
import 'package:antaji_app/models/product_data.dart';
import 'package:lottie/lottie.dart';

class LeasingScreen extends StatefulWidget {
  final String url;
  final int type;
  const LeasingScreen({super.key, required this.url, required this.type});

  @override
  State<LeasingScreen> createState() => _LeasingScreenState();
}

class _LeasingScreenState extends State<LeasingScreen> {
  var art_controller = Get.put(ArtistsController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await art_controller.getBusinessArtists(
        type: widget.type,
        url: widget.url,
      );
    });
    super.initState();
  }

  Future<void> _refreshData() async {
    await art_controller.getBusinessArtists(
      type: widget.type,
      url: widget.url,
      refresh: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Obx(
          () => art_controller.isDataBusinessArtistsLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        widget.type == 3
                            ? (art_controller.sale_var.isEmpty
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
                                : GridView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: context.height / 3,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 0,
                                    ),
                                    itemCount: art_controller.sale_var.length,
                                    itemBuilder: (context, index) {
                                      ProductDetails art_sale_data =
                                          art_controller.sale_var[index];
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: context.screenWidth / 2.3,
                                            height: context.screenHeight / 4.5,
                                            decoration: BoxDecoration(
                                                color: greenColor,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${art_sale_data.image!}'),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          20.heightBox,
                                          Text(
                                            '${art_sale_data.name!}',
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
                                              //'${art_sale_data.image!}'
                                              '${art_sale_data.price!} ${art_sale_data.currency!} / '
                                                  .text
                                                  .fontFamily(bold)
                                                  .size(16)
                                                  .color(blackColor.value)
                                                  .make(),
                                              Today.tr.text
                                                  .fontFamily(bold)
                                                  .size(16)
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
                                          .make()
                                          .onTap(() {
                                        Get.to(
                                          () => ProductDetailsAddScreen(
                                            uuid: art_sale_data.uuid!,
                                            type: 'products',
                                          ),
                                          transition: Transition.rightToLeft,
                                        );
                                      });
                                    }))
                            : widget.type == 4
                                ? (art_controller.rent_var.isEmpty
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
                                    : GridView.builder(
                                        shrinkWrap: true,
                                        physics: const BouncingScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisExtent: context.height / 3,
                                          mainAxisSpacing: 8,
                                          crossAxisSpacing: 0,
                                        ),
                                        itemCount:
                                            art_controller.rent_var.length,
                                        itemBuilder: (context, index) {
                                          ProductDetails art_rent_data =
                                              art_controller.rent_var[index];
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width:
                                                    context.screenWidth / 2.3,
                                                height:
                                                    context.screenHeight / 4.5,
                                                decoration: BoxDecoration(
                                                    color: greenColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          '${art_rent_data.image!}'),
                                                      fit: BoxFit.cover,
                                                    )),
                                              ),
                                              20.heightBox,
                                              Text(
                                                '${art_rent_data.name!}',
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
                                                  '${art_rent_data.price!} ${art_rent_data.currency!} / '
                                                      .text
                                                      .fontFamily(bold)
                                                      .size(16)
                                                      .color(blackColor.value)
                                                      .make(),
                                                  Today.tr.text
                                                      .fontFamily(regular)
                                                      .size(14)
                                                      .color(blackColor.value)
                                                      .make(),
                                                ],
                                              ),
                                            ],
                                          )
                                              .box
                                              .height(context.screenHeight / 9)
                                              .color(whiteColor.value)
                                              .margin(EdgeInsets.symmetric(
                                                horizontal: 4,
                                              ))
                                              .roundedSM
                                              .width(context.screenWidth / 2.5)
                                              .make()
                                              .onTap(() {
                                            Get.to(
                                              () => ProductDetailsAddScreen(
                                                uuid: art_rent_data.uuid!,
                                                type: 'products',
                                              ),
                                              transition:
                                                  Transition.rightToLeft,
                                            );
                                          });
                                        }))
                                : SizedBox()
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
