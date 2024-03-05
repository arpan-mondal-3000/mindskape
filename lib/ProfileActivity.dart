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
            //bckground contener its content background color     ########################################

            Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                      Colors.cyan.shade100.withOpacity(.6),
                      Colors.purpleAccent.shade100.withOpacity(.3),
                      Colors.indigoAccent.shade100.withOpacity(.8),
                    ],
                        begin: AlignmentDirectional(1, 0),
                        end: AlignmentDirectional(0, 1)))),

            Column(
              children: [
                Stack(children: [
                  Container(
                      width: double.maxFinite,
                      height: 90,
                      // color: Colors.yellowAccent,

                      child: Stack(
                        children: [
                          Positioned(
                              bottom: 0,
                              left: 8,
                              child: Text(
                                "PROFILE",
                                style: TextStyle(
                                    color: Colors.red.shade900,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w900),
                              )),
                          Positioned(
                              right: 10,
                              bottom: 10,
                              child: FaIcon(
                                FontAwesomeIcons.notesMedical,
                                size: 30,
                              ))
                        ],
                      )),
                ]),
                Divider(
                  color: Colors.black,
                  thickness: 2,
                  height: 0,
                ),
                CircleAvatar(
                  maxRadius: 85,
                  backgroundColor: Colors.cyan.withOpacity(0.0),
                  child: Icon(
                    Icons.account_circle_outlined,
                    size: 180,
                    color: CupertinoColors.black,
                    fill: .5,
                  ),
                ),
                Text(
                  "Radhe Krishna",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  "hareKrishna@gamil.com",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                SizedBox(
                  height: 100,
                ),
                
                ////  personal information
                Container(
                  width: double.maxFinite,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(
                        40,
                      ),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 19.0),
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
                              Icons.navigate_next,
                              size: 60,
                            ))
                      ],
                    ),
                  ),
                ),
                
                //time spend ##########
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.maxFinite,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(
                        40,
                      ),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 19.0),
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: [
                        Text(
                          "Time Spend",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Positioned(
                            right: 0,
                            child: Icon(
                              Icons.navigate_next,
                              size: 60,
                            ))
                      ],
                    ),
                  ),
                ),
                
                //Personal Stats  #######
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.maxFinite,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(
                        40,
                      ),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 19.0),
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
                              Icons.navigate_next,
                              size: 60,
                            ))
                      ],
                    ),
                  ),
                ),
                
                
                //poind Gained
                
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.maxFinite,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(
                        40,
                      ),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 19.0),
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: [
                        Text(
                          "Point Gained",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Positioned(
                            right: 0,
                            child: Icon(
                              Icons.navigate_next,
                              size: 60,
                            ))
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.maxFinite,

                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Text("Logout",style: TextStyle(color: Colors.red,fontSize: 20),),
                          SizedBox(width: 10,),
                          FaIcon(FontAwesomeIcons.arrowRightFromBracket,color: Colors.red,size: 30,shadows: [
                            Shadow(color: Colors.purpleAccent.shade100,blurRadius: 10),



                          ],),

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
