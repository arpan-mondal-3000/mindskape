import 'package:flutter/material.dart';

import '../../../main.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(

      body: Stack(
        children: [
          Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/HomePageBg.jpg'),fit: BoxFit.cover)),
          ),
          Container(
            width: mq.width,
            height: mq.height*.1,
            color: Colors.white70,
          )
        ],
      ),

    );
  }
}
