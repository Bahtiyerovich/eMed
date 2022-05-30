// import 'dart:ui';
import 'package:emed/core/constants/color_const.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

class EMedAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final Color? color;
   Color? textColor = ColorConst.kMainBlue;

   EMedAppBar({Key? key, this.title, this.textColor, this.color})
      : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      
      title:  Text(
              'Sign Up',
              style: TextStyle(
                fontFamily: 'HKGrotesk',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: textColor,
                
              ),
            ),
    );
  }
}
