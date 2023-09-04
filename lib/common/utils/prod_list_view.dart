import 'package:antaji_app/features/artists/screens/portfolio/portfolio_screen.dart';
import 'package:antaji_app/features/home_page/screens/buying_and_renting_a_product/product_details_add_screen.dart';
import 'package:antaji_app/models/product_data.dart';
import 'package:antaji_app/models/product_of_professionals_model.dart';
import '../../constant/const.dart';

class ProdListView extends StatelessWidget {
  final int count;
  final List<ProductDetails> dataDet;
  final Color backgroundColor;
  final String type;

  ProdListView({
    super.key,
    required this.count,
    required this.dataDet,
    required this.backgroundColor,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: count,
      itemBuilder: (context, index) {
        ProductDetails data = dataDet[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: context.screenWidth / 3,
              height: context.screenHeight / 6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${data.image!}',
                    ),
                    fit: BoxFit.fill,
                  )),
            ),
            20.heightBox,
            Text(
              '${data.name!}',
              maxLines: 2,
              style: TextStyle(
                fontFamily: regular,
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
            .color(backgroundColor)
            .padding(EdgeInsets.all(8))
            .margin(EdgeInsets.all(8))
            .roundedSM
            .width(context.screenWidth / 2.5)
            .make()
            .onTap(
          () {
            Get.to(
              () => ProductDetailsAddScreen(
                uuid: data.uuid!,
                type: type,
              ),
              transition: Transition.rightToLeft,
            );
          },
        );
      },
    );
  }
}

class ArtistProfListView extends StatefulWidget {
  final List<ProminentArtists> dataDet;
  final int count;
  final Color backgroundColor;

  const ArtistProfListView({
    super.key,
    required this.backgroundColor,
    required this.dataDet,
    required this.count,
  });

  @override
  State<ArtistProfListView> createState() => _ArtistProfListViewState();
}

class _ArtistProfListViewState extends State<ArtistProfListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: widget.count,
      itemBuilder: (context, index) {
        ProminentArtists data = widget.dataDet[index];
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
                          image: NetworkImage(
                            data.coverPhoto == null
                                ? "https://antaji.metricshop.net/upload/user/cover/64a54f6bdcf76.jpg"
                                : '${data.coverPhoto!}',
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
                    backgroundImage: NetworkImage(
                      '${data.personalPhoto!}',
                    ),
                  ),
                  15.heightBox,
                  '${data.name!}'
                      .text
                      .fontFamily(bold)
                      .size(14)
                      .color(blackColor.value)
                      .make(),
                  10.heightBox,
                  (data.specialization == null
                          ? '${data.name!}'
                          : '${data.specialization!}')
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
            .height(context.screenHeight / 9)
            .color(widget.backgroundColor)
            //.padding(EdgeInsets.all(8))
            .margin(EdgeInsets.all(8))
            .roundedSM
            .width(context.screenWidth / 2.5)
            .make()
            .onTap(() {
          Get.to(
            () => PortfolioScreen(uuid: data.uuid!),
            transition: Transition.rightToLeft,
          );
          print(index);
        });
      },
    );
  }
}

class ProProListView extends StatelessWidget {
  final int count;
  final List<productOfProfessionals> dataDet;
  final Color backgroundColor;

  const ProProListView({
    super.key,
    required this.count,
    required this.dataDet,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: count,
      itemBuilder: (context, index) {
        productOfProfessionals data = dataDet[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: context.screenWidth / 1.5,
              height: context.screenHeight / 5.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  image: DecorationImage(
                    image: NetworkImage('${data.image!}'),
                    fit: BoxFit.fitWidth,
                  )),
            ),
            20.heightBox,
            Text(
              '${data.title!}',
              maxLines: 2,
              style: TextStyle(
                  fontFamily: bold, fontSize: 12, color: blackColor.value),
            ),
            10.heightBox,
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage('${data.artistImage!}'),
                ),
                10.widthBox,
                '${data.artistName!}'
                    .text
                    .fontFamily(medium)
                    .size(12)
                    .color(blackColor.value)
                    .make(),
              ],
            ).onTap(() {
              // Get.to(
              //   () => PortfolioScreen(
              //     uuid: data.,
              //   ),
              //   transition: Transition.rightToLeft,
              // );
            })
          ],
        )
            .box
            .height(context.screenHeight / 9)
            .color(backgroundColor)
            .padding(EdgeInsets.all(8))
            .margin(EdgeInsets.all(8))
            .roundedSM
            .width(context.screenWidth / 1.5)
            .make()
            .onTap(() {
          // Get.to(
          //   () => vide(),
          //   transition: Transition.rightToLeft,
          // );
        });
      },
    );
  }
}
