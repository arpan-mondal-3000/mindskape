import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mindskape/APIS/APIS.dart';
import 'package:mindskape/helper.dart';

class Authentigation{
  signup(String email, String pass) async {
    if (email == "" && pass == "") {
      return;
    } else {
      UserCredential? usercradincial;
      try {
        usercradincial = await APIs.auth
            .createUserWithEmailAndPassword(email: email, password: pass);
      } on FirebaseAuthException catch (ex) {
      log("Signup: $ex");
      }
    }
  }
  _handlarGoogle( BuildContext context) {}
    //calling progress bar


// helper.showProgresssbar(context);
//     //if user is null so this is error handleer
//     SignInWithGoogle().then((user) async => {
//       Navigator.pop(context),
//       if (user != null)
//         {
//           if (await APIs.useresist())
//             {// navigate to the home page and clear all stack
//               Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(
//                     builder: (BuildContext context) => HomePage()),(route) => false,)
//             }
//           else
//             {// if useer are not created and the first creat so cll the craatuser function
//               //then  navigate to the home page and clear all stack
//               await APIs.creatuser().then((value) => Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(
//                     builder: (BuildContext context) => HomePage()),(route) => false,))
//             }
//         }
//     });
//   }

  //google login function

 static Future<UserCredential?> SignInWithGoogle() async {
    //if during signin any problem orrer so try catch
    try {
      await InternetAddress.lookup("google.com");
      GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleSignInAuthentication =
      await googleSignInAccount?.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      log("SignInWithGoogle : $e");

    }
  }
}