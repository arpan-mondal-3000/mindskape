import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mindskape/APIS/APIS.dart';

import '../../../main.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}
class _HomePagesState extends State<HomePages> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log('message${APIs.me.name}');
  }

int currentMood=0;
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/HomePageBg.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.8)),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  width: mq.width,
                  height: mq.height * .13,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: mq.width * .03, top: mq.height * .03),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              APIs.me.name,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff6C464E)),
                            ),
                            Text("09 March,2024",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff6C464E))),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.call,
                                size: 40,
                              )),
                          CircleAvatar(
                            backgroundColor: Colors.white70,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications,
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,


                children: [
                  Card(
                    color: Colors.white70.withOpacity(.7),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(),

                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: (){
                              currentMood=1;
                              setState(() {


                                APIs.creatMood(currentMood,'assets/images/happy.png');
                              });
                            },

                            child: Image(image: AssetImage('assets/images/happy.png'))),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white70.withOpacity(.7),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(),

                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: (){
                              currentMood=2;
                              setState(() {


                                APIs.creatMood(currentMood,'assets/images/sad.png');
                              });
                            },

                            child: Image(image: AssetImage('assets/images/sad.png'))),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white70.withOpacity(.7),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(),

                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: (){
                              currentMood=3;
                              setState(() {


                                APIs.creatMood(currentMood,'assets/images/angry.png');
                              });
                            },

                            child: Image(image: AssetImage('assets/images/angry.png'))),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white70.withOpacity(.7),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(),

                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: (){
                              currentMood=4;
                              setState(() {


                                APIs.creatMood(currentMood,'assets/images/love.png');
                              });
                            },

                            child: Image(image: AssetImage('assets/images/love.png'),)),
                      ),
                    ),
                  ),
                ],
              ),
              Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    color: Colors.white70.withOpacity(.7),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(),

                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: (){
                              currentMood=5;
                              setState(() {


                                APIs.creatMood(currentMood,'assets/images/upset.png');
                              });
                            },

                            child: Image(image: AssetImage('assets/images/upset.png'))),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white70.withOpacity(.7),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(),

                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: (){
                              currentMood=6;
                              setState(() {


                                APIs.creatMood(currentMood,'assets/images/like.png');
                              });
                            },

                            child: Image(image: AssetImage('assets/images/like.png'))),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white70.withOpacity(.7),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(),

                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: (){
                              currentMood=7;
                              setState(() {


                                APIs.creatMood(currentMood,'assets/images/thinking.png');
                              });
                            },

                            child: Image(image: AssetImage('assets/images/thinking.png'))),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white70.withOpacity(.7),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(),

                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: (){
                              currentMood=8;
                              setState(() {


                                APIs.creatMood(currentMood,'assets/images/medation.png');
                              });
                            },

                            child: Image(image: AssetImage('assets/images/medation.png'))),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
