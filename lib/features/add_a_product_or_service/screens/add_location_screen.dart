import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/features/add_a_product_or_service/controller/add_controller.dart';
import 'package:antaji_app/features/add_a_product_or_service/screens/edit_a_location_screen.dart';

import '../../../constant/const.dart';

class AddLocationScreen extends StatefulWidget {
  const AddLocationScreen({super.key});

  @override
  State<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  var add_prod_controller = Get.put(AddController());
  TextEditingController _searchController = TextEditingController();
  Future<void> _refreshData() async {
    await add_prod_controller.getAddLocationData(
      url: '',
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            MyTextField(
                Radius: 24.0,
                hintText: SearchForProducts.tr,
                onSubmitted: (value) {
                  setState(() {
                    isSearch.value = !isSearch.value;
                  });
                },
                controller: _searchController,
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
                  ? add_prod_controller.getAddLocationData(
                      url: '?name=${_searchController.text}')
                  : add_prod_controller.getAddLocationData(url: ''),
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
                      print('?name=${_searchController.text}');
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
                              Container(
                                      child: '${add_prod_data.categoriesName!}'
                                          .text
                                          .fontFamily(regular)
                                          .size(14)
                                          .maxLines(3)
                                          .color(blackColor.value)
                                          .make())
                                  .box
                                  .height(context.screenHeight / 14)
                                  .width(context.screenWidth / 2)
                                  //   .color(greenColor)
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                  ).onTap(() {
                                    Get.to(
                                      () => EditLocationScreen(
                                        uuid: add_prod_data.uuid!,
                                      ),
                                      transition: Transition.rightToLeft,
                                    );
                                  })
                                ],
                              )
                                  .box
                                  .width(context.screenWidth / 2)
                                  //  .color(greenColor)
                                  .make()
                                  .onTap(() {
                                // Get.to(
                                //   () => ProductEditScreen(
                                //     page: widget.page,
                                //     uuid: add_prod_data.uuid!,
                                //   ),
                                //   transition: Transition.rightToLeft,
                                // );
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
    );
  }
}
