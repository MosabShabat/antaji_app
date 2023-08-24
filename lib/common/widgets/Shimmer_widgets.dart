import 'package:shimmer/shimmer.dart';

import '../../constant/const.dart';

Widget buildImageShimmer(context) {
  return Shimmer.fromColors(
    baseColor: greyColor[300]!,
    highlightColor: greyColor[100]!,
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: whiteColor.value ,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          width: 42,
          height: 42,
        ),
        20.widthBox,
        Container(
          decoration: BoxDecoration(
              color: whiteColor.value ,
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
        .width(context / 2.5)
        .border(color: greyColor, width: 1)
        .make(),
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
              color: whiteColor.value ,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          width: 90,
          height: 7,
        ),
        Container(
          decoration: BoxDecoration(
              color: whiteColor.value ,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          width: 90,
          height: 7,
        ),
      ],
    ),
  );
}

Widget buildListViewShimmer(context) {
  return Shimmer.fromColors(
      baseColor: greyColor[300]!,
      highlightColor: greyColor[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context / 9,
          ),
          Container(
            decoration: BoxDecoration(
                color: whiteColor.value ,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            width: 75,
            height: 5,
          ),
          10.heightBox,
          Container(
            decoration: BoxDecoration(
                color: whiteColor.value ,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            width: 30,
            height: 7,
          ),
        ],
      ));
}
