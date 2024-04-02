import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindskape/model/chatModel.dart';

import '../main.dart';

class ChatsUserCard extends StatefulWidget {
  final  ProfileDetail profileDetail;
  const ChatsUserCard({super.key, required this.profileDetail,});

  @override
  State<ChatsUserCard> createState() => _ChatsUserCardState();
}

class _ChatsUserCardState extends State<ChatsUserCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          log("${widget.profileDetail.image}");
        },
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: mq.width*.04,vertical: 4),
          elevation: .5,

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child:InkWell(
            onTap:() { //Navigator.push(context, MaterialPageRoute(builder: (_)=>UserCharsScreen(userChat: widget.userChat))); },
              child:
              ListTile(
                title: Text(widget.profileDetail.name),
                subtitle: Text(widget.profileDetail.about),
                trailing: CircleAvatar(backgroundColor: Colors.green,
                  maxRadius: 10,
                  child: Text("1", style: TextStyle(color: Colors.white),),),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(mq.height * .03),

                  child: CachedNetworkImage(
                    width: mq.height * .06,
                    height: mq.height * .06,
                    fit: BoxFit.cover,
                    imageUrl: widget.profileDetail.image,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        CircleAvatar(child: Icon(CupertinoIcons.person)),

                  ),
                ),
              );

            }),
        ));
  }
}
