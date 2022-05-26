import 'package:emed/core/constants/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svg/newsLogo1.svg'),
          Text(
            'e-med',
            style: TextStyle(
              fontFamily: 'sfpro',
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: ColorConst.kWhite,
            ),
          ),
        ],
      ),
    );
  }
}
