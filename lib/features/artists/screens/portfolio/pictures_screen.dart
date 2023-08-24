import 'package:antaji_app/constant/const.dart';
import 'package:antaji_app/features/artists/screens/portfolio/full_screen_pictures_screen.dart';

class picturesScreen extends StatefulWidget {
  const picturesScreen({super.key});

  @override
  State<picturesScreen> createState() => _picturesScreenState();
}

class _picturesScreenState extends State<picturesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: context.height / 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 4,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          //color: greenColor,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          image: DecorationImage(
                            image: AssetImage(imageCamSta),
                            fit: BoxFit.cover,
                          )),
                    ).box.make().onTap(() {
                      Get.to(
                        () => FullScreenPicturesScreen(),
                        transition: Transition.rightToLeft,
                      );
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
