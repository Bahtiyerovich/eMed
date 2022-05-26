import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MySetstateButtonWidget extends StatefulWidget {
  int index;
  int currentPage;
  String text;
  VoidCallback onpressed;
  

  MySetstateButtonWidget({
    Key? key,
    required this.index,
    required this.text,
    required this.currentPage,
    required this.onpressed,
  }) : super(key: key);

  @override
  State<MySetstateButtonWidget> createState() => _MySetstateButtonWidgetState();
}

class _MySetstateButtonWidgetState extends State<MySetstateButtonWidget> {
  int temp = 0;
  Color color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: widget.onpressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          fixedSize: Size(340, 55),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          primary: widget.currentPage == widget.index
              ? color = ColorConst.kMainBlue
              : color = ColorConst.kWhite,
        ),
        child: FittedBox(
          child: SmallText(

            text: widget.text,
            size: 18,
            color: widget.currentPage == widget.index
                ? ColorConst.kWhite
                : ColorConst.kMainBlue,
          ),
        ),
      ),
    );
  }
}
