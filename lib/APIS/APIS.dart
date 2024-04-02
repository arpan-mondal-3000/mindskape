import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mindskape/model/CurrentMood.dart';
import 'package:mindskape/model/chatModel.dart';
import 'package:mindskape/screens/navigation_pages/home/homeScreen.dart';
//ALL APIS
class APIs {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseDatabase database=FirebaseDatabase.instance;
  static User get user => auth.currentUser!;
  static   ProfileDetail me=ProfileDetail(image: "https://lh3.googleusercontent.com/a/ACg8ocJ_uaKQMOyf6YJhQLSrXkQ56Y3iQ3qEFi_kgapCBmmE=s96-c", about: "ram ram", name: "radhe radhe", createdAt: "", isOnline: false, id: user.uid, pushToken: '', email: "subhadippratihar09@gmail.com");

  static Future<bool> useresist() async {
    return (await firestore
        .collection("Users")
        .doc(user.uid)
        .get())
        .exists;
  }static void getSelfInfo()  {

    firestore
        .collection("Users")
        .doc(user.uid)
        .get().then((value) {
      if(value.exists){
    log("krishna: hare krishna hare krishna${value.data()} ${value.exists}");
        me=ProfileDetail.fromJson(value.data()!);
      }else{
        log("radhe: hare krishna hare krishna");
         creatuser().then((value) => getSelfInfo());

      }
    });
    log("Ram: hare krishna hare krishna");
  }

  static final time = DateTime
      .now()
      .millisecondsSinceEpoch
      .toString();

  static Future<void> creatuser() async {
    final chatuser = ProfileDetail(image: user.photoURL.toString(),
        about: "Radhe Radhe",
        name: user.displayName.toString(),
        createdAt: time,
        isOnline: false,
        id: user.uid,
        pushToken: "",
        email: user.email.toString());

    return await firestore
        .collection("Users")
        .doc(user.uid)
        .set(chatuser.toJson());
  }
//for updating users
  static Future<void> updateUser() async {
   await firestore
        .collection("Users")
        .doc(user.uid)
        .update({
      'name':me.name,
      'about':me.about,
    });
  }
/*  static Future<bool> Moodexist() async {
    return (await firestore
        .collection("Users")
        .doc(user.uid)
        .get())
        .exists;
  }*/

  static Future<void> creatMood( int mood,String image) async {
     final time = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
 var currentTime="${DateTime.now().hour}:${DateTime.now().minute}";
 var currentdate="${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
    final currentMood =CurrentMoodModel(time:currentTime , date:currentdate , mood: mood, isSelected: false, id:auth.currentUser!.uid, image: image);

    return await database.ref("CurrentMood").child(user.uid).child(currentdate).child(time)
        .set(currentMood.toJson());


  }
  static Stream<QuerySnapshot<Map<String, dynamic>>> fireStoreData(){
    return
      APIs.firestore.collection("Users").where("id",isNotEqualTo: user.uid).snapshots();


  }

}