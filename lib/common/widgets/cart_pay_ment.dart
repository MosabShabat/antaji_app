import 'package:antaji_app/features/home_page/screens/buying_and_renting_a_product/shopping%20_cart_screen.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../constant/const.dart';
import 'custom_button.dart';

class cartPayMent extends StatefulWidget {
  final String price;
  final String promoCodeAmount;
  final String vat;
  final String total;
  final String currency;
  final int id;
  final String screen;
  final Widget rowWid;
  final Widget LocWid;

  cartPayMent({
    super.key,
    required this.price,
    required this.promoCodeAmount,
    required this.vat,
    required this.total,
    required this.currency,
    required this.id,
    required this.screen,
    required this.rowWid,
    required this.LocWid,
  });

  @override
  State<cartPayMent> createState() => _cartPayMentState();
}

class _cartPayMentState extends State<cartPayMent> {
  var pay_met;

  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int selectedIndex = 0;

  @override
  void initState() {
    // controllerPackage.Payment_Var.clear();
    // if (controllerPackage.isInitPay.value) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) async {
    //     await controllerPackage.getPackageDetails(widget.id);
    //   });
    //   controllerPackage.isInitPay(false);
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Obx(
        //   () =>
        // controllerPackage.isPackageDetailsLoading.value
        //     ? Center(
        //         child: CircularProgressIndicator(),
        //       )
        //     :
        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.heightBox,
        widget.LocWid,
        20.heightBox,
        widget.rowWid,
        20.heightBox,
        paymentMethod.tr.text.color(blackColor.value).bold.size(20).make(),
        20.heightBox,
        SizedBox(
            height: 70,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: index == selectedIndex ? redColor : greyColor,
                          width: 1.5,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset(
                            payMentTypes[index],
                          ),
                        ],
                      ),
                    ),
                  );
                })),
        20.heightBox,
        Bill.tr.text.color(blackColor.value).bold.size(20).make(),
        20.heightBox,
        ListTile(
          title:
              products.tr.text.color(blackColor.value).medium.size(12).make(),
          trailing: '${widget.price} ${widget.currency}'
              .text
              .color(blackColor.value)
              .fontFamily(medium)
              .size(14)
              .make(),
        ),
        Divider(
          thickness: 0.5,
          color: greyColor,
        ),
        ListTile(
            title: MultiDayDiscounts.tr.text
                .color(blackColor.value)
                .medium
                .size(12)
                .make(),
            trailing: '${widget.promoCodeAmount} ${widget.currency}'
                .text
                .color(blackColor.value)
                .fontFamily(medium)
                .size(14)
                .color(Color(0xFF028C59))
                .make()),
        Divider(
          thickness: 0.5,
          color: greyColor,
        ),
        ListTile(
            title: commission.tr.text
                .color(blackColor.value)
                .medium
                .size(12)
                .make(),
            trailing: '${widget.vat} ${widget.currency}'
                .text
                .color(blackColor.value)
                .fontFamily(medium)
                .size(14)
                .make()),
        Divider(
          thickness: 0.5,
          color: greyColor,
        ),
        ListTile(
          title:
              delivery.tr.text.color(blackColor.value).medium.size(12).make(),
          trailing: '0 ${widget.currency}'
              .text
              .color(blackColor.value)
              .fontFamily(medium)
              .size(14)
              .make(),
        ),
        Divider(
          thickness: 0.5,
          color: greyColor,
        ),
        ListTile(
          title: Total.tr.text.color(blackColor.value).medium.size(12).make(),
          trailing: '${widget.total} ${widget.currency}'
              .text
              .maxLines(2)
              .color(blackColor.value)
              .fontFamily(medium)
              .size(14)
              .make(),
        ),
        20.heightBox,
        // Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: CustomButton(
        //     text: pay.tr,
        //     onPressed: () async => await _performPayment(),
        //     textColor: whiteColor.value,
        //     backgroundColor: mainColor,
        //     borderColor: mainColor,
        //   ),
        // ),
      ],
    );
    // );
  }

  Future<void> _performPayment() async {
    if (_checkData()) {
      await Payment();
    }
  }

  bool _checkData() {
    if (selectedIndex == 0) {
      pay_met = 1;
      return true;
    } else if (selectedIndex == 1) {
      pay_met = 2;
      return true;
    } else if (selectedIndex == 2) {
      pay_met = 3;
      return true;
    } else if (selectedIndex == 3) {
      pay_met = 4;
      return true;
    }

    Get.snackbar('message', 'Something is Wrong');
    return false;
  }

  Future<void> Payment() async {
    // Response.Response response = await Get.find<AuthGetxController>().PayMet(
    //   id: widget.id,
    //   payment_method_id: '$pay_met',
    //   code: '',
    // );
    // print(response.data);

    // if (response.status!) {
    //   VxToast.show(context, msg: 'Payment Successfully');
    //   String url = response.data['url'];
    //   print('++++++++++++++++++++++++++++++');
    //   print(pay_met);
    //   print('++++++++++++++++++++++++++++++');
    //   Get.off(
    //     () => WebViewScreen(
    //       url: url,
    //     )

    //     // widget.screen == 'successfullyScreen'
    //     //     ? successfullyScreen()
    //     //     : PurchaseSuccessfullyScreen()

    //     ,
    //     transition: Transition.leftToRight,
    //   );
    // }

    // Get.snackbar(
    //   "message",
    //   response.message!,
    //   backgroundColor: response.status! ? Colors.green : Colors.red,
    //   colorText: Colors.color(whiteColor.value),
    // );
  }
}

class cartBottomSheet extends StatefulWidget {
  const cartBottomSheet({super.key});

  @override
  State<cartBottomSheet> createState() => _cartBottomSheetState();
}

class _cartBottomSheetState extends State<cartBottomSheet> {
  List<PickerDateRange> selectedDateRanges = [];
  List<int> daysBetweenList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Summary.tr.text
                    .fontFamily(medium)
                    .size(14)
                    .color(blackColor.value)
                    .make(),
                ListTile(
                  leading: rentalPrice.tr.text
                      .fontFamily(bold)
                      .size(14)
                      .color(blackColor.value)
                      .make(),
                  trailing: '800'
                      .tr
                      .text
                      .fontFamily(bold)
                      .size(14)
                      .color(blackColor.value)
                      .make(),
                ),
                SfDateRangePicker(
                  rangeTextStyle: TextStyle(
                    color: blackColor.value,
                  ),
                  headerStyle: DateRangePickerHeaderStyle(
                    textStyle: TextStyle(
                      color: blackColor.value,
                      fontFamily: medium,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  enableMultiView: false,
                  monthCellStyle: DateRangePickerMonthCellStyle(
                      blackoutDateTextStyle: TextStyle(
                    color: blackColor.value,
                  )),
                  selectionTextStyle: TextStyle(
                    color: blackColor.value,
                  ),
                  view: DateRangePickerView.month,
                  selectionMode: DateRangePickerSelectionMode.range,
                  navigationDirection:
                      DateRangePickerNavigationDirection.horizontal,
                  endRangeSelectionColor: redColor,
                  startRangeSelectionColor: redColor,
                  rangeSelectionColor: redColor.withOpacity(0.2),
                  onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                    setState(() {
                      selectedDateRanges = [
                        dateRangePickerSelectionChangedArgs.value
                      ];
                      daysBetweenList =
                          calculateDaysBetween(selectedDateRanges);

                      print('selectedDateRanges == $selectedDateRanges');
                      print('daysBetweenList == $daysBetweenList');
                    });
                  },
                )
                    .box
                    .width(context.screenWidth)
                    .color(whiteColor.value)
                    .alignment(Alignment.center)
                    .height(context.screenHeight / 2.8)
                    .margin(EdgeInsets.symmetric(
                      vertical: 12,
                      //   horizontal: 12,
                    ))
                    .make(),
              ],
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RentalSummary.tr.text
                .fontFamily(bold)
                .color(blackColor.value)
                .size(14)
                .make(),
          ],
        )
            .box
            .height(context.screenHeight / 16)
            .width(context.screenWidth)
            .color(lightColor.value)
            .make(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Column(
            children: [
              payMentListTail(),
              CustomButton(
                text: SaveAndAdd.tr,
                textColor: whiteColor.value,
                backgroundColor: redColor,
                borderColor: redColor,
                onPressed: () {
                  Get.back();

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 2),
                      backgroundColor: whiteColor.value,
                      dismissDirection: DismissDirection.horizontal,
                      content: Column(
                        children: [
                          VxDivider(
                            width: 3,
                            color: greenColor,
                          ).box.width(context.screenWidth).make(),
                          ListTile(
                            leading: CircleAvatar(
                              radius: 15,
                              backgroundColor: blackColor.value,
                              child: Center(
                                child: Icon(
                                  Icons.done,
                                  color: whiteColor.value,
                                ),
                              ),
                            ),
                            title: NewHasBeenAddedSuccessfully.tr.text
                                .fontFamily(medium)
                                .color(blackColor.value)
                                .size(14)
                                .make(),
                            trailing: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ViewCart.tr.text
                                    .fontFamily(medium)
                                    .color(whiteColor.value)
                                    .size(12)
                                    .make(),
                              ],
                            )
                                .box
                                .height(context.screenHeight / 20)
                                .width(context.screenWidth / 5)
                                .color(blackColor.value)
                                .rounded
                                .make()
                                .onTap(() {
                              Get.to(
                                () => ShoppingCartScreen(),
                                transition: Transition.rightToLeft,
                              );
                            }),
                          )
                              .box
                              .width(context.screenWidth)
                              .height(context.screenHeight / 18)
                              .color(whiteColor.value)
                              .make(),
                        ],
                      )));
                },
              ).box.height(60).width(context.screenWidth).make(),
            ],
          ),
        )
      ],
    );
  }

  List<int> calculateDaysBetween(List<PickerDateRange> ranges) {
    List<int> daysBetween = [];
    for (var range in ranges) {
      if (range.startDate != null && range.endDate != null) {
        int days = range.endDate!.difference(range.startDate!).inDays + 1;
        daysBetween.add(days);
      }
    }
    return daysBetween;
  }
}

class payMentListTail extends StatelessWidget {
  const payMentListTail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: '800 ر.س  X 6 أيام'
              .tr
              .text
              .fontFamily(medium)
              .size(14)
              .color(blackColor.value)
              .make(),
          trailing: '4800 ر.س'
              .tr
              .text
              .fontFamily(medium)
              .size(14)
              .color(blackColor.value)
              .make(),
        ),
        ListTile(
          leading: MultiDayDiscounts.tr.text
              .fontFamily(medium)
              .size(14)
              .color(blackColor.value)
              .make(),
          trailing: '4800 ر.س'
              .tr
              .text
              .fontFamily(medium)
              .size(14)
              .color(blackColor.value)
              .make(),
        ),
        ListTile(
          leading: commission.tr.text
              .fontFamily(medium)
              .size(14)
              .color(blackColor.value)
              .make(),
          trailing: '4800 ر.س'
              .tr
              .text
              .fontFamily(medium)
              .size(14)
              .color(blackColor.value)
              .make(),
        ),
        ListTile(
          leading: Total.tr.text
              .fontFamily(medium)
              .size(14)
              .color(greenColor)
              .make(),
          trailing: '4800 ر.س'
              .tr
              .text
              .fontFamily(medium)
              .size(14)
              .color(greenColor)
              .make(),
        ),
      ],
    );
  }
}
