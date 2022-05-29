import 'package:emed/core/base/base_view/base_view.dart';
import 'package:emed/core/components/input_comp.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/constants/font_const.dart';
import 'package:emed/core/extentions/context_extension.dart';
import 'package:emed/core/widgets/appbar.dart';
import 'package:emed/core/widgets/emed_text.dart';
import 'package:emed/core/widgets/emed_button.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: SignUpView,
        onPageBuilder: (context, widget) {
          return Scaffold(
            appBar: EMedAppBar(title: 'Sign Up',),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(context.h * 0.03),
                child: Column(
                  children: [
                    EmedText(
                      text:
                          'Sign up in order to get a full access to the \nsystem',
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
                              text: 'Full name',
                              color: Colors.black,
                              size: FontConst.kMediumFont,
                            ),
                          ),
                          TextFormField(
                            controller: _nameController,
                            decoration: InputComp.inputDecoration(
                              hintText: "Enter your full name...",
                            ),
                          ),
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
                            controller: _nameController,
                            decoration: InputComp.inputDecoration(
                              hintText: "Enter your phone number...",
                            ),
                            //! validator: (text) {
                            //   if (text!.length < 6) {
                            //     return "Username 6 ta belgidan kam bo'lmasin !";
                            //   }
                            // },
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
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputComp.inputDecoration(
                                hintText: "Create your new password...",
                                suffixIcon: IconButton(
                                  icon:
                                      const Icon(Icons.remove_red_eye_outlined),
                                  onPressed: () {},
                                )),
                            validator: (text) {
                              if (text!.length < 6) {
                                return "Password length must be greater than 6 characters!";
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.h * 0.15),
                    EMedBlueButton(
                        index: 1,
                        text: 'Continue',
                        currentPage: 1,
                        onpressed: () {
                          // Navigator.pushNamed(context, '/confirmation');
                        })
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
