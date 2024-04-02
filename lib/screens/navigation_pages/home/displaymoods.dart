import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:mindskape/APIS/APIS.dart';
import 'package:mindskape/helper.dart';
import 'package:mindskape/model/CurrentMood.dart';
import 'package:mindskape/screens/signuppages/LoginActivity.dart';

Map? moodMap;
List? list ;
class showmoods extends StatefulWidget {


   showmoods();


  @override

  State<showmoods> createState() => _showmoodsState();
}

class _showmoodsState extends State<showmoods> {

  @override
  void initState() {
    super.initState();

    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Dates"),
      ),
      body: Expanded(
        child: FirebaseAnimatedList(
          query: APIs.database.ref("CurrentMood").child(APIs.auth.currentUser!.uid).child('15-3-2024'),
          itemBuilder: (context, snapshot, animation, index) {

            return
              Card(
                color:Colors.black26.withOpacity(.1),
                child: ListTile(
                  leading: Container(
                    width: 80,
                    height: 80,
                    child:  Image(image: AssetImage(snapshot.child('image').value.toString()))
                  ),
                    title: Text("${snapshot.child('date').value.toString()}"),
                    subtitle: Text("${snapshot.child('time').value.toString()}"),

                ),
              );
          },
        ),
      )


    );
  }
}
/*

            // child: ListView.builder(itemBuilder: (context, index) {
        //   return
        // },) ,
        child: ElevatedButton(onPressed: () async {

          final QuerySnapshot<Map<String, dynamic>> questionsQuery =await
    APIs.firestore
        .collection("CurrentMood")
        .doc(APIs.user
    .uid).collection('15-3-2024')
        .get();
          final questions = questionsQuery.docs
              .map((question) =>question.data());
         // Map<dynamic  ,CurrentMoodModel>maps=await questions.toList()[0].

         APIs.firestore.collection("CurrentMood")
              .doc(APIs.user
          .uid).collection('15-3-2024').doc('1710459566917').get().then((value){
          if(value.exists){
 log("${value.data()!}");

          }



          });
          CurrentMoodModel model=CurrentMoodModel.fromJson(questions.toList()[0]);
          log("${questions.toList()[0]}");
          log("${model.mood}");
    },

          child: Text("data"),),
  */
