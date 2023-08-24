import 'package:antaji_app/features/artists/screens/artists_screen.dart';
import 'package:antaji_app/features/filming_locations/screens/filming_locations_screen.dart';
import 'package:antaji_app/features/maps/screens/map_screen.dart';
import 'package:antaji_app/features/register_an_account/screens/services_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../../../common/widgets/exit_dialog.dart';
import '../../../constant/const.dart';
import '../../home_page/screens/home_page_screen.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  final int initialTabIndex;
  const HomeScreen({Key? key, required this.initialTabIndex}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = Get.find<HomeController>();
  PersistentTabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: widget.initialTabIndex);
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    try {
      return [
        PersistentBottomNavBarItem(
          inactiveIcon: CircleAvatar(
            radius: 20,
            backgroundColor: whiteColor.value,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                HomeLightIcon,
                color: blackColor.value,
              ),
            ),
          ),
          icon: CircleAvatar(
            radius: 20,
            backgroundColor: whiteColor.value,
            child: SvgPicture.asset(
              HomeBoldIcon,
              // width: width,
              // height: height,
            ),
          ),
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: CircleAvatar(
            radius: 20,
            backgroundColor: whiteColor.value,
            child: SvgPicture.asset(
              personLightIcon,
              color: blackColor.value,
            ),
          ),
          icon: CircleAvatar(
            radius: 20,
            backgroundColor: whiteColor.value,
            child: SvgPicture.asset(
              PersonBoldIcon,
            ),
          ),
        ),
        PersistentBottomNavBarItem(
          activeColorPrimary: whiteColor.value,
          inactiveIcon: SvgPicture.asset(
            OpportunityUnSelectedIcon,
          ),
          icon: SvgPicture.asset(
            OpportunityIcon,
          ),
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: CircleAvatar(
            radius: 20,
            backgroundColor: whiteColor.value,
            child: SvgPicture.asset(
              LightLocationIcon,
              color: blackColor.value,
            ),
          ),
          icon: CircleAvatar(
            radius: 20,
            backgroundColor: whiteColor.value,
            child: SvgPicture.asset(
              BoldLocationIcon,
            ),
          ),
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: CircleAvatar(
            radius: 20,
            backgroundColor: whiteColor.value,
            child: SvgPicture.asset(
              LightMapIcon,
              color: blackColor.value,
            ),
          ),
          icon: CircleAvatar(
            radius: 20,
            backgroundColor: whiteColor.value,
            child: SvgPicture.asset(
              BoldMapIcon,
            ),
          ),
        ),
      ];
    } catch (e) {
      print('<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
      print('Error loading icons: $e');
      print('<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
      return [];
    }
  }

  _buildScreens() {
    return [
      HomePage(page: 0),
      ArtistsScreen(),
      ServicesScreen(),
      FilmingLocationsScreen(),
      MapScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => exitDialog(),
          );
          return false;
        },
        child: Scaffold(
            body: PersistentTabView(
          context,
          navBarHeight: context.screenHeight / 12,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          backgroundColor: whiteColor.value,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: whiteColor.value,
          ),
          navBarStyle: NavBarStyle.style15,
        )));
  }
}
