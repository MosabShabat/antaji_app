import '../../../common/widgets/custom_button.dart';
import '../../../constant/const.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.screenWidth,
        height: context.screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                BGImage,
              )),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        'الكل'
                            .tr
                            .text
                            .fontFamily(medium)
                            .size(12)
                            .color(whiteColor.value)
                            .make(),
                      ],
                    )
                        .box
                        .height(context.screenHeight / 20)
                        .width(context.screenWidth / 4)
                        .color(index == selectedIndex ? redColor : blackColor.value)
                        .withRounded(value: 24)
                        .padding(EdgeInsets.all(8))
                        .margin(EdgeInsets.only(left: 8))
                        .make()
                        .onTap(() {
                      setState(() {
                        selectedIndex = index;
                      });
                    });
                  },
                ).box.height(context.screenHeight / 20).make(),
                20.heightBox,
                MyTextField(
                    hintText: FindPhotograPhyRequirement.tr,
                    Radius: 12.0,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    obscureText: false,
                    readOnly: false,
                    prefixIcon: Icon(
                      Icons.search,
                      color: blackColor.value,
                    )),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(globeEarthIcon),
                        Divider(
                          height: 5,
                          color: greyColor,
                        ),
                        SvgPicture.asset(pathIcon),
                      ],
                    )
                        .box
                        .height(context.screenHeight / 10)
                        .width(context.screenWidth / 8)
                        .color(lightColor.value)
                        .rounded
                        .make()
                  ],
                ).box.height(context.screenHeight / 10).make(),
                40.heightBox
              ],
            ),
          ),
        ),
      ),
    );
  }
}
