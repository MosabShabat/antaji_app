import 'package:antaji_app/models/product_details_model.dart';

import '../../constant/const.dart';

Widget smallContainers({
  widthSize,
  heightSize,
  image,
  length,
  type,
}) {
  print(length);
  return ListView.builder(
    itemCount: length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      Attachments data = image![index];
      return Container(
        width: widthSize,
        height: heightSize,
        //    padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          //color: greenColor,
          image: DecorationImage(
            image: NetworkImage('${data.attachment!}'),
            fit: BoxFit.fill,
          ),
        ),
      );
    },
  );
}
