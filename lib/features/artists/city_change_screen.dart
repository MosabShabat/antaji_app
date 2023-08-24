import 'package:antaji_app/constant/const.dart';

import '../../common/widgets/custom_button.dart';

class CityChangeScreen extends StatefulWidget {
  const CityChangeScreen({super.key});

  @override
  State<CityChangeScreen> createState() => _CityChangeScreenState();
}

class _CityChangeScreenState extends State<CityChangeScreen> {
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
              CityChange.tr.text.fontFamily(bold).size(24).black.make(),
              20.heightBox,
              MyTextField(
                  hintText: CitySearch.tr,
                  Radius: 50.0,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  obscureText: false,
                  readOnly: false,
                  prefixIcon: Icon(
                    Icons.search,
                  )),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
