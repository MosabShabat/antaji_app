import 'package:shimmer/shimmer.dart';

import '../../constant/const.dart';

Widget buildImageShimmer(context) {
  return Shimmer.fromColors(
    baseColor: greyColor[300]!,
    highlightColor: greyColor[100]!,
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: context / 15,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: whiteColor.value,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              width: 42,
              height: 42,
            ),
            20.widthBox,
            Container(
              decoration: BoxDecoration(
                  color: whiteColor.value,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              width: 85,
              height: 20,
            )
          ],
        )
            .box
            .height(60)
            .rounded
            .padding(EdgeInsets.all(12))
            .width(context.screenWidth / 2.5)
            .border(color: greyColor, width: 1)
            .make();
      },
    ),
  );
}

Widget buildImageAppBarShimmer(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: greyColor[300]!,
    highlightColor: greyColor[100]!,
    child: Container(
      color: whiteColor.value,
      width: context.screenWidth,
      height: context.screenHeight / 2.5,
    ),
  );
}

Widget buildRowShimmer(context) {
  return Shimmer.fromColors(
    baseColor: greyColor[300]!,
    highlightColor: greyColor[100]!,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              color: whiteColor.value,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          width: 90,
          height: 7,
        ),
        Container(
          decoration: BoxDecoration(
              color: whiteColor.value,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          width: 90,
          height: 7,
        ),
      ],
    ),
  );
}

Widget buildListViewShimmer(contextHeight,contextWidth) {
  return Shimmer.fromColors(
    baseColor: greyColor[300]!,
    highlightColor: greyColor[100]!,
    child: ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.safePercentHeight / 9,
            ),
            Container(
              decoration: BoxDecoration(
                  color: whiteColor.value,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              width: 75,
              height: 5,
            ),
            10.heightBox,
            Container(
              decoration: BoxDecoration(
                  color: whiteColor.value,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              width: 30,
              height: 7,
            ),
          ],
        )
            .box
            .height(context.screenHeight / 10)
            .color(lightColor.value)
            .padding(EdgeInsets.all(8))
            .margin(EdgeInsets.all(8))
            .roundedSM
            .width(context.screenWidth / 4)
            .make();
      },
    )
        .box
        .height(contextHeight / 5.3)
        .width(contextWidth)
        .margin(EdgeInsets.symmetric(horizontal: 20))
        .make(),
  );
}
