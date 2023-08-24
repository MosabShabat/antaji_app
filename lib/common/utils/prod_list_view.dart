import '../../constant/const.dart';

class ProdListView extends StatelessWidget {
  final String image;
  final String title;
  final String Price;
  final Color backgroundColor;
  final VoidCallback onTap;

  const ProdListView({
    super.key,
    required this.image,
    required this.title,
    required this.Price,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image))),
            ),
            20.heightBox,
            Text(
              title,
              maxLines: 2,
              style:
                  TextStyle(fontFamily: bold, fontSize: 12, color: blackColor.value ),
            ),
            10.heightBox,
            Price.text.fontFamily(medium).size(12).color(blackColor.value ).make(),
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
            .onTap(onTap);
      },
    );
  }
}

class ArtistProfListView extends StatelessWidget {
  final String backgroundImage;
  final String ProfImage;
  final String name;
  final String JobDes;
  final Color backgroundColor;

  const ArtistProfListView({
    super.key,
    required this.backgroundColor,
    required this.backgroundImage,
    required this.ProfImage,
    required this.name,
    required this.JobDes,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 10,
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
                      image: DecorationImage(
                          image: AssetImage(
                            backgroundImage,
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
                    backgroundColor: whiteColor.value ,
                    backgroundImage: AssetImage(
                      ProfImage,
                    ),
                  ),
                  15.heightBox,
                  name.text.fontFamily(bold).size(14).color(blackColor.value ).make(),
                  10.heightBox,
                  JobDes.text
                      .fontFamily(medium)
                      .size(12)
                      .color(blackColor.value )
                      .make(),
                ],
              ),
            )
          ],
        )
            .box
            .height(context.screenHeight / 9)
            .color(backgroundColor)
            //.padding(EdgeInsets.all(8))
            .margin(EdgeInsets.all(8))
            .roundedSM
            .width(context.screenWidth / 2.5)
            .make()
            .onTap(() {
          print(index);
        });
      },
    );
  }
}

class ProProListView extends StatelessWidget {
  final String image;
  final String title;
  final String imageProf;
  final String name;
  final Color backgroundColor;

  const ProProListView({
    super.key,
    required this.image,
    required this.title,
    required this.backgroundColor,
    required this.imageProf,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: context.screenWidth / 1.5,
              height: context.screenHeight / 5.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fitWidth,
              )),
            ),
            20.heightBox,
            Text(
              title,
              maxLines: 2,
              style:
                  TextStyle(fontFamily: bold, fontSize: 12, color: blackColor.value ),
            ),
            10.heightBox,
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(imageProf),
                ),
                10.widthBox,
                name.text.fontFamily(medium).size(12).color(blackColor.value ).make(),
              ],
            )
          ],
        )
            .box
            .height(context.screenHeight / 9)
            .color(backgroundColor)
            .padding(EdgeInsets.all(8))
            .margin(EdgeInsets.all(8))
            .roundedSM
            .width(context.screenWidth / 1.5)
            .make();
      },
    );
  }
}
/**
  imageCamSta
  'سوني ألفا a7S III كاميرا رقمية ميرورليس '
 '300 ر.س / يوم'
 
 */
