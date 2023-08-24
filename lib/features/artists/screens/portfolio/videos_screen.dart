import '../../../../constant/const.dart';

class videosScreen extends StatefulWidget {
  const videosScreen({super.key});

  @override
  State<videosScreen> createState() => _videosScreenState();
}

class _videosScreenState extends State<videosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      width: context.screenWidth / 2.5,
                      height: context.screenHeight / 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage(imageCamSta), fit: BoxFit.cover),
                      ),
                    ),
                    10.widthBox,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'خائف | فيلم قصير'
                            .text
                            .fontFamily(bold)
                            .size(14)
                            .color(blackColor.value)
                            .make(),
                        '3:30'
                            .text
                            .fontFamily(regular)
                            .size(12)
                            .color(blackColor.value)
                            .make(),
                        '1.8 ألف مشاهدة'
                            .text
                            .fontFamily(regular)
                            .size(12)
                            .color(blackColor.value)
                            .make(),
                      ],
                    )
                  ],
                )
                    .box
                    .height(context.screenHeight / 6)
                    //.color(greenColor)
                    .margin(EdgeInsets.symmetric(vertical: 12))
                    .make();
              },
            ).box.height(context.screenHeight / 1.8).make()
                  ],
                ),
          )),
    );
  }
}
