import 'package:emed/core/extentions/context_extension.dart';
import 'package:emed/core/widgets/emed_text.dart';
import 'package:flutter/material.dart';

class DoctorBody extends StatelessWidget {
  const DoctorBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: GestureDetector(
              child: Container(
                height: context.h * 0.05,
                width: context.w * 0.8,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.search),
                    Text("Search doctors by name or position"),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: context.w * 0.07),
            child: EmedText(
                text: "Recommended doctors for you", color: Colors.black54),
          ),
          SizedBox(
            height: context.h,
            width: context.w,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          'https://source.unsplash.com/random/$index',
                        ),
                      ),
                      title: EmedText(text: 'John Doe'),
                      subtitle: EmedText(text: 'Immunology'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/infoDoctor',
                          arguments: index,
                        );
                      },
                    ),
                    Divider(indent: context.w * 0.13, endIndent: 5),
                  ],
                );
              },
              itemCount: 6,
            ),
          )
        ],
      ),
    );
  }
}
