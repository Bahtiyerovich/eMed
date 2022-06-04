import 'package:emed/core/base/base_view/base_view.dart';
import 'package:emed/core/widgets/appbar.dart';
import 'package:emed/core/widgets/errorsnackbar.dart';
import 'package:emed/core/widgets/form_view_widget.dart';
import 'package:emed/view/auth/cubit/auth_cubit.dart';
import 'package:emed/view/auth/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: SignInView,
        onPageBuilder: (context, widget) {
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: Scaffold(
              appBar: EMedAppBar(
                textColor: Colors.black,
                title: 'Sign In',
              ),
              body: BlocConsumer(
                listener: (context, state) {
                  if (state is AuthError) {
                    showErrorSnackBar(context, "Another Error");
                  }
                },
                builder: (context, state) {
                  if (state is AuthInitial) {
                    return FormFieldWidget();
                  } else if (state is AuthLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (state is AuthError) {
                    return showErrorSnackBar(context, "AuthError, try again");
                  } else {
                    return showErrorSnackBar(context, "Another Error");
                  }
                },
              ),
            ),
          );
        });
  }

  
}
