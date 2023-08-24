
import '../../../constant/const.dart';

class FavoriteProfessionalsScreen extends StatefulWidget {
  const FavoriteProfessionalsScreen({super.key});

  @override
  State<FavoriteProfessionalsScreen> createState() => _FavoriteProfessionalsScreenState();
}

class _FavoriteProfessionalsScreenState extends State<FavoriteProfessionalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: context.height / 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: context.screenHeight / 7,
                      width: context.screenWidth / 2.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                BGImage,
                              ),
                              fit: BoxFit.cover)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              backgroundColor: whiteColor.value,
                              radius: 20,
                              child: SvgPicture.asset(heartBoldIcon),
                            )
                            //heartBoldIcon
                          ],
                        ),
                      ),
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
              print(index);
            });
          },
        ).box.height(context.screenHeight / 1.4).make(),
        SizedBox(
          height: context.screenHeight / 7,
        )
      ],
    );
  }
}
