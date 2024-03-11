import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:mindskape/APIS/APIS.dart';
import 'package:mindskape/screens/navigation_pages/profile/ProfileActivity.dart';
import 'package:mindskape/screens/signuppages/LoginActivity.dart';
import 'package:mindskape/helper.dart';
import 'package:mindskape/main.dart';
import '../../APIS/AuthenticationHelper.dart';
import '../../firebase_options.dart';

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
    APIs.getSelfInfo();
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
            decoration: const BoxDecoration(
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
                  // Container(
                  //     margin: const EdgeInsets.only(bottom: 30),
                  //     alignment: Alignment.topCenter,
                  //     child: const Text(
                  //       "Sign UP",
                  //       style: TextStyle(
                  //         fontSize: 30,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.white,
                  //       ),
                  //     )),
                  Card(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23),
                        borderSide: BorderSide(color: Colors.black87)),
                    color: Colors.white.withOpacity(.3),
                    elevation: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                          //contener of the all imafe textfield and button
                          width: mq.width*.9,
                          // height:mq.height*.6,
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
                                height: 20,
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

                                  Authentigation.handlarGoogle(context,APIs.me);
                                  } ,
                                child: Container(
                                  width: mq.width*.6,
                                 height: mq.width*.1,

                                    decoration: BoxDecoration( color: Color(0xffD3F5FF),borderRadius:BorderRadius.circular(50)),

                                    child: const Padding(
                                      padding: EdgeInsets.all(3.0),
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
                                          Text("Sign Up with ",style: TextStyle(fontSize: 15, color: Color(0xff033B86))),
                                          Text("Google ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17, color: Color(0xff033B86)),),
                                        ],
                                      ),
                                    )
                                ),
                              ),

                              const SizedBox(height: 10,),
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
                                              color:
                                              Color(0xff033B86),
                                              decoration:
                                              TextDecoration.underline,
                                              decorationColor: Color(0xff033B86)),
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          )
                      ),
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
