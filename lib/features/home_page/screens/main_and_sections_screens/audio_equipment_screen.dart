import 'package:antaji_app/features/home_page/screens/main_and_sections_screens/audio_equipment_dt_screen.dart';

import '../../controller/home_page_controller.dart';

class audioEquipmentScreen extends StatefulWidget {
  const audioEquipmentScreen({super.key});

  @override
  State<audioEquipmentScreen> createState() => _audioEquipmentScreenState();
}

class _audioEquipmentScreenState extends State<audioEquipmentScreen> {
  Future<void> _refreshData() async {
    // Your refresh logic goes here
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  soundEquipment.tr.text
                      .fontFamily(bold)
                      .color(blackColor.value)
                      .size(24)
                      .make(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  'حزم الصوت'
                                      .text
                                      .fontFamily(bold)
                                      .size(18)
                                      .color(blackColor.value)
                                      .make(),
                                  10.heightBox,
                                  ' 301 منتج'
                                      .text
                                      .fontFamily(medium)
                                      .size(14)
                                      .color(blackColor.value)
                                      .make()
                                ],
                              ),
                              SvgPicture.asset(
                                ImagesCam,
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                          20.heightBox,
                          Divider(
                            thickness: 1,
                          )
                        ],
                      )
                          .box
                          .height(context.screenHeight / 4.5)
                          .color(whiteColor.value)
                          .width(context.screenWidth / 1.5)
                          .make()
                          .onTap(() {
                        Get.to(
                          () => audioEquipmentDtScreen(),
                          transition: Transition.rightToLeft,
                        );
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
