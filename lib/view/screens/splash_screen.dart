import 'dart:async';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/view/auth/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.kMainBlue,
      body: _eMedBody(context),
    );
  }

  Container _eMedBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: SizedBox(
      height: 150,
      child: SvgPicture.asset('assets/svg/iconlabel.svg'),
    ),
      ),
    );
  }
}
