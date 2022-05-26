import 'package:emed/core/components/input_comp.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/widgets/scaffold_messanger.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Sign In",
          style: TextStyle(
            color: ColorConst.kMainBlue,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputComp.inputDecoration(
                      hintText: "Username Kiriting...",
                      labelText: "Username...",
                      suffixIcon: const Icon(Icons.edit),
                    ),
                    validator: (text) {
                      if (text!.length < 5) {
                        return "Username 5 ta belgidan kam bo'lmasin !";
                      }
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputComp.inputDecoration(
                      hintText: "Passwors Kiriting...",
                      labelText: "Password...",
                      suffixIcon: const Icon(Icons.password),
                    ),
                    validator: (text) {
                      if (text!.length < 5) {
                        return "Password 5 ta belgidan kam bo'lmasin !";
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: ColorConst.kWhite,
          child: const Icon(Icons.chevron_right),
          onPressed: () {} ,//signIn,
          ),
    );
  }

  // signIn() {
  //   if (_formKey.currentState!.validate()) {
  //     for (Map userpass in UserInfo.users) {
  //       if (userpass.keys.first == _usernameController.text &&
  //           userpass.values.first == _passwordController.text) {
  //         Navigator.pushReplacementNamed(
  //           context,
  //           '/score',
  //           arguments: _usernameController.text,
  //         );
  //         return true;
  //       }
  //     }
  //     MyMessenger.showMyMessenger("Username yoki password notogri !!", context);
  //   }
  // }
}
