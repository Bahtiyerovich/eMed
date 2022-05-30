import 'package:emed/core/base/base_view/base_view.dart';
import 'package:emed/core/components/input_comp.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/constants/font_const.dart';
import 'package:emed/core/extentions/context_extension.dart';
import 'package:emed/core/widgets/emed_text.dart';
import 'package:emed/core/widgets/emed_button.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class SmsView extends StatefulWidget {
  const SmsView({Key? key}) : super(key: key);

  @override
  _SmsViewState createState() => _SmsViewState();
}

class _SmsViewState extends State<SmsView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: SmsView,
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
                text: 'Sign Up',
                size: FontConst.kLargeFont,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(context.h * 0.03),
                child: Column(
                  children: [
                    EmedText(
                      text:
                          'We sent a confirmation code to your number.\n Please, enter the code',
                      color: Colors.black54,
                      size: FontConst.kMediumFont,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: context.h * 0.06),
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
                              text: 'Confirmation code',
                              color: Colors.black,
                              size: FontConst.kMediumFont,
                            ),
                          ),
                          PinCodeTextField(
                            pinBoxRadius: 8,
                            autofocus: true,
                            highlight: true,
                            highlightColor: Colors.blue,
                            defaultBorderColor: Colors.grey,
                            maxLength: 6,
                            onDone: (text) {
                              
                            },
                            pinBoxWidth: 50,
                            pinBoxHeight: 50,
                            wrapAlignment: WrapAlignment.spaceAround,
                            pinBoxDecoration: ProvidedPinBoxDecoration
                                .defaultPinBoxDecoration,
                            pinTextStyle: TextStyle(fontSize: 22.0),
                            pinTextAnimatedSwitcherTransition:
                                ProvidedPinBoxTextAnimation.scalingTransition,
                            pinTextAnimatedSwitcherDuration:
                                Duration(milliseconds: 300),
                            highlightAnimationBeginColor: Colors.black54,
                            highlightAnimationEndColor: Colors.white12,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: context.h * 0.12),
                    // EMedBlueButton(
                    //     index: 1,
                    //     text: 'Continue',
                    //     currentPage: 1,
                    //     onpressed: () {
                    //       Navigator.pushNamed(context, '/smsview');
                    //     })
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
