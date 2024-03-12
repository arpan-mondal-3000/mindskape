import 'dart:developer';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mindskape/APIS/APIS.dart';
import 'package:mindskape/screens/navigation_pages/categories/WriteJournal.dart';

import '../profile/editProfile.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/JournalPageBg.jpg'),fit: BoxFit.cover,opacity:0.8)),
          ),
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
                              "JOURNAL",
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

                                });
                              },
                              child: InkWell(
                                onTap: () async {
                                 Navigator.push(context, MaterialPageRoute(builder: (_)=>WriteJournal(onupdate: false,)));


                                },
                                child: FaIcon(
                                  FontAwesomeIcons.circlePlus,
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


            Expanded(
              child: FirebaseAnimatedList(
                query: APIs.database.ref("Journal").child(APIs.auth.currentUser!.uid),
                itemBuilder: (context, snapshot, animation, index) {

                  return
                    InkWell(
                      onTap: (){

                        Navigator.push(context, MaterialPageRoute(builder: (_)=>WriteJournal( onupdate: true ,)));
                      },
                      child: Card(
                        color:Colors.yellowAccent.withOpacity(.7),
                        child: ListTile(

                            title: Text("${snapshot.child("title").value.toString()}"),
                            subtitle: Text("${snapshot.child("time").value.toString()}"),
                            trailing: Icon(Icons.navigate_next)
                        ),
                      ),
                    );
                },
              ),
            )



            ],
          ),
        ],
      ),

    );
  }
}
