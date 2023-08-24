import '../../../../common/widgets/custom_button.dart';
import '../../../../constant/const.dart';

class audioEquipmentDtScreen extends StatefulWidget {
  const audioEquipmentDtScreen({super.key});

  @override
  State<audioEquipmentDtScreen> createState() => _audioEquipmentDtScreenState();
}

class _audioEquipmentDtScreenState extends State<audioEquipmentDtScreen> {
  Future<void> _refreshData() async {
    // Your refresh logic goes here
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: SameAppBar(context, hint: SearchForProducts.tr),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'حزم الصوت'
                          .tr
                          .text
                          .fontFamily(bold)
                          .size(24)
                          .color(blackColor.value)
                          .make(),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RankingBottomSheet(),
                          FilterBottomSheet(),
                        ],
                      ),
                      20.heightBox,
                      GridView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                                      color: greenColor,
                                      image: DecorationImage(
                                        image: AssetImage(imageCamSta),
                                        fit: BoxFit.cover,
                                      )),
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
                          }),
                    ]))
          ],
        ),
      ),
    );
  }
}
