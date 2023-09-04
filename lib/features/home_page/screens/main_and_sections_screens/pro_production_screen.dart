import 'package:antaji_app/models/product_of_professionals_model.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../controller/home_page_controller.dart';

class ProProductionScreen extends StatefulWidget {
  final String title;
  final String url;
  final int type;
  const ProProductionScreen(
      {super.key, required this.title, required this.url, required this.type});

  @override
  State<ProProductionScreen> createState() => _ProProductionScreenState();
}

class _ProProductionScreenState extends State<ProProductionScreen> {
    var controller_home_pag_var = Get.put(HomePageController());


@override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller_home_pag_var.getSeeAll(
        type: widget.type,
        url: widget.url,
      );
    });
  }
  Future<void> _refreshData() async {
    await controller_home_pag_var.getSeeAll(
      refresh: true,
      type: widget.type,
      url: widget.url,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: SameAppBar(context, hint: research.tr),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Obx(
          () => controller_home_pag_var.isDataSeeAllLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         '${widget.title}'.text
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
                          itemCount: controller_home_pag_var
                                      .product_of_professionals_var.length,
                          itemBuilder: (context, index) {
                             productOfProfessionals data =
                                        controller_home_pag_var
                                            .product_of_professionals_var[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: context.screenWidth,
                                  height: context.screenHeight / 5,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                                    '${data.image!}'),
                                        fit: BoxFit.fitWidth,
                                      )),
                                ),
                                20.heightBox,
                                Text(
                                   '${data.title!}',
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
                                      backgroundImage: NetworkImage(
                                                    '${data.artistImage!}'),
                                    ),
                                    10.widthBox,
                                 '${data.artistName!}'
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
      ),
    );
  }
}
