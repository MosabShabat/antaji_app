import '../../../constant/const.dart';

class FavoriteProductsScreen extends StatefulWidget {
  const FavoriteProductsScreen({super.key});

  @override
  State<FavoriteProductsScreen> createState() => _FavoriteProductsScreenState();
}

class _FavoriteProductsScreenState extends State<FavoriteProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
            shrinkWrap: true,
            //   physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: context.height / 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 0,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: context.screenWidth / 2.3,
                    height: context.screenHeight / 4.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(imageCamSta),
                          fit: BoxFit.cover,
                        )),
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
                  // .padding(EdgeInsets.all(8))
                  .margin(EdgeInsets.symmetric(
                    horizontal: 4,
                  ))
                  .roundedSM
                  .width(context.screenWidth / 2.5)
                  .make();
            }).box.height(context.screenHeight / 1.4).make(),
        SizedBox(
          height: context.screenHeight / 7,
        )
      ],
    );
  }
}
