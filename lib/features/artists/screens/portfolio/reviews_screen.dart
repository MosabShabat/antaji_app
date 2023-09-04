import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/models/users_model.dart';

class ReviewsScreen extends StatefulWidget {
  final List<Reviews> rev_data;
  const ReviewsScreen({super.key, required this.rev_data});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              '${reviews.tr}  (${widget.rev_data.length} )'
                  .text
                  .fontFamily(bold)
                  .size(24)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: widget.rev_data.length,
                itemBuilder: (context, index) {
                  var data = widget.rev_data[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage('${data.userImage}'),
                      ),
                      10.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              '${data.userName}'
                                  .text
                                  .fontFamily(bold)
                                  .size(14)
                                  .color(blackColor.value)
                                  .make(),
                              10.widthBox,
                              '.   ${data.timeAgo} '
                                  .text
                                  .fontFamily(regular)
                                  .size(12)
                                  .color(greyColor)
                                  .make(),
                            ],
                          ),
                          Container(
                            child: Text(
                              '${data.title}',
                              maxLines: 2,
                              style: TextStyle(
                                fontFamily: regular,
                                fontSize: 14,
                                color: blackColor.value,
                              ),
                            ),
                          )
                              .box
                              .height(
                                context.screenHeight / 18,
                              )
                              .width(
                                context.screenWidth * 0.6,
                              )
                              .make(),
                        ],
                      )
                    ],
                  )
                      .box
                      .height(context.screenHeight / 9)
                      .width(context.screenWidth / 4)
                      // .color(lightColor)
                      .withRounded(value: 24)
                      .margin(EdgeInsets.symmetric(vertical: 12.0))
                      .make();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
