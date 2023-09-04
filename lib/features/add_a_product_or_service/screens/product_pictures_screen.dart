import 'dart:io';
import 'package:antaji_app/features/add_a_product_or_service/screens/add_successfully_screen.dart';
import 'package:antaji_app/features/auth/controller/auth_getx_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:multi_image_picker/multi_image_picker.dart';
import '../../../constant/const.dart';

class ProductPicturesScreen extends StatefulWidget {
  final String type;
  final String name;
  final String price;
  final String category_uuid;
  final String sub_category_uuid;
  final String lat;
  final String lng;
  final String address;
  final String details;
  final List<String> keyText;
  final List<String> valueText;

  const ProductPicturesScreen({
    Key? key,
    required this.type,
    required this.name,
    required this.price,
    required this.category_uuid,
    required this.sub_category_uuid,
    required this.lat,
    required this.lng,
    required this.address,
    required this.details,
    required this.keyText,
    required this.valueText,
  }) : super(key: key);

  @override
  State<ProductPicturesScreen> createState() => _ProductPicturesScreenState();
}

class _ProductPicturesScreenState extends State<ProductPicturesScreen> {
  var autController = Get.put(AuthGetxController());
  List<File> selectedImages = []; 
  final picker = ImagePicker();

  Future<void> _pickImages() async {
    final pickedImages = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedImages != null) {
      setState(() {
        selectedImages.add(File(pickedImages.path));
      });
    }
  }

  Widget _buildSelectedImages() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: context.screenHeight / 3.5,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: selectedImages.isEmpty ? 1 : selectedImages.length + 1,
      itemBuilder: (context, index) {
        var imageFile;
        // = selectedImages[index];
        index == 0 ? "" : imageFile = selectedImages[index - 1];

        return index == 0
            ? DottedBorder(
                color: greyColor,
                radius: Radius.circular(10),
                borderType: BorderType.RRect,
                strokeWidth: 1.5,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        galleryAddIcon,
                        color: blackColor.value,
                      ),
                      10.heightBox,
                      AddPhotos.tr.text
                          .fontFamily(regular)
                          .size(12)
                          .color(blackColor.value)
                          .make(),
                    ],
                  ),
                ),
              ).box.rounded.padding(const EdgeInsets.all(8.0)).make().onTap(() {
                _pickImages();
              })
            : Container(
                width: context.screenWidth / 2.2,
                height: context.screenHeight / 3.5,
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: FileImage(imageFile), fit: BoxFit.fill)),
                child: Stack(
                  children: [
                    Positioned(
                      top: 5,
                      left: 5,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedImages.removeAt(index);
                          });
                        },
                        child: Icon(
                          Icons.close,
                          size: 20,
                          color: whiteColor.value,
                        ).box.roundedFull.color(blackColor.value).make(),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  @override
  void initState() {
    print(widget.type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container()
                  .box
                  .height(context.screenHeight / 150)
                  .width(context.screenWidth / 12)
                  .rounded
                  .color(blackColor.value)
                  .make(),
              Container()
                  .box
                  .height(context.screenHeight / 150)
                  .width(context.screenWidth / 12)
                  .rounded
                  .color(blackColor.value)
                  .make(),
            ],
          )
              .box
              .margin(EdgeInsets.symmetric(horizontal: 15))
              .width(context.screenWidth / 5)
              .make()
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          toPublish.tr.text
              .fontFamily(bold)
              .color(whiteColor.value)
              .size(18)
              .make(),
        ],
      )
          .box
          .height(context.screenHeight / 16)
          .width(context.screenWidth)
          .margin(EdgeInsets.symmetric(vertical: 12, horizontal: 20))
          .color(blackColor.value)
          .rounded
          .make()
          .onTap(() async {
        await _AddProd();
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductPictures.tr.text
                  .fontFamily(bold)
                  .color(blackColor.value)
                  .size(24)
                  .make(),
              20.heightBox,
              _buildSelectedImages(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _AddProd() async {
    final response = await autController.Add_prod(
      address: widget.address,
      category_uuid: widget.category_uuid,
      details: widget.details,
      keys: widget.keyText,
      lat: widget.lat,
      lng: widget.lng,
      name: widget.name,
      price: widget.price,
      sub_category_uuid: widget.sub_category_uuid,
      type: widget.type,
      values: widget.valueText,
      image: selectedImages,
    );
    if (response.status!) {
      VxToast.show(context, msg: 'Edit Profile Successfully');
      Get.off(
        () => addSuccessfullyScreen(
          type: 'products',
          uuid: response.data['uuid'],
        ),
        transition: Transition.rightToLeft,
      );
    }

    Get.snackbar(
      "message",
      response.message!,
      backgroundColor: response.status! ? Colors.green : Colors.red,
      colorText: Colors.white,
    );
  }
}
