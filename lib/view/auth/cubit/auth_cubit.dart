import 'package:flutter/material.dart';
import 'package:emed/view/auth/state/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  TextEditingController nameConrtoller = TextEditingController();
  TextEditingController phonrConrtoller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isHidden = true;

  changeHiddenPass() {
    isHidden = !isHidden;
    emit(AuthInitial());
  }
}