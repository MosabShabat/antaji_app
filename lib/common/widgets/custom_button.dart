import '../../constant/const.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color borderColor;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: borderColor, width: 2),
        ),
        primary: backgroundColor,
        minimumSize: Size(context.screenWidth, 50),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontFamily: medium,
          fontSize: 16,
        ),
      ),
    );
  }
}

class rowSpBet extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const rowSpBet({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          text.tr.text.color(blackColor.value).fontFamily(bold).size(16).make(),
          TextButton(
            onPressed: onPressed,
            child: viewAll.tr.text
                .color(blackColor.value)
                .fontFamily(medium)
                .size(12)
                .make(),
          ),
        ],
      ),
    );
  }
  //   BrowseCategories
}

TextField MyTextField({
  keyboardType,
  controller,
  obscureText,
  hintText,
  suffixIcon,
  maxLines,
  readOnly,
  prefixIcon,
  Radius,
}) {
  return TextField(
    readOnly: readOnly,
    keyboardType: keyboardType,
    controller: controller,
    maxLines: maxLines,
    obscureText: obscureText,
    decoration: InputDecoration(
      filled: true,
      fillColor: lightColor.value,
      hintText: hintText,
      hintStyle: TextStyle(
        color: blackColor.value,
      ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Radius),
        borderSide: BorderSide(
          width: 1,
          color: whiteColor.value,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Radius),
        borderSide: const BorderSide(
          width: 1,
          color: Colors.blue,
        ),
      ),
    ),
  );
}

GestureDetector myInterestsChips(
    width, _handleTap, bool isTapped, String textDesc) {
  return GestureDetector(
    onTap: _handleTap,
    child: Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        color: isTapped ? yalowColor : lightColor.value,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isTapped ? yalowColor : blackColor.value,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isTapped ? Icons.done : Icons.add,
            color: isTapped ? whiteColor.value : blackColor.value,
          ),
          8.widthBox,
          textDesc.text.medium
              .size(12)
              .color(
                isTapped ? whiteColor.value : blackColor.value,
              )
              .make(),
        ],
      ),
    ),
  );
}

AppBar SameAppBar(BuildContext context, {hint, controller}) {
  return AppBar(
    backgroundColor: whiteColor.value,
    elevation: 0,
    title: MyTextField(
      Radius: 24.0,
      readOnly: false,
      maxLines: 1,
      obscureText: false,
      controller: controller,
      keyboardType: TextInputType.text,
      hintText: hint,
    )
        .box
        .height(45)
        .width(context.screenWidth - 80)
        .customRounded(BorderRadius.all(Radius.circular(50)))
        .make(),
    centerTitle: true,
  );
}
