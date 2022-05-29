import 'package:emed/core/widgets/emed_text.dart';
import 'package:flutter/cupertino.dart';

class HospitalBody extends StatelessWidget {
  const HospitalBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: EmedText(text: "Hospital"),
      ),
    );
  }
}
