import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:peaceful_pulse/models/user_model.dart';
import 'package:peaceful_pulse/services/database_methods.dart';
import 'package:peaceful_pulse/user/user_home.dart';

class Controller {
  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  dynamic isValidPass(String pass) {
    if (pass.length < 6) {
      return "required atleast 6 charactors";
    } else if (!pass.contains(RegExp(r'[A-Z]'), 0)) {
      return "Capital letter required";
    } else if (!pass.contains(RegExp(r'[0-9]'), 0)) {
      return "Number required";
    }
    return null;
  }

  // Google signUp
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  signInWithGoogle(BuildContext context) async {
      try {
        GoogleSignInAccount? user = await googleSignIn.signIn();
      // log(user!.email);
      if (user != null) {
        log(user.email);
        GoogleSignInAuthentication googleAuth = await user.authentication;
      log("${googleAuth.idToken}");
      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
          log("${credential.accessToken}");
      auth.signInWithCredential(credential).then((val) {
        log("${val.user!.phoneNumber}");
        auth
            .createUserWithEmailAndPassword(
                email: val.user!.email!, password: val.user!.phoneNumber!)
            .then((value) {
          log("${value.user!.email}");
          log(value.user!.uid);
          String id = value.user!.uid;
          UserModel userInfoMap = UserModel(
              fullName: value.user!.displayName!,
              eMail: val.user!.email!,
              password: val.user!.phoneNumber!,
              id: id);
          DataBaseMethods().addUserDetails(userInfoMap, id);
        });
      }).then((value) => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => UserHome())));
      }
      } catch (e) {
        showDialog(context: context, builder: (context){
          return Text("Error in this is: $e");
        });
      }
      
  }
}
