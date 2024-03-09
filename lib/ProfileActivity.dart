import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileActivity extends StatefulWidget {
  const ProfileActivity({super.key});

  @override
  State<ProfileActivity> createState() => _ProfileActivityState();
}

class _ProfileActivityState extends State<ProfileActivity> {
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

                      child: const Stack(
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
                              child: FaIcon(
                                FontAwesomeIcons.penToSquare,
                                size: 30,
                              ))
                        ],
                      )),
                ]),
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                  height: 0,
                ),
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
                const SizedBox(height: 10,),
                const Text(
                  "Radhe Krishna",
                  style: TextStyle(color: Color(0xff6C464E), fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
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
                Container(
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
