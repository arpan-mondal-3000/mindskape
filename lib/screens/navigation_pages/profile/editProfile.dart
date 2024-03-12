import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mindskape/APIS/APIS.dart';
import 'package:mindskape/helper.dart';
import 'package:mindskape/model/chatModel.dart';

import '../../../main.dart';

class EditProfile extends StatefulWidget {
  final ProfileDetail profileDetail;

  const EditProfile({
    super.key,
    required this.profileDetail,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
//gestureDetectoe is say where click ina the screen
    return GestureDetector(
      //after decting the position if this is not any keybode need work so it hide the kebord
      //menly it's work is to hiding the keybord or unfocus anything
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(

          //app bar
          appBar: AppBar(
            elevation: 50,
            title: Padding(
              padding: EdgeInsets.only(right: mq.width * .17),
              child: Center(
                  child: Text(
                " Edit Profile",
                style: TextStyle(
                  fontSize: 30,
                ),
              )),
            ),
            backgroundColor: Colors.white,
          ),

          //flotingAction Button

          //body

          body: Form(
            key: _fromkey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mq.width * .06,
                ),
                child: Column(
                  children: [
                    //for adding some space
                    SizedBox(
                      width: mq.width,
                      height: mq.height * .03,
                    ),
                    //user profile picture
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(mq.height * .1),
                          child: CachedNetworkImage(
                            width: mq.height * .2,
                            height: mq.height * .2,
                            fit: BoxFit.fill,
                            imageUrl: widget.profileDetail.image,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) => CircleAvatar(
                                child: Icon(CupertinoIcons.person)),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: MaterialButton(
                            onPressed: () {
                              helper.showProgresssbar(context);
                            },
                            shape: CircleBorder(),
                            elevation: 1,
                            color: CupertinoColors.white,
                            child: Icon(Icons.edit),
                          ),
                        )
                      ],
                    ),

                    //for adding some space
                    SizedBox(
                      height: mq.height * .02,
                    ),

                    //adding email
                    Text(
                      widget.profileDetail.email,
                      style: TextStyle(fontSize: 15),
                    ),
                    //for adding some space
                    SizedBox(
                      height: mq.height * .05,
                    ),

                    TextFormField(
                      onSaved: (val) => APIs.me.name = val ?? "",
                      validator: (val) =>
                          val != null && val.isNotEmpty ? null : "Requred Fill",

                      initialValue: widget.profileDetail.name,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.cyan,
                        ),
                        hintText: " eq.${widget.profileDetail.name}",
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      //for adding some space
                    ),

                    //for adding some space
                    SizedBox(
                      height: mq.height * .035,
                    ),
                    TextFormField(
                      onSaved: (val) => APIs.me.about = val ?? "",
                      validator: (val) =>
                      val != null && val.isNotEmpty ? null : "Requred Fill",

                      initialValue: widget.profileDetail.about,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.insert_emoticon_rounded,
                          color: Colors.cyan,
                        ),
                        hintText: " eq.${widget.profileDetail.about}",
                        labelText: "about",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mq.height * .05,
                    ),

                    //for adding some space
                    SizedBox(
                      height: mq.height * .02,
                    ),

                    //elevationupdate button

                    ElevatedButton.icon(
                        onPressed: () {

                        if(_fromkey.currentState!.validate()){
                          //first of all save in local vaiable me

                          _fromkey.currentState!.save();

                          //then update in the firebasefireStore
                          APIs.updateUser();
                          log("ram is validared");
                        }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(100, 100, 200, 1),
                          minimumSize: Size(mq.width * .5, mq.height * .06),
                        ),
                        icon: Icon(
                          Icons.edit,
                          color: CupertinoColors.white,
                          size: 35,
                        ),
                        label: Text(
                          "UPDATE",
                          style: TextStyle(
                              color: CupertinoColors.white, fontSize: 15),
                        ))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
