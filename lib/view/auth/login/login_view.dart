import 'package:emed/core/widgets/big_text.dart';
import 'package:emed/core/widgets/my_setstate_button.dart';
import 'package:emed/core/widgets/setting_button_widget.dart.dart';
import 'package:emed/core/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:emed/core/constants/color_const.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(children: [
          const SizedBox(height: 80),
          SmallText(
            text: 'e-med',
            color: ColorConst.kMainBlue,
            size: 40,
          ),
          const SizedBox(height: 80),
          SmallText(
            text: 'Your medical data \nis always with you',
            color: Colors.black,
            size: 40,
          ),
          const SizedBox(height: 30),
          const Text(
            'Nunc orci sed sed posuere volutpat varius egestas sit. Amet, suscipit eget dis fusce quam in aliquet pulvinar.',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 200),
          MySetstateButtonWidget(
              index: 1,
              text: 'Get Started',
              currentPage: 1,
              onpressed: () {
                Navigator.pushNamed(context, '/signupview');
              }),
          const SizedBox(height: 10),
          MySetstateButtonWidget(
              index: 2, text: 'Log In', currentPage: 1, onpressed: () {}),
        ]),
      ),
    );
  }
}
