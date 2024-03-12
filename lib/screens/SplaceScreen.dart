
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mindskape/model/chatModel.dart';
import 'package:mindskape/screens/navigation_pages/home/homeScreen.dart';
import 'package:mindskape/screens/signuppages/LoginActivity.dart';
import 'package:mindskape/screens/signuppages/SignUpActivity.dart';

import '../../main.dart';
import '../APIS/APIS.dart';
import 'BotttomNevigation bar/BottomNevigation.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<SplaceScreen> {

  //animatetion ControlAar

  bool _animatrd=false;

// init state this will work at first
  @override
  void initState() {

    super.initState();
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     systemNavigationBarColor: CupertinoColors.white,
    //     statusBarColor: CupertinoColors.white));
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    //at initial dealed 500 miliseconds then animation treagred

    Future.delayed(Duration(milliseconds: 3000),(){
      if(APIs.auth .currentUser!=null){
        APIs.getSelfInfo();



        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>BottomsampleNevigation()),(route) => false,);

      }else{


        //navigat in the Logingpage and clear from the stack if => false
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>SignUpActivity()), (route) => false);

      }
    });

  }
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(



//body
      //stack use for over the widgit
        body: Stack(

            children: [
              //animate positinon is use to change the position
              //this is note by defult add dependency in .yaml file "( animations: ^2.0.11 )"

              Positioned(

                  top: mq.height * .15,
                  width: mq.width * .5,
                  right:   mq.width * .25,
                  child: Image.asset("assets/images/sample.jpg")),
              Positioned(
                  bottom: mq.height * .1,
                  left: mq.width * .15,
                  child:
                  Text("Hare Krishna Radhe Radhe 🙏🙏",style: TextStyle(fontSize: 17),))
            ]));
  }
}
