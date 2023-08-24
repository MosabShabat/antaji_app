import '../../constant/const.dart';

Widget smallContainers({
  widthSize,
  heightSize,
  image,
}) {
  return ListView.builder(
    itemCount: 6,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return Container(
        width: widthSize,
        height: heightSize,
        //    padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(image: AssetImage(image)),
        ),
      );
    },
  );
}
