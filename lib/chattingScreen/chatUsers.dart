import 'dart:convert';
import 'dart:developer';
import 'dart:ui';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mindskape/chattingScreen/usercart.dart';

import '../APIS/APIS.dart';
import '../main.dart';
import '../model/chatModel.dart';

class chatsUser extends StatefulWidget {
  const chatsUser({super.key});

  @override
  State<chatsUser> createState() => _chatsUserState();
}

class _chatsUserState extends State<chatsUser> {
  List<ProfileDetail> list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //APIs.getSelfInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      //app bar
        appBar: AppBar(
          elevation: 50,
          title: Center(
              child: Text(
                "Chats",
                style: TextStyle(
                  fontSize: 30,
                ),
              )),
          leading: const Icon(CupertinoIcons.home),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(
                CupertinoIcons.search,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.more_vert,
              ),
              onPressed: () {

                // nevigate to the profile screen and user data passing
               // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ProfilePage(userChat: APIs.me)));
              },
            )
          ],
        ),

        //flotingAction Button
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20, right: 10),
          child: FloatingActionButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut();

              print("signout successfilly");
             /* Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()));*/
            },
            backgroundColor: Colors.blue,
            child: const Icon(
              Icons.add_comment,
              color: CupertinoColors.white,
              size: 25,
            ),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    color: CupertinoColors.white, style: BorderStyle.none)),
          ),
        ),
//body

        body: StreamBuilder(
          //data faching from firestore
          stream: APIs.fireStoreData(),
          builder: (context, snapshot) {
            //chacking connection is properly  aor not

            switch(
            snapshot.connectionState
            ){//connection waiting or not
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(child:  CircularProgressIndicator());
            //connection is active then
              case ConnectionState.active:
              case ConnectionState.done:
              //data store in data verable
                final data=snapshot.data?.docs;
                //data stote list in maping from && and data converted from dart to json formet
                list=data?.map((e) => ProfileDetail.fromJson(e.data())).toList()??[];
                if(list.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      //caling chat user therir all homescreen bodynmaged
                      return ChatsUserCard(profileDetail: list[index],);
                    },
                    padding: EdgeInsets.only(top: mq.height * .01),
                    physics: BouncingScrollPhysics(),
                    itemCount: list.length,

                  );
                }else{
                  return
                    //when connecton is fail

                    Center(child: Text("No Connection Found!!",style: TextStyle(fontSize:  20 ),));
                }

            }
          },
        ));
  }
}
