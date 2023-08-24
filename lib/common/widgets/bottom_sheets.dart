import '../../features/home_page/controller/home_page_controller.dart';
import 'custom_button.dart';

class RankingBottomSheet extends StatefulWidget {
  const RankingBottomSheet({super.key});

  @override
  State<RankingBottomSheet> createState() => _RankingBottomSheetState();
}

class _RankingBottomSheetState extends State<RankingBottomSheet> {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      backgroundColor: whiteColor.value,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        var controller = Get.put(HomePageController());

        return Container(
          height: context.screenHeight / 2,
          decoration: BoxDecoration(
            color: whiteColor.value,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Filter.tr.text
                    .fontFamily(medium)
                    .color(blackColor.value)
                    .size(14)
                    .make(),
                20.heightBox,
                AccordingToThePrice.tr.text
                    .fontFamily(medium)
                    .color(blackColor.value)
                    .size(14)
                    .make(),
                Obx(
                  () => Row(
                    children: [
                      '10'
                          .text
                          .fontFamily(medium)
                          .color(blackColor.value)
                          .size(12)
                          .make(),
                      Expanded(
                        child: Slider(
                          thumbColor: blackColor.value,
                          inactiveColor: lightColor.value,
                          activeColor: greyColor,
                          min: 10.0,
                          max: 7000.0,
                          value: controller.value.value,
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              controller.value.value = value;
                            });
                          },
                        ),
                      ),
                      '7000'
                          .text
                          .fontFamily(medium)
                          .color(blackColor.value)
                          .size(12)
                          .make(),
                    ],
                  ),
                ),
                20.heightBox,
                features.tr.text
                    .fontFamily(medium)
                    .color(blackColor.value)
                    .size(14)
                    .make(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _isChecked1,
                      activeColor: Colors.green,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked1 = value!;
                        });
                      },
                    ),
                    LatestReleases.tr.text
                        .fontFamily(medium)
                        .color(blackColor.value)
                        .size(14)
                        .make(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _isChecked2,
                      activeColor: Colors.green,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked2 = value!;
                        });
                      },
                    ),
                    bestSeller.tr.text
                        .fontFamily(medium)
                        .color(blackColor.value)
                        .size(14)
                        .make(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _isChecked3,
                      activeColor: Colors.green,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked3 = value!;
                        });
                      },
                    ),
                    mostWatched.tr.text
                        .fontFamily(medium)
                        .color(blackColor.value)
                        .size(14)
                        .make(),
                  ],
                ),
                50.heightBox,
                CustomButton(
                  text: Filter.tr,
                  textColor: whiteColor.value,
                  backgroundColor: blackColor.value,
                  borderColor: blackColor.value,
                  onPressed: () {},
                ).box.height(56).width(context.screenWidth - 40).make(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          ImagesFilter,
          color: blackColor.value,
        ),
        10.widthBox,
        Filtering.tr.text
            .fontFamily(medium)
            .color(blackColor.value)
            .size(12)
            .make(),
      ],
    )
        .box
        .height(45)
        .width(context.screenWidth / 2.3)
        .color(lightColor.value)
        .roundedSM
        .make()
        .onTap(() {
      _showFilterBottomSheet();
    });
  }
}

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  var controller = Get.put(HomePageController());

  void _showRankBottomSheet() {
    showModalBottomSheet(
      backgroundColor: whiteColor.value,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return Obx(
          () => Container(
            height: context.screenHeight / 2,
            decoration: BoxDecoration(
                color: whiteColor.value,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                )),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Ranking.tr.text
                      .fontFamily(medium)
                      .color(blackColor.value)
                      .size(14)
                      .make(),
                  20.heightBox,
                  AccordingToThePrice.tr.text
                      .fontFamily(medium)
                      .size(14)
                      .color(blackColor.value)
                      .make(),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FromTheTop.tr.text
                              .fontFamily(medium)
                              .color(
                                controller.isFromTheTopSelected.value
                                    ? redColor
                                    : blackColor.value,
                              )
                              .size(12)
                              .make(),
                        ],
                      )
                          .box
                          .height(45)
                          .width(context.screenWidth / 2.3)
                          .color(lightColor.value)
                          .border(
                            width: 1,
                            color: controller.isFromTheTopSelected.value
                                ? redColor
                                : lightColor.value,
                          )
                          .roundedSM
                          .make()
                          .onTap(() {
                        setState(() {
                          controller.isFromTheTopSelected.value = true;
                          controller.isWhoLeastSelected.value = false;
                        });
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          whoLeast.tr.text
                              .fontFamily(medium)
                              .color(controller.isWhoLeastSelected.value
                                  ? redColor
                                  : blackColor.value)
                              .size(12)
                              .make(),
                        ],
                      )
                          .box
                          .height(45)
                          .width(context.screenWidth / 2.3)
                          .color(lightColor.value)
                          .roundedSM
                          .border(
                            width: 1,
                            color: controller.isWhoLeastSelected.value
                                ? redColor
                                : lightColor.value,
                          )
                          .make()
                          .onTap(() {
                        setState(() {
                          controller.isFromTheTopSelected.value = false;
                          controller.isWhoLeastSelected.value = true;
                        });
                      }),
                    ],
                  ),
                  20.heightBox,
                  sortBy.tr.text
                      .fontFamily(medium)
                      .color(blackColor.value)
                      .size(14)
                      .make(),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ofTheNewest.tr.text
                              .fontFamily(medium)
                              .color(controller.isFromTheNewestSelected.value
                                  ? redColor
                                  : blackColor.value)
                              .size(12)
                              .make(),
                        ],
                      )
                          .box
                          .height(45)
                          .width(context.screenWidth / 2.3)
                          .color(lightColor.value)
                          .border(
                            width: 1,
                            color: controller.isFromTheNewestSelected.value
                                ? redColor
                                : lightColor.value,
                          )
                          .roundedSM
                          .make()
                          .onTap(() {
                        setState(() {
                          controller.isFromTheNewestSelected.value = true;
                          controller.isAlphabeticalOrderSelected.value = false;
                        });
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          fromTheOldest.tr.text
                              .fontFamily(medium)
                              .color(
                                  controller.isAlphabeticalOrderSelected.value
                                      ? redColor
                                      : blackColor.value)
                              .size(12)
                              .make(),
                        ],
                      )
                          .box
                          .height(45)
                          .width(context.screenWidth / 2.3)
                          .color(lightColor.value)
                          .roundedSM
                          .border(
                            width: 1,
                            color: controller.isAlphabeticalOrderSelected.value
                                ? redColor
                                : lightColor.value,
                          )
                          .make()
                          .onTap(() {
                        setState(() {
                          controller.isFromTheNewestSelected.value = false;
                          controller.isAlphabeticalOrderSelected.value = true;
                        });
                      }),
                    ],
                  ),
                  20.heightBox,
                  AlphabeticalOrder.tr.text
                      .fontFamily(medium)
                      .color(blackColor.value)
                      .size(14)
                      .make(),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          fromZA.tr.text
                              .fontFamily(medium)
                              .color(controller.isFromAZSelected.value
                                  ? redColor
                                  : blackColor.value)
                              .size(12)
                              .make(),
                        ],
                      )
                          .box
                          .height(45)
                          .width(context.screenWidth / 2.3)
                          .color(lightColor.value)
                          .border(
                            width: 1,
                            color: controller.isFromAZSelected.value
                                ? redColor
                                : lightColor.value,
                          )
                          .roundedSM
                          .make()
                          .onTap(() {
                        setState(() {
                          controller.isFromAZSelected.value = true;
                          controller.isFromZASelected.value = false;
                        });
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          fromZA.tr.text
                              .fontFamily(medium)
                              .color(controller.isFromZASelected.value
                                  ? redColor
                                  : blackColor.value)
                              .size(12)
                              .make(),
                        ],
                      )
                          .box
                          .height(45)
                          .width(context.screenWidth / 2.3)
                          .color(lightColor.value)
                          .roundedSM
                          .border(
                            width: 1,
                            color: controller.isFromZASelected.value
                                ? redColor
                                : lightColor.value,
                          )
                          .make()
                          .onTap(() {
                        setState(() {
                          controller.isFromAZSelected.value = false;
                          controller.isFromZASelected.value = true;
                        });
                      }),
                    ],
                  ),
                  20.heightBox,
                  CustomButton(
                    text: Filter.tr,
                    textColor: whiteColor.value,
                    backgroundColor: blackColor.value,
                    borderColor: blackColor.value,
                    onPressed: () {},
                  ).box.height(56).width(context.screenWidth - 40).make(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          ImagesSort,
          color: blackColor.value,
        ),
        10.widthBox,
        Ranking.tr.text
            .fontFamily(medium)
            .color(blackColor.value)
            .size(12)
            .make(),
      ],
    )
        .box
        .height(45)
        .width(context.screenWidth / 2.3)
        .color(lightColor.value)
        .roundedSM
        .make()
        .onTap(() {
      _showRankBottomSheet();
    });
  }
}

class orderProductBottomSheet extends StatefulWidget {
  const orderProductBottomSheet({super.key});

  @override
  State<orderProductBottomSheet> createState() =>
      _orderProductBottomSheetState();
}

class _orderProductBottomSheetState extends State<orderProductBottomSheet> {
  var controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight / 2.6,
      decoration: BoxDecoration(
          color: whiteColor.value,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          )),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                theCondition.tr.text
                    .fontFamily(regular)
                    .color(blackColor.value)
                    .size(14)
                    .make(),
                ResetText.tr.text
                    .fontFamily(regular)
                    .color(blackColor.value)
                    .size(14)
                    .make(),
              ],
            ),
            20.heightBox,
            professional.tr.text
                .fontFamily(regular)
                .color(blackColor.value)
                .size(14)
                .make(),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    rented.tr.text
                        .fontFamily(regular)
                        .color(
                          controller.isRented.value
                              ? redColor
                              : blackColor.value,
                        )
                        .size(12)
                        .make(),
                  ],
                )
                    .box
                    .height(45)
                    .width(context.screenWidth / 2.3)
                    .color(lightColor.value)
                    .border(
                      width: 1,
                      color: controller.isRented.value
                          ? redColor
                          : lightColor.value,
                    )
                    .roundedSM
                    .make()
                    .onTap(() {
                  setState(() {
                    controller.isRented.value = true;
                    controller.isVendor.value = false;
                  });
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    tenant.tr.text
                        .fontFamily(regular)
                        .color(controller.isVendor.value
                            ? redColor
                            : blackColor.value)
                        .size(12)
                        .make(),
                  ],
                )
                    .box
                    .height(45)
                    .width(context.screenWidth / 2.3)
                    .color(lightColor.value)
                    .roundedSM
                    .border(
                      width: 1,
                      color: controller.isVendor.value
                          ? redColor
                          : lightColor.value,
                    )
                    .make()
                    .onTap(() {
                  setState(() {
                    controller.isRented.value = false;
                    controller.isVendor.value = true;
                  });
                }),
              ],
            ),
            20.heightBox,
            userText.tr.text
                .fontFamily(regular)
                .color(blackColor.value)
                .size(14)
                .make(),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    tenant.tr.text
                        .fontFamily(regular)
                        .color(controller.isTenant.value
                            ? redColor
                            : blackColor.value)
                        .size(12)
                        .make(),
                  ],
                )
                    .box
                    .height(45)
                    .width(context.screenWidth / 2.3)
                    .color(lightColor.value)
                    .border(
                      width: 1,
                      color: controller.isTenant.value
                          ? redColor
                          : lightColor.value,
                    )
                    .roundedSM
                    .make()
                    .onTap(() {
                  setState(() {
                    controller.isTenant.value = true;
                    controller.isBuyer.value = false;
                  });
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Buyer.tr.text
                        .fontFamily(regular)
                        .color(controller.isBuyer.value
                            ? redColor
                            : blackColor.value)
                        .size(12)
                        .make(),
                  ],
                )
                    .box
                    .height(45)
                    .width(context.screenWidth / 2.3)
                    .color(lightColor.value)
                    .roundedSM
                    .border(
                      width: 1,
                      color: controller.isBuyer.value
                          ? redColor
                          : lightColor.value,
                    )
                    .make()
                    .onTap(() {
                  setState(() {
                    controller.isTenant.value = false;
                    controller.isBuyer.value = true;
                  });
                }),
              ],
            ),
            20.heightBox,
            CustomButton(
              text: Filter.tr,
              textColor: whiteColor.value,
              backgroundColor: blackColor.value,
              borderColor: blackColor.value,
              onPressed: () {},
            ).box.height(56).width(context.screenWidth - 40).make(),
          ],
        ),
      ),
    );
  }
}

class bottomSheetPersonalFile extends StatefulWidget {
  final String title;
  final String searchTitle;
  final String subTitle;
  const bottomSheetPersonalFile({super.key, required this.title, required this.searchTitle, required this.subTitle});

  @override
  State<bottomSheetPersonalFile> createState() =>
      _bottomSheetPersonalFileState();
}

class _bottomSheetPersonalFileState extends State<bottomSheetPersonalFile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          20.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.title
              .tr.text
                  .fontFamily(regular)
                  .size(14)
                  .align(TextAlign.start)
                  .color(blackColor.value)
                  .make(),
            ],
          ),
          20.heightBox,
          MyTextField(
            Radius: 24.0,
            readOnly: false,
            maxLines: 1,
            prefixIcon: Icon(
              Icons.search,
              color: blackColor.value,
            ),
            obscureText: false,
            keyboardType: TextInputType.text,
            hintText: widget.searchTitle.tr,
          ),
          20.heightBox,
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                child: widget.subTitle
                    .text
                    .fontFamily(regular)
                    .size(14)
                    .color(blackColor.value)
                    .make(),
              );
            },
          ).box.height(context.screenHeight / 4.5).make()
        ],
      )
          .box
          .height(context.screenHeight / 2.5)
          .width(context.screenWidth)
          .color(whiteColor.value)
          .make(),
    );
  }
}
