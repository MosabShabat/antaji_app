import 'package:flutter/services.dart';

import '../../constant/const.dart';

Widget exitDialog() {
  return Dialog(
    elevation: 0,
    backgroundColor: whiteColor.value,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: blackColor.value,
            child: Icon(Icons.warning),
          ),
          10.heightBox,
          Confirm.tr.text
              .fontFamily(bold)
              .size(18)
              .color(blackColor.value)
              .make(),
          const Divider(),
          10.heightBox,
          AreYouSureYou.tr.text.size(16).color(blackColor.value).make(),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                color: mainColor,
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: yes.tr.text.white.bold.size(20).make(),
              ),
              MaterialButton(
                color: mainColor,
                onPressed: () {
                  Get.back();
                },
                child: no.tr.text.white.bold.size(20).make(),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
