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
          Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/HomePageBg.jpg'),fit: BoxFit.cover,opacity:0.8)),
          ),
          Container(
            width: mq.width,
            height: mq.height*.13,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: mq.width*.03,top: mq.height*.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Hi, RADHE!!",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Color(0xff6C464E)),),
                      Text("09 March,2024",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Color(0xff6C464E))),
                    ],

                  ),
                ),

                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.call,size: 40,)),
                   // CircleAvatar( backgroundColor: Colors.white70,child:  IconButton(onPressed: (){}, icon: Icon(Icons\\.notifications,size: Size(mq.width*.03,mq.height*.02),))),

                  ],
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}
