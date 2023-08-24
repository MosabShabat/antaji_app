import 'package:antaji_app/features/favorite/screens/favorite_artists_screen.dart';
import 'package:antaji_app/features/favorite/screens/favorite_products_screen.dart';
import 'package:antaji_app/features/favorite/screens/favorite_professionals_screen.dart';

import '../../../constant/const.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Favorite.tr.text
                  .fontFamily(bold)
                  .size(24)
                  .color(blackColor.value)
                  .make(),
              20.heightBox,
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: context.screenHeight / 15,
                  width: context.screenWidth,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: lightColor.value,
                      borderRadius: BorderRadius.circular(25.0)),
                  child: TabBar(
                    controller: tabController,
                    indicator: BoxDecoration(
                        color: blackColor.value,
                        borderRadius: BorderRadius.circular(25.0)),
                    labelColor: whiteColor.value,
                    unselectedLabelColor: blackColor.value,
                    tabs: [
                      Tab(
                        text: products.tr,
                      ),
                      Tab(
                        text: artists.tr,
                      ),
                      Tab(
                        text: professionals.tr,
                      ),
                    ],
                  ),
                ),
              ),
              TabBarView(
                controller: tabController,
                children: [
                  FavoriteProductsScreen(),
                  FavoriteArtistsScreen(),
                  FavoriteProfessionalsScreen(),
                ],
              ).box.height(context.screenHeight).make(),
            ],
          ),
        ),
      ),
    );
  }
}
