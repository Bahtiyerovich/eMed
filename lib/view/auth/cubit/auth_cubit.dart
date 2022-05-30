import 'package:emed/view/auth/firebase/helper.dart';
import 'package:flutter/material.dart';
import 'package:emed/view/auth/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  login(String phonenumber,String password) async {
    emit(LoginLoading());
    Map data = await FirebaseAuthHelper().signup(phonenumber, password);
    if (data["success"]) {
      emit(LoginSuccess());
    } else {
      emit(LoginError(errorText: data["errorText"]));
    }
  }

  signup() {
    emit(SignUpLoading());
    if (2 == 3) {
      emit(SignUpSuccess());
    } else {
      emit(SignUpError(errorText: "Sign Up Error"));
    }
  }

  signout() {
    emit(SignOutLoading());
    if (2 == 3) {
      emit(SignOutSuccess());
    } else {
      emit(SignOutError(errorText: "Sign Out Error"));
    }
  }
}
