import 'package:antaji_app/constant/const.dart';

class privacyPolicyScreen extends StatelessWidget {
  const privacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor.value,
        appBar: AppBar(),
        body:

            //  Obx(() => AboutAppController.isAboutApp.value
            //     ? const Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     :

            SingleChildScrollView(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              // if (index >= AboutAppController.AboutApp_var.length) {
              //   return const SizedBox();
              // }

              // var data = AboutAppController.AboutApp_var[index];
              return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      privacyPolicy.tr.text
                          .fontFamily(bold)
                          .color(blackColor.value)
                          .size(24)
                          .make(),
                      20.heightBox,
                      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.'
                          .tr
                          .text
                          .maxLines(5)
                          .size(24)
                          .fontFamily(bold)
                          .color(blackColor.value)
                          .make(),
                      // '${data.title}'
                      //     .tr
                      //     .text
                      //     .size(24)
                      //     .fontFamily(bold)
                      //     .color(blackColor.value)
                      //     .make(),
                      20.heightBox,
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     HtmlWidget(
                      //       '${data.content}',
                      //     ),
                      //   ],
                      // ),
                    ],
                  ));
            },
          ).box.height(context.screenHeight).width(context.screenWidth).make(),
        )
        // ),
        );
  }
}
