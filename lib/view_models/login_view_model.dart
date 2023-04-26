import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void logiInFirebase(
      {required String email, required String password}) async {
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user not found ") {
        print("user not found this email");
      } else if (e.code == "wrong password") {
        print("wrong password");
      } else {
        print(e.code);
      }
    }
  }
  void registration({
    required String email,
    required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password);

    }on FirebaseAuthException catch(e) {
      if( e.code == 'weakPassword'){
        print("the password provided to week");

      }else if(e.code =='email-alredy- in use '){
        print(" the mail alredy use");
      }else {
        print(e.message) ;
      }
    }
  }
}
