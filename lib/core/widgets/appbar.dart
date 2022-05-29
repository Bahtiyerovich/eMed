import 'package:flutter/material.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/constants/font_const.dart';
import 'package:emed/core/widgets/emed_text.dart';

class EMedAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Color? color;
  Color? textColor = ColorConst.kMainBlue;

  EMedAppBar({Key? key, required this.title, this.textColor, this.color})
      : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 70);

  @override
  Widget build(BuildContext context) {
    var widget;
    return AppBar(
      backgroundColor: ColorConst.kWhite,
      elevation: 0.5,
      centerTitle: true,
      foregroundColor: ColorConst.kMainBlue,
      title: EmedText(
        text: title,
        size: FontConst.kLargeFont,
        color: textColor,
      ),
    );
  }
}
