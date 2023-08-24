import 'package:antaji_app/common/widgets/custom_button.dart';
import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/artists/screens/city_change_screen.dart';
import 'package:antaji_app/features/artists/screens/portfolio/portfolio_screen.dart';

class ArtistsScreen extends StatefulWidget {
  const ArtistsScreen({super.key});

  @override
  State<ArtistsScreen> createState() => _ArtistsScreenState();
}

//mosab shabat
class _ArtistsScreenState extends State<ArtistsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: SafeArea(
        //shabat 2000
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                      title: artists.tr.text
                          .fontFamily(bold)
                          .size(24)
                          .color(blackColor.value)
                          .make(),
                      subtitle: ProvidingProfessional.tr.text
                          .fontFamily(regular)
                          .size(14)
                          .color(blackColor.value)
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
                      hintText: SearchForArtists.tr,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [RankingBottomSheet(), FilterBottomSheet()],
                  ),
                  20.heightBox,
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: context.height / 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: context.screenHeight / 7,
                                width: context.screenWidth / 2.2,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          BGImage,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                          Positioned(
                            top: context.screenHeight / 10,
                            left: context.screenWidth / 15,
                            right: context.screenWidth / 15,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: whiteColor.value,
                                  backgroundImage: AssetImage(
                                    UserImage,
                                  ),
                                ),
                                15.heightBox,
                                ' كاتي سانت جون'
                                    .text
                                    .fontFamily(bold)
                                    .size(14)
                                    .color(blackColor.value)
                                    .make(),
                                10.heightBox,
                                'تصوير سينمائي'
                                    .text
                                    .fontFamily(medium)
                                    .size(12)
                                    .color(blackColor.value)
                                    .make(),
                              ],
                            ),
                          )
                        ],
                      )
                          .box
                          .height(context.screenHeight / 4)
                          .color(lightColor.value)
                          //.padding(EdgeInsets.all(8))
                          .margin(EdgeInsets.all(8))
                          .roundedSM
                          .width(context.screenWidth / 2.5)
                          .make()
                          .onTap(() {
                        Get.to(
                          () => PortfolioScreen(),
                          transition: Transition.rightToLeft,
                        );
                        print(index);
                      });
                    },
                  ),
                  20.heightBox,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
