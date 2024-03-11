import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mindskape/model/chatModel.dart';
//ALL APIS
class APIs {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static User get user => auth.currentUser!;
  static late  ProfileDetail me;

  static Future<bool> useresist() async {
    return (await firestore
        .collection("Users")
        .doc(user.uid)
        .get())
        .exists;
  }static Future<void> getSelfInfo() async {

    await firestore
        .collection("Users")
        .doc(user.uid)
        .get().then((value) async {
      if(value.exists){
        me=ProfileDetail.fromJson(value.data()!);
      }else{
        await creatuser().then((value) => getSelfInfo());
      }
    });

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


}