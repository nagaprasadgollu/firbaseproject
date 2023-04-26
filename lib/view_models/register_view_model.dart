import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class RegisterviewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<String?> registeration({
    required String email,
    required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password);
      return "sucess";
    }on FirebaseAuthException catch(e) {
      if( e.code == 'weakPassword'){
        return "the password provided to week";

      }else if(e.code =='email-alredy- in use '){
      return" the mail alredy use";
    }else {
        return e.message;
      }
    }
  }

}