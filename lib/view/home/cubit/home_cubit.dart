import 'package:emed/view/home/state/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentIndex = 0;

  bool isAppointment = false;

  changePageHome(index) {
    currentIndex = index;
    emit(HomeInitial());
  }

  changeIsAppointmentStatus() {
    isAppointment = !isAppointment;
    emit(HomeInitial());
  }
}
