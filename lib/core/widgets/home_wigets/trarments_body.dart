import 'package:flutter/material.dart';

class TrarmentsBody extends StatelessWidget {
  const TrarmentsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Center(
            child: Text("Trarments"),
          )
        ],
      ),
    );
  }
}
