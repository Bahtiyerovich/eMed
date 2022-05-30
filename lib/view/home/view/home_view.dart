import 'package:emed/core/base/base_view/base_view.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/widgets/errorsnackbar.dart';
import 'package:emed/core/widgets/home_wigets/doctor_body.dart';
import 'package:emed/core/widgets/home_wigets/home_body.dart';
import 'package:emed/core/widgets/home_wigets/hospital_body.dart';
import 'package:emed/core/widgets/home_wigets/trarments_body.dart';
import 'package:emed/view/home/cubit/home_cubit.dart';
import 'package:emed/view/home/state/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class EmedHomeView extends StatelessWidget {
  EmedHomeView({Key? key}) : super(key: key);

  List<Widget> bodies = [
    HomeBody(),
    const TrarmentsBody(),
    const DoctorBody(),
    const HospitalBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BaseView(
          viewModal: EmedHomeView,
          onPageBuilder: (context, widget) {
            return BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is HomeError) {
                  showErrorSnackBar(context, "Another Error");
                }
              },
              builder: (context, state) {
                if (state is HomeInitial) {
                  return bodies[context.watch<HomeCubit>().currentIndex];
                } else if (state is HomeLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else {
                  return showErrorSnackBar(context, "Another Error");
                }
              },
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          // fixedColor: Colors.black,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.red,
          currentIndex: context.watch<HomeCubit>().currentIndex,
          // backgroundColor: ColorConst.kWhite,
          items: itemsButton(context),
          onTap: (index) {
            context.read<HomeCubit>().changePageHome(index);
          },
        ),
      ),
    );
  }

  itemsButton(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        label: "Home",
        icon: SvgPicture.asset(
          context.watch<HomeCubit>().currentIndex != 0
              ? 'assets/icons/home.svg'
              : 'assets/icons/home_blue.svg',
        ),
      ),
      BottomNavigationBarItem(
        label: "Treatments",
        icon: SvgPicture.asset(
          context.watch<HomeCubit>().currentIndex != 1
              ? 'assets/icons/syringe.svg'
              : "assets/icons/syringe_blue.svg",
        ),
      ),
      BottomNavigationBarItem(
        label: "Doctors",
        icon: SvgPicture.asset(
          context.watch<HomeCubit>().currentIndex != 2
              ? 'assets/icons/doctor.svg'
              : 'assets/icons/doctor_blue.svg',
        ),
      ),
      BottomNavigationBarItem(
        label: "Hospitals",
        icon: SvgPicture.asset(
          context.watch<HomeCubit>().currentIndex != 3
              ? 'assets/icons/hospital.svg'
              : 'assets/icons/hospital_blue.svg',
        ),
      ),
    ];
    return items;
  }
}
