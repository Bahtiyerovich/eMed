import 'package:emed/core/constants/font_const.dart';
import 'package:emed/core/extentions/context_extension.dart';
import 'package:emed/core/widgets/emed_button.dart';
import 'package:emed/core/widgets/emed_text.dart';
import 'package:emed/view/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeBody extends StatelessWidget {
  HomeBody({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: EmedText(text: "Today’s medications"),
          ),
          SizedBox(height: context.h * 0.3),
          Center(
            child: EmedText(
              text: "No medications",
            ),
          ),
          SizedBox(height: context.h * 0.02),
          Center(
            child: EmedText(
              text:
                  "They will appear here only when doctor\nadds them to your account.",
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: context.h * 0.25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: EmedText(
                  text: "Monthly appointments",
                  size: FontConst.kMediumFont,
                  color: Colors.black54,
                ),
                onPressed: () {
                  context.read<HomeCubit>().changeIsAppointmentStatus();
                },
              ),
              SizedBox(width: context.w * 0.2),
              TextButton(
                child: EmedText(
                  text: "May",
                ),
                onPressed: () {},
              ),
            ],
          ),
          context.watch<HomeCubit>().isAppointment
              ? vAppoinments(context)
              : const SizedBox()
        ],
      ),
    );
  }

  Column vAppoinments(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: context.h * 0.03),
        Center(
          child: SizedBox(
            width: context.w * 0.9,
            child: SfCalendar(
              cellEndPadding: 10,
              view: CalendarView.month,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.all(15),
          child: EmedText(
            text: "Today’s medications",
          ),
        ),
        SizedBox(height: context.h * 0.07),
        Center(
          child: EmedText(text: "No appointments"),
        ),
        SizedBox(height: context.h * 0.01),
        Center(
          child: EmedText(
            text: "You haven’t added any appointment yet",
          ),
        ),
        SizedBox(height: context.h * 0.08),
        // Center(
        //   child: EMedBlueButton(
        //       index: index,
        //       text: text,
        //       currentPage: currentPage,
        //       onpressed: onpressed),
        // ),
        SizedBox(height: context.h * 0.07)
      ],
    );
  }

  Padding textInputName(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: EmedText(
        text: name,
        size: FontConst.kMediumFont,
        textAlign: TextAlign.left,
      ),
    );
  }
}
