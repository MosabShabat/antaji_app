import 'package:antaji_app/features/artists/screens/city_change_screen.dart';
import 'package:antaji_app/features/home_page/screens/buying_and_renting_a_product/product_details_screen.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../constant/const.dart';

class FilmingLocationsScreen extends StatefulWidget {
  const FilmingLocationsScreen({super.key});

  @override
  State<FilmingLocationsScreen> createState() => _FilmingLocationsScreenState();
}

class _FilmingLocationsScreenState extends State<FilmingLocationsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: SafeArea(
        child: ListView(
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
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            'الكل'
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
                    ).box.height(context.screenHeight / 20).make(),
                    20.heightBox,
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: context.height / 3,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 0,
                        ),
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: context.screenWidth / 2.3,
                                height: context.screenHeight / 4.5,
                                decoration: BoxDecoration(
                                    color: greenColor,
                                    image: DecorationImage(
                                      image: AssetImage(imageCamSta),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              20.heightBox,
                              Text(
                                'سوني ألفا a7S III كاميرا رقمية ميرورليس ',
                                maxLines: 2,
                                style: TextStyle(
                                  fontFamily: medium,
                                  fontSize: 12,
                                  color: blackColor.value,
                                ),
                              ),
                              10.heightBox,
                              '300 ر.س / يوم'
                                  .text
                                  .fontFamily(bold)
                                  .size(16)
                                  .color(blackColor.value)
                                  .make(),
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
                              () => ProductDetailsScreen(),
                              transition: Transition.rightToLeft,
                            );
                          });
                        }),
                    20.heightBox,
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
