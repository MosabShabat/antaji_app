import 'package:antaji_app/constant/const.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FocusNode focusNode = FocusNode();
  final _messageController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: context.screenWidth,
              height: context.screenHeight,

              // color: greenColor,
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    20.heightBox,
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(UserImage),
                    ),
                    20.heightBox,
                    'ميلا الزهراني'
                        .text
                        .color(blackColor.value)
                        .fontFamily(bold)
                        .size(14)
                        .make(),
                    10.heightBox,
                    'تصوير سينمائي'
                        .text
                        .color(blackColor.value)
                        .fontFamily(medium)
                        .size(12)
                        .make(),
                    30.heightBox,
                    '22/05/2023'
                        .text
                        .color(blackColor.value)
                        .fontFamily(medium)
                        .size(12)
                        .make(),
                    40.heightBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'وظيفة مدير التصوير الفوتوغرافي'
                            .text
                            .fontFamily(bold)
                            .size(14)
                            .color(blackColor.value)
                            .make(),
                        20.heightBox,
                        'يتم تنسيق التاريخ مباشرة مع الموضوع. نصف يوم تصوير. مقابلة شخص واحد سواء في منزلهم أو مكتبهم في مدينة الرياض'
                            .text
                            .fontFamily(medium)
                            .size(12)
                            .maxLines(2)
                            .lineHeight(2)
                            .color(blackColor.value)
                            .make(),
                        10.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(moneysImage),
                            5.widthBox,
                            '100 ر.س / يوم'
                                .text
                                .fontFamily(bold)
                                .size(12)
                                .color(blackColor.value)
                                .make()
                          ],
                        ),
                        20.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(calendarImage),
                                10.widthBox,
                                '${starts.tr}  10/06/2023'
                                    .text
                                    .fontFamily(medium)
                                    .size(12)
                                    .color(blackColor.value)
                                    .make(),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(LightLocationIcon),
                                10.widthBox,
                                'الرياض'
                                    .text
                                    .fontFamily(medium)
                                    .size(12)
                                    .color(blackColor.value)
                                    .make(),
                                10.widthBox,
                                SvgPicture.asset(clockImage),
                                10.widthBox,
                                'قبل 3 ساعات'
                                    .text
                                    .fontFamily(medium)
                                    .size(12)
                                    .color(blackColor.value)
                                    .make(),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                        .box
                        .height(context.screenHeight / 4.5)
                        .width(context.screenWidth)
                        .padding(EdgeInsets.all(12))
                        .color(lightColor.value)
                        .rounded
                        .margin(EdgeInsets.all(8))
                        .make(),
                  ],
                ),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            child: TextFormField(
              focusNode: focusNode,
              controller: _messageController,
              decoration: InputDecoration(
                suffixIcon: SvgPicture.asset(
                  sendIcon,
                ),
                prefixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      VectorAddIcon,
                      color: blackColor.value,
                    ),
                    SvgPicture.asset(
                      microphoneIcon,
                      color: blackColor.value,
                    ),
                    SvgPicture.asset(
                      locationAdd,
                      color: blackColor.value,
                    ),
                    SvgPicture.asset(
                      paperclip2Icon,
                      color: blackColor.value,
                    ),
                    SvgPicture.asset(
                      galleryIcon,
                      color: blackColor.value,
                    ),
                  ],
                )
                    .box
                    .width(context.screenWidth / 2.8)
                    .padding(EdgeInsets.symmetric(
                      horizontal: 12,
                    ))
                    .make(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                hintText: WriteHere.tr,
                hintStyle: TextStyle(
                  color: blackColor.value,
                  fontFamily: medium,
                  fontSize: 16,
                ),
                fillColor: lightColor.value,
                focusColor: blueColor,
                filled: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
