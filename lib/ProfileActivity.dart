import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                    Stack(
                      children: [ Container(
                        width: double.maxFinite,
                        height: 70,
                      // color: Colors.yellowAccent,
                      
                       child:  Stack(children: [ Positioned(
                           bottom:0,left: 8,
                           child: Text("PROFILE",style: TextStyle(color: Colors.red.shade900,fontSize: 35,fontWeight: FontWeight.w900),)),
                       ])

                       ),

                    ]),
            Divider(
              color: Colors.black,
              thickness: 2,
              height: 0,
            )
                  ],
                ),





          ],
        ),
      ),
    );
  }
}
