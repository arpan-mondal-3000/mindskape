import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mindskape/APIS/APIS.dart';
import 'package:mindskape/helper.dart';

import '../../../main.dart';

class WriteJournal extends StatelessWidget {
  final  title;
  final content;
  final bool onupdate;


  WriteJournal({super.key, this.title, this.content, required this.onupdate});

  var Titletextcontrolar = TextEditingController();
var Contenttextcontrolar = TextEditingController();
  final time=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/CommunityPageBg.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.8)),
        ),
        SingleChildScrollView(
          child: Column(
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
                              "ADD NOTES",
                              style: TextStyle(
                                  color: Color(0xff6C464E),
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900),
                            )),
                        Positioned(
                            right: 10,
                            bottom: 10,
                            child: InkWell(
                                onTap: () {
                                  APIs.database.ref("Journal").child(APIs.auth.currentUser!.uid).child(time.millisecondsSinceEpoch.toString()).set(
                                    {
                                      'title':Titletextcontrolar.text.toString(),
                                      'content':Titletextcontrolar.text.toString(),
                                      'time':"${time.day}/${time.month}/${time.year}"
                                    }
                                  ).then((value) => helper.showStackBaar(context, "added data"));
                                  log("time: ${time}");



                                },
                                child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: Icon(
                                      Icons.done_rounded,
                                      size: 30,
                                      color: Colors.white70.withOpacity(1),
                                    ))))
                      ],
                    )),
              ]),
              const Divider(
                color: Colors.black,
                thickness: 2,
                height: 0,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: title,

                        controller: Titletextcontrolar,
                        textAlign: TextAlign.center,
                        style: TextStyle(

                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white70)),


                            hintText: "Add Title"),
                      ),
                  
                  
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.white70,
                          height: 500,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              initialValue: content,


                              controller:  Contenttextcontrolar,
                              maxLines: null,


                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(fillColor: Colors.white70,
                                  border:InputBorder.none,
                                  hintText: "Write  Content", ),


                            ),
                          ),
                        ),
                      )


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
