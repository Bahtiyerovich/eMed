import 'package:emed/core/constants/color_const.dart';
import 'package:flutter/material.dart';

class EmedHomeView extends StatefulWidget {
  const EmedHomeView({Key? key}) : super(key: key);

  @override
  State<EmedHomeView> createState() => _EmedHomeViewState();
}

class _EmedHomeViewState extends State<EmedHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorConst.kMainBlue,
      ),
    );
  }
}
