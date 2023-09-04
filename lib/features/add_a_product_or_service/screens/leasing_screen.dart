import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/add_a_product_or_service/controller/add_controller.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/product_edit_screen.dart';

class LeasingScreen extends StatefulWidget {
  final String url;
  final int page;
  const LeasingScreen({super.key, required this.url, required this.page});

  @override
  State<LeasingScreen> createState() => _LeasingScreenState();
}

class _LeasingScreenState extends State<LeasingScreen> {
  var add_prod_controller = Get.put(AddController());
  TextEditingController _searchController = TextEditingController();

  // @override
  // void initState() {
  //   _searchController = TextEditingController();
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     await add_prod_controller.getAddProdData(url: widget.url);
  //   });
  // }

  Future<void> _refreshData() async {
    await add_prod_controller.getAddProdData(
      url: widget.url,
      refresh: true,
    );
  }

  RxBool isSearch = false.obs;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child:
          //  Column(children: [
          //     Lottie.asset(NoResults),
          //     ThereIsNoDataYet.tr.text
          //         .fontFamily(bold)
          //         .size(20)
          //         .color(blackColor.value)
          //         .make()
          //   ])
          SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightBox,
              MyTextField(
                  onSubmitted: (value) {
                    setState(() {
                      isSearch.value = !isSearch.value;
                    });
                  },
                  Radius: 24.0,
                  controller: _searchController,
                  hintText: SearchForProducts.tr,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  obscureText: false,
                  readOnly: false,
                  prefixIcon: Icon(
                    Icons.search,
                    color: blackColor.value,
                  )),
              20.heightBox,
              FutureBuilder(
                future: isSearch.value
                    ? add_prod_controller.getAddProdData(
                        url: '${widget.url}?name=${_searchController.text}')
                    : add_prod_controller.getAddProdData(url: widget.url),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data != null &&
                      snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var add_prod_data = snapshot.data![index];
                        print('${widget.url}?name=${_searchController.text}');
                        print(
                          snapshot.data!.length,
                        );
                        return Row(
                          children: [
                            Container(
                              width: context.screenWidth / 3,
                              height: context.screenHeight / 6.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image:
                                        NetworkImage('${add_prod_data.image!}'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            10.widthBox,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: context.screenWidth / 2.5,
                                  height: context.screenHeight / 22,
                                  child: '${add_prod_data.name!}'
                                      .text
                                      .maxLines(2)
                                      .fontFamily(bold)
                                      .size(12)
                                      .color(blackColor.value)
                                      .make(),
                                ),
                                '${add_prod_data.categoryName!},${add_prod_data.subCategoryName!}'
                                    .text
                                    .fontFamily(regular)
                                    .size(14)
                                    .color(blackColor.value)
                                    .make(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        '${add_prod_data.price!}  ${add_prod_data.currency!} /'
                                            .text
                                            .fontFamily(bold)
                                            .size(12)
                                            .maxLines(5)
                                            .color(blackColor.value)
                                            .make(),
                                        '  ${Today.tr}'
                                            .text
                                            .fontFamily(regular)
                                            .size(12)
                                            .maxLines(5)
                                            .color(blackColor.value)
                                            .make(),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          editIcon,
                                          color: blackColor.value,
                                        ),
                                        10.widthBox,
                                        EditText.tr.text
                                            .fontFamily(regular)
                                            .size(14)
                                            .color(
                                              blackColor.value,
                                            )
                                            .make(),
                                      ],
                                    )
                                  ],
                                )
                                    .box
                                    .width(context.screenWidth / 2)
                                    //  .color(greenColor)
                                    .make()
                                    .onTap(() {
                                  Get.to(
                                    () => ProductEditScreen(
                                      page: widget.page,
                                      uuid: add_prod_data.uuid!,
                                    ),
                                    transition: Transition.rightToLeft,
                                  );
                                }),
                              ],
                            )
                          ],
                        )
                            .box
                            .height(context.screenHeight / 6)
                            //.color(greenColor)
                            .margin(EdgeInsets.symmetric(vertical: 4))
                            .make()
                            .onTap(() {
                          // Get.to(
                          //   () => OrderTrackingPurchaseScreen(),
                          //   transition: Transition.rightToLeft,
                          // );
                        });
                      },
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ThereIsNoDataYet.tr.text
                            .fontFamily(bold)
                            .size(20)
                            .color(blackColor.value)
                            .make(),
                      ],
                    )
                        .box
                        .width(context.screenWidth)
                        .height(context.screenHeight)
                        .make();
                  }
                },
              ),
              SizedBox(
                height: context.screenHeight / 2.4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
