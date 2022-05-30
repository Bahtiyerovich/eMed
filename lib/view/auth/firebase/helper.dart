import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  FirebaseAuth auth = FirebaseAuth.instance;

  login(String phonenumber, String password) async {}
  signup(String phonenumber, String password) async {
    Map data = {"success": false, "errorText": "timeout error"};
    print(phonenumber);
    print(password);
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phonenumber,
          timeout: const Duration(seconds: 5),
          verificationCompleted: (v) {},
          verificationFailed: (v) {},
          codeSent: (v, n) {},
          codeAutoRetrievalTimeout: (v) {});
    } catch (e) {
      print("Failed to Verify Phone Number>>>>>>>>>>>>: ${e}");
    }
    return data;
  }
}
