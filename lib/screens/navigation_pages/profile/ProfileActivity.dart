import 'dart:developer';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mindskape/APIS/APIS.dart';
import 'package:mindskape/APIS/AuthenticationHelper.dart';
import 'package:mindskape/model/chatModel.dart';
import 'package:mindskape/screens/navigation_pages/profile/editProfile.dart';
import 'package:mindskape/screens/signuppages/LoginActivity.dart';
import 'package:mindskape/screens/signuppages/SignUpActivity.dart';

import '../../../main.dart';

class ProfileActivity extends StatefulWidget {
  final ProfileDetail profileDetail;
  const ProfileActivity({super.key, required this.profileDetail});

  @override
  State<ProfileActivity> createState() => _ProfileActivityState();
}

class _ProfileActivityState extends State<ProfileActivity> {
  initState(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            //background container its content background color     ########################################

            Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                      const Color(0xffA8EDEA).withOpacity(.6),
                      const Color(0xffFED6E3),
                    ],
                        begin: const AlignmentDirectional(1, 0),
                        end: const AlignmentDirectional(0, 1)))),

            Column(
              children: [
                Stack(children: [
                  Container(
                      width: double.maxFinite,
                      height: 90,
                      // color: Colors.yellowAccent,

                      child:  Stack(
                        children: [
                          Positioned(
                              bottom: 0,
                              left: 8,
                              child: Text(
                                "PROFILE",
                                style: TextStyle(
                                    color: Color(0xff6C464E),
                                    fontSize: 35,
                                    fontWeight: FontWeight.w900),
                              )),
                          Positioned(
                              right: 10,
                              bottom: 10,
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    log("${widget.profileDetail.name}");
                                  });
                                },
                                child: InkWell(
                                  onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (_)=>EditProfile(profileDetail: APIs.me)));
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.penToSquare,
                                    size: 30,
                                  ),
                                ),
                              ))
                        ],
                      )),
                ]),
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                  height: 0,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(mq.height*.1),
                  child: CachedNetworkImage(
                    width: mq.height * .2,
                    height: mq.height * .2,
                    fit: BoxFit.fill,
                    imageUrl: APIs.me.image,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        CircleAvatar(
                          maxRadius: 85,
                          backgroundColor: Colors.cyan.withOpacity(0),
                          child: Icon(
                            Icons.account_circle_outlined,
                            size: 180,
                            color: Colors.grey[700],
                            fill: .5,
                          ),
                        ),
                  ),
                ),

                const SizedBox(height: 10,),
                //frome email get the name
                APIs.user!=null?Text(
                APIs.me.name,
                  style: TextStyle(color: Color(0xff6C464E), fontSize: 20, fontWeight: FontWeight.bold),
                ):
               Text(
                  "Radhe Krishna",
                  style: TextStyle(color: Color(0xff6C464E), fontSize: 20, fontWeight: FontWeight.bold),
                ),

                 APIs.user!=null?Text(
                  APIs.me.email,
                   style: TextStyle(color: Color(0xff6C464E), fontSize: 15),
                 ):
                 Text(
                  "hareKrishna@gamil.com",
                  style: TextStyle(color: Color(0xff6C464E), fontSize: 15),
                ),
                const SizedBox(height: 60,),
                
                ////  personal information
                Container(
                  width: 350,
                  height: 60,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFF9AD),
                      borderRadius: BorderRadius.circular(12,),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 19.0),
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: [
                        Text(
                          "Personal Information",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Positioned(
                            right: 0,
                            child: Icon(
                              Icons.chevron_right_rounded,
                              size: 60,
                            ))
                      ],
                    ),
                  ),
                ),
                
                //time spent
                const SizedBox(height: 15,),
                Container(
                  width: 350,
                  height: 60,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFF9AD),
                      borderRadius: BorderRadius.circular(12,),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 19.0),
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: [
                        Text(
                          "Time Spent",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Positioned(
                            right: 0,
                            child: Icon(
                              Icons.chevron_right_rounded,
                              size: 60,
                            ))
                      ],
                    ),
                  ),
                ),
                
                //Personal Stats
                const SizedBox(height: 15,),
                Container(
                  width: 350,
                  height: 60,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFF9AD),
                      borderRadius: BorderRadius.circular(12,),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 19.0),
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: [
                        Text(
                          "Personal Stats",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Positioned(
                            right: 0,
                            child: Icon(
                              Icons.chevron_right_rounded,
                              size: 60,
                            ))
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 150,),

                // Logout
                InkWell(
                  onTap: () async {
                    await GoogleSignIn().signOut();
                    FirebaseAuth.instance.signOut();
                    print("successfully logout");
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>SignUpActivity()));},
                  child: Container(
                    width: double.maxFinite,

                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            FaIcon(FontAwesomeIcons.arrowRightFromBracket,color: const Color(0xffC82626),size: 30,shadows: [
                              Shadow(color: Colors.purpleAccent.shade100,blurRadius: 10),
                            ],),
                            const SizedBox(width: 10,),
                            const Text("Logout",style: TextStyle(color: Color(0xffC82626),fontSize: 20),),
                          ],
                        ),
                      ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
