import 'package:antaji_app/features/artists/screens/city_change_screen.dart';
import 'package:antaji_app/features/filming_locations/controller/filming_locations_controller.dart';
import 'package:antaji_app/features/home_page/controller/home_page_controller.dart';
import 'package:antaji_app/features/home_page/screens/buying_and_renting_a_product/product_details_add_screen.dart';
import 'package:lottie/lottie.dart';

import '../../../common/widgets/custom_button.dart';

class FilmingLocationsScreen extends StatefulWidget {
  const FilmingLocationsScreen({super.key});

  @override
  State<FilmingLocationsScreen> createState() => _FilmingLocationsScreenState();
}

class _FilmingLocationsScreenState extends State<FilmingLocationsScreen> {
  int selectedIndex = 0;
  var controller_film_loc_var = Get.put(FilmingLocationsController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller_film_loc_var.getLocationsCat();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: SafeArea(
        child: Obx(
          () => controller_film_loc_var.isDataLocationsItemsModelLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                                title: FilmingLocationsVar.tr.text
                                    .fontFamily(bold)
                                    .size(24)
                                    .color(blackColor.value)
                                    .make(),
                                subtitle: ProfessionalPhotographySites.tr.text
                                    .fontFamily(regular)
                                    .size(14)
                                    .color(greyColor)
                                    .make(),
                                trailing: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      LightLocationIcon,
                                      color: blackColor.value,
                                    ),
                                    5.widthBox,
                                    'الرياض'
                                        .text
                                        .fontFamily(medium)
                                        .size(12)
                                        .color(blackColor.value)
                                        .make(),
                                    5.widthBox,
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: blackColor.value,
                                      size: 20,
                                    )
                                  ],
                                )
                                    .box
                                    .height(40)
                                    .width(context.screenWidth / 4)
                                    .color(lightColor.value)
                                    .withRounded(value: 24)
                                    .make()
                                    .onTap(() {
                                  Get.to(
                                    () => CityChangeScreen(),
                                    transition: Transition.rightToLeft,
                                  );
                                })),
                            20.heightBox,
                            MyTextField(
                                hintText: FilmingLocationsSearch.tr,
                                Radius: 50.0,
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                obscureText: false,
                                readOnly: false,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: blackColor.value,
                                )),
                            20.heightBox,
                            controller_film_loc_var.locations_items_model_var ==
                                    null
                                ? SizedBox()
                                : ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller_film_loc_var
                                        .locations_items_model_var!
                                        .categories!
                                        .length,
                                    itemBuilder: (context, index) {
                                      var cat_data = controller_film_loc_var
                                          .locations_items_model_var!
                                          .categories![index];
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          '${cat_data.nameTranslate!}'
                                              .tr
                                              .text
                                              .fontFamily(medium)
                                              .size(12)
                                              .color(
                                                index == selectedIndex
                                                    ? whiteColor.value
                                                    : blackColor.value,
                                              )
                                              .make(),
                                        ],
                                      )
                                          .box
                                          .height(context.screenHeight / 20)
                                          .width(context.screenWidth / 4)
                                          .color(
                                            index == selectedIndex
                                                ? blackColor.value
                                                : lightColor.value,
                                          )
                                          .withRounded(value: 24)
                                          .padding(EdgeInsets.all(8))
                                          .margin(EdgeInsets.only(left: 8))
                                          .make()
                                          .onTap(() {
                                        setState(() {
                                          selectedIndex = index;
                                     
                                        });
                                      });
                                    },
                                  )
                                    .box
                                    .height(context.screenHeight / 20)
                                    .make(),
                            20.heightBox,
                            // Obx(
                            //   () =>
                            controller_film_loc_var.locations_items_model_var ==
                                    null
                                ? SizedBox()
                                : FutureBuilder(
                                    future: controller_film_loc_var
                                        .getLocationsItems(
                                            url: controller_film_loc_var
                                                .locations_items_model_var!
                                                .categories![selectedIndex]
                                                .uuid!),
                                    //   initialData: InitialData,
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else if (snapshot.connectionState ==
                                              ConnectionState.done &&
                                          snapshot.data != null &&
                                          snapshot.data!.isNotEmpty) {
                                        return GridView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisExtent:
                                                  context.height / 3,
                                              mainAxisSpacing: 8,
                                              crossAxisSpacing: 0,
                                            ),
                                            itemCount: snapshot.data!.length,
                                            itemBuilder: (context, index) {
                                              print(
                                                  '<<<<<<<<<<<<<<<<<<<<<<<<object>>>>>>>>>>>>>>>>>>>>>>>>');
                                              print(snapshot.data!.length);
                                              print(
                                                  '<<<<<<<<<<<<<<<<<<<<<<<<object>>>>>>>>>>>>>>>>>>>>>>>>');
                                              var data = snapshot.data![index];
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: context.screenWidth /
                                                        2.3,
                                                    height:
                                                        context.screenHeight /
                                                            4.5,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
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
                                                          .color(
                                                              blackColor.value)
                                                          .make(),
                                                      '  ${Today.tr}'
                                                          .text
                                                          .fontFamily(regular)
                                                          .size(12)
                                                          .color(
                                                              blackColor.value)
                                                          .make(),
                                                    ],
                                                  ),
                                                ],
                                              )
                                                  .box
                                                  .height(
                                                      context.screenHeight / 9)
                                                  .color(whiteColor.value)
                                                  // .padding(EdgeInsets.all(8))
                                                  .margin(EdgeInsets.symmetric(
                                                    horizontal: 4,
                                                  ))
                                                  .roundedSM
                                                  .width(
                                                      context.screenWidth / 2.5)
                                                  .make()
                                                  .onTap(() {
                                                Get.to(
                                                  () => ProductDetailsAddScreen(
                                                    type: 'locations',
                                                    uuid: data.uuid!,
                                                  ),
                                                  transition:
                                                      Transition.rightToLeft,
                                                );
                                              });
                                            });
                                      } else {
                                        return Center(
                                          child: Column(
                                            children: [
                                              Lottie.asset(NoResults),
                                              ThereIsNoDataYet.tr.text
                                                  .fontFamily(bold)
                                                  .size(20)
                                                  .color(blackColor.value)
                                                  .make()
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                  ),
                       
                            20.heightBox,
                          ]),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
