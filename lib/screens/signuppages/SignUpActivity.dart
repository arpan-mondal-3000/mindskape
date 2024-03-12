import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mindskape/APIS/APIS.dart';
import 'package:mindskape/screens/navigation_pages/profile/ProfileActivity.dart';
import 'package:mindskape/screens/signuppages/LoginActivity.dart';
import 'package:mindskape/helper.dart';
import 'package:mindskape/main.dart';
import '../../APIS/AuthenticationHelper.dart';
import '../../firebase_options.dart';
import '../BotttomNevigation bar/BottomNevigation.dart';

class SignUpActivity extends StatefulWidget {
  SignUpActivity({super.key});

  @override
  State<SignUpActivity> createState() => _SignUpActivityState();
}

class _SignUpActivityState extends State<SignUpActivity> {
  var user_profile_controlar = TextEditingController();

  var email_profile_controlar = TextEditingController();

  var password_profile_controlar = TextEditingController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  handlarGoogle() {
    //calling progress bar


    helper.showProgresssbar(context);
    //if user is null so this is error handleer
    SignInWithGoogle().then((user) async => {
      Navigator.pop(context),
      if (user != null)
        {
          if (await APIs.useresist())
            {// navigate to the home page and clear all stack
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => BottomsampleNevigation()),(route) => false,)
            }
          else
            {// if useer are not created and the first creat so cll the craatuser function
              //then  navigate to the home page and clear all stack
              await APIs.creatuser().then((value) => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => BottomsampleNevigation()),(route) => false,))
            }
        }
    });
  }

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
      log("dataFrom SignwithGoogle: ${(userCredential.user)}");
      return userCredential;

    } catch (e) {
      log("SignInWithGoogle : $e");

    }
  }
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
        /*appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),*/
        body: Container(
      // main contener
      width: double.maxFinite,
      height: double.maxFinite,
      /* decoration:  BoxDecoration(
              image:DecorationImage(
                  image: AssetImage("assets/images/sample.jpg"),
                  fit: BoxFit.cover
              )
          ),*/
      child: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Login&SignUpBg.jpg"),
                    opacity: .7,
                    fit: BoxFit.cover)),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23),
                        borderSide: BorderSide(color: Colors.black87)),
                    color: Color(0xffF8F8F0).withOpacity(.4),
                    elevation: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                          //contener of the all imafe textfield and button
                          width: mq.width*.9,
                          // height:mq.height*.7,
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              // User Image profile circleAvatar......................
                              CircleAvatar(
                                maxRadius: 65,
                                backgroundColor: Colors.cyan.withOpacity(0.0),
                                child: Icon(
                                  Icons.account_circle_outlined,
                                  size: 130,
                                  color: CupertinoColors.white,
                                  fill: .5,
                                ),
                              ),

                              //UserName TextField..............

                              helper.TextFieldSample(
                                  user_profile_controlar,
                                  "userid",
                                  15,
                                  25,
                                  TextInputType.text,
                                  Colors.black,
                                  Icon(Icons.person),
                                  false),

                              //  Gap Between two contener
                              SizedBox(
                                height: 10,
                              ),

                              //Email TextField..............
                              helper.TextFieldSample(
                                  email_profile_controlar,
                                  "email",
                                  15,
                                  25,
                                  TextInputType.text,
                                  Colors.black,
                                  Icon(Icons.email),
                                  false),

                              //  Gap Between two contener
                              SizedBox(
                                height: 10,
                              ),

                              //Password TextField..............
                              helper.TextFieldSample(
                                  password_profile_controlar,
                                  "password",
                                  15,
                                  25,
                                  TextInputType.text,
                                  Colors.black,
                                  Icon(Icons.password),
                                  true),

                              //  Gap Between two contener
                              SizedBox(
                                height: 30,
                              ),

                              ////Sign Up (Elevation) Button.#########################################

                              helper.ButtonSample(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MyHomePage(title: "Home Page")));
                              }, "SIGN UP", Color(0xffD3F5FF),
                                  Color(0xff033B86), 20),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap:(){
                                  //to call google login funtion

                                  handlarGoogle();
                                } ,
                                child: Container(
                                    width: mq.width*.6,
                                    height: mq.width*.1,


                                    decoration: BoxDecoration( color: CupertinoColors.white,borderRadius:BorderRadius.circular(50)),

                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                "assets/images/google_search.png"),
                                            width:30,
                                            height: 30,
                                          ),
                                          SizedBox(width: 10,),
                                          Text("Sign Up with ",style: TextStyle(fontSize: 15)),
                                          Text("Google ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                                        ],
                                      ),
                                    )),
                              ),

                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //texe is deavle beacause this is login page

                                    Text(
                                      "Already have an account?",
                                      style: TextStyle(
                                          color: CupertinoColors.white,
                                          fontSize: 15),
                                    ),

                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          LoginActivity()));
                                        },
                                        child: Text(
                                          "LOGIN",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color(0xff033B86),
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor: Color(0xff033B86)),
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,)
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
