import '../../../../common/widgets/custom_button.dart';
import '../../controller/home_page_controller.dart';

class ProProductionScreen extends StatefulWidget {
  const ProProductionScreen({super.key});

  @override
  State<ProProductionScreen> createState() => _ProProductionScreenState();
}

class _ProProductionScreenState extends State<ProProductionScreen> {
  Future<void> _refreshData() async {
    // Your refresh logic goes here
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: SameAppBar(context, hint: research.tr),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProPRODUCTION.tr.text
                          .fontFamily(bold)
                          .color(blackColor.value)
                          .size(24)
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
                      ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: context.screenWidth,
                                height: context.screenHeight / 5,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    image: DecorationImage(
                                      image: AssetImage(imageCamSta),
                                      fit: BoxFit.fitWidth,
                                    )),
                              ),
                              20.heightBox,
                              Text(
                                'خائف | فيلم قصير (حائز على جائزة) 2019',
                                maxLines: 2,
                                style: TextStyle(
                                    fontFamily: bold,
                                    fontSize: 12,
                                    color: blackColor.value),
                              ),
                              10.heightBox,
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(UserImage),
                                  ),
                                  10.widthBox,
                                  'كاتي سانت جون'
                                      .text
                                      .fontFamily(medium)
                                      .size(12)
                                      .color(blackColor.value)
                                      .make(),
                                ],
                              )
                            ],
                          )
                              .box
                              .height(context.screenHeight / 3.2)
                              .color(whiteColor.value)
                              .width(context.screenWidth / 1.5)
                              .make();
                        },
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
