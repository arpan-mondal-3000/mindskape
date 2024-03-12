import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mindskape/APIS/APIS.dart';
import 'package:mindskape/screens/navigation_pages/home/homeScreen.dart';

import '../navigation_pages/categories/categoriesScreen.dart';
import '../navigation_pages/profile/ProfileActivity.dart';


class BottomsampleNevigation extends StatefulWidget {

  BottomsampleNevigation();

  @override
  State<BottomsampleNevigation> createState() => _BottomsampleNevigationState();
}

class _BottomsampleNevigationState extends State<BottomsampleNevigation> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    APIs.getSelfInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controlar=  Get.put(Navigationcontrolar());
    return  Scaffold(
      bottomNavigationBar:
      Obx(
            ()=> NavigationBar(

          height: 65,
          elevation: 7,
          selectedIndex: controlar.SelectedIndex.value,
          backgroundColor: Colors.cyanAccent.shade100,
          onDestinationSelected: (index)=>   controlar.SelectedIndex.value=index,

          destinations: const [
            const NavigationDestination(icon:Icon(Icons.home), label:"Home"),
            const NavigationDestination(icon:Icon(Icons.scatter_plot_outlined), label:"Catagoty"),
            const NavigationDestination(icon:Icon(Icons.chat), label:"Chats"),
            const NavigationDestination(icon:Icon(Icons.account_circle_rounded), label:"Profile"),
          ],

        ),
      )
      ,body: Obx(()=>controlar.screen[controlar.SelectedIndex.value]),


    );
  }
}
class Navigationcontrolar extends GetxController{
  final Rx<int> SelectedIndex=0.obs;
  final screen=[
    HomePages(),
    CategoriesScreen(),
    Container(color: Colors.purpleAccent.shade400,),

    ProfileActivity(profileDetail:APIs.me),
  ];

}
