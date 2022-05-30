import 'package:emed/core/base/base_view/base_view.dart';
import 'package:emed/core/components/input_comp.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/constants/font_const.dart';
import 'package:emed/core/extentions/context_extension.dart';
import 'package:emed/core/widgets/emed_text.dart';
import 'package:emed/core/widgets/emed_button.dart';
import 'package:emed/view/auth/cubit/auth_cubit.dart';
import 'package:emed/view/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController(text:"+998");
  final TextEditingController _passwordController = TextEditingController();
  bool isHidden = false;
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: SignInView,
        onPageBuilder: (context, widget) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.blue,
                    ),
                    Text("Back")
                  ],
                ),
              ),
              centerTitle: true,
              backgroundColor: ColorConst.kWhite,
              elevation: 0.5,
              foregroundColor: ColorConst.kMainBlue,
              title: EmedText(
                text: 'Log In',
                size: FontConst.kLargeFont,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(context.h * 0.03),
                child: Column(
                  children: [
                    EmedText(
                      text: 'Log in to your account',
                      color: Colors.black54,
                      size: FontConst.kMediumFont,
                      textAlign: TextAlign.center,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: context.h * 0.05,
                                bottom: context.h * 0.01),
                            child: EmedText(
                              text: 'Phone number',
                              color: Colors.black,
                              size: FontConst.kMediumFont,
                            ),
                          ),
                          TextFormField(
                            controller: _phoneController,
                            inputFormatters: [
                              MaskTextInputFormatter(
                                  mask: '+998 (##) ###-##-##',
                                  filter: {"#": RegExp(r'[0-9]')},
                                  type: MaskAutoCompletionType.lazy)
                            ],
                            keyboardType: TextInputType.number,
                            decoration: InputComp.inputDecoration(
                                // hintText: "+998",
                                ),
                            validator: (text) {
                              if (text!.length != 19) {
                                return "Number  must be +998(XX) XXX-XX-XX !";
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: context.h * 0.01,
                                bottom: context.h * 0.04),
                            child: EmedText(
                              text:
                                  'We will send confirmation code to this number',
                              color: Colors.black54,
                              size: FontConst.kSmallFont,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: context.h * 0.01,
                                bottom: context.h * 0.01),
                            child: EmedText(
                              text: 'Create password',
                              color: Colors.black,
                              size: FontConst.kMediumFont,
                            ),
                          ),
                          TextFormField(
                            obscureText: !isHidden,
                            controller: _passwordController,
                            decoration: InputComp.inputDecoration(
                              hintText: "Create your new password...",
                              suffixIcon: IconButton(
                                icon: Icon(isHidden
                                    ? Icons.remove_red_eye_rounded
                                    : Icons.remove_red_eye_outlined),
                                onPressed: () {
                                  isHidden = !isHidden;
                                  setState(() {});
                                },
                              ),
                            ),
                            validator: (text) {
                              if (text!.length < 6) {
                                return "Password length must be greater than 6 characters!";
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.h * 0.18),
                    BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                      if (state is LoginLoading) {
                        return const CircularProgressIndicator();
                      }
                      return Container();
                    }),
                    BlocListener<AuthCubit, AuthState>(
                      child: Container(),
                      listener: (context, state) {
                        if (state is LoginSuccess) {
                          Navigator.pushNamed(
                            context,
                            '/homeview',
                          );
                        } else if (state is LoginError) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(state.errorText),
                            duration: Duration(seconds: 1),
                            backgroundColor: Colors.red,
                          ));
                        }
                      },
                    ),
                    EMedBlueButton(
                      index: 1,
                      text: 'Log In',
                      currentPage: 1,
                      onpressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).login(_phoneController.text,_passwordController.text);
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  // signIn() {
  //   if (_formKey.currentState!.validate()) {
  //     for (Map userpass in UserInfo.users) {
  //       if (userpass.keys.first == _nameController.text &&
  //           userpass.values.first == _passwordController.text) {
  //         Navigator.pushReplacementNamed(
  //           context,
  //           '/score',
  //           arguments: _usernameController.text,
  //         );
  //         return true;
  //       }
  //     }
  //     MyMessenger.showMyMessenger("You have entered an invalid username or password", context);
  //   }
  // }
}
