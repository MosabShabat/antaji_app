import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/conversationss_sessions_notifications/screens/controller/cover_controller.dart';
import 'package:lottie/lottie.dart';
import '../../artists/screens/portfolio/course_details_screen.dart';

class coursesDrawerScreen extends StatefulWidget {
  const coursesDrawerScreen({super.key});

  @override
  State<coursesDrawerScreen> createState() => _coursesDrawerScreenState();
}

//ChatDrawerScreen
class _coursesDrawerScreenState extends State<coursesDrawerScreen> {
  var my_courses_controller = Get.put(ConVerController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await my_courses_controller.getMyCourses();
    });
    super.initState();
  }

  Future<void> _refreshData() async {
    await my_courses_controller.getMyCourses(
      refresh: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Obx(
          () => my_courses_controller.isDataCorsesLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        my_courses_controller.my_courses_model_Var.isEmpty
                            ? Column(
                                children: [
                                  Lottie.asset(NoResults),
                                  ThereIsNoDataYet.tr.text
                                      .fontFamily(bold)
                                      .size(20)
                                      .color(blackColor.value)
                                      .make()
                                ],
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: my_courses_controller
                                    .my_courses_model_Var.length,
                                itemBuilder: (context, index) {
                                  var courses_data = my_courses_controller
                                      .my_courses_model_Var[index];
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: context.screenWidth,
                                        height: context.screenHeight / 5,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  '${courses_data.cover!}'),
                                              fit: BoxFit.fitWidth,
                                            )),
                                        child: Center(
                                          child: CircleAvatar(
                                              radius: context.screenWidth / 18,
                                              backgroundColor:
                                                  Color(0xFF707070),
                                              child: SvgPicture.asset(
                                                video_play_icon,
                                                width: context.screenWidth / 18,
                                                height:
                                                    context.screenHeight / 36,
                                              )),
                                        ),
                                      ),
                                      20.heightBox,
                                      Text(
                                        '${courses_data.name!}',
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontFamily: bold,
                                            fontSize: 12,
                                            color: blackColor.value),
                                      ),
                                      10.heightBox,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundColor: greenColor,
                                                backgroundImage: NetworkImage(
                                                    '${courses_data.userImage!}'),
                                              ),
                                              10.widthBox,
                                              '${courses_data.userName!}'
                                                  .text
                                                  .fontFamily(bold)
                                                  .size(14)
                                                  .color(greenColor)
                                                  .make()
                                            ],
                                          ),
                                          '${courses_data.count!}   ${videos.tr}'
                                              .text
                                              .fontFamily(bold)
                                              .size(14)
                                              .color(greenColor)
                                              .make()
                                        ],
                                      )
                                    ],
                                  )
                                      .box
                                      .height(context.screenHeight / 3.2)
                                      .color(whiteColor.value)
                                      .width(context.screenWidth / 1.5)
                                      .make()
                                      .onTap(() {
                                    Get.to(
                                      () => CourseDetailsScreen(
                                        uuid: courses_data.uuid!,
                                        cover_video: courses_data.cover!,
                                      ),
                                      transition: Transition.rightToLeft,
                                    );
                                  });
                                },
                              ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
