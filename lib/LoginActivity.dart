import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:mindskape/helper.dart';
import 'firebase_options.dart';
import 'main.dart';

class LoginActivity extends StatelessWidget {
  LoginActivity({super.key});
  var user_profile_controlar = TextEditingController();
  var email_profile_controlar = TextEditingController();
  var password_profile_controlar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),*/
        body: Container(
          // main contener
          width: double.maxFinite,
          height: double.maxFinite,
          /* decoration:  BoxDecoration(
              image:DecorationImage(
                  image: AssetImage("assets/images/sample.jpg"),
                  fit: BoxFit.cover
              )
          ),*/
          child: Stack(
            children: [
              Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/LoginBackground.jpg"),
                        fit: BoxFit.cover)),
              ),
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 30),

                          alignment: Alignment.topCenter,
                          child: Text(
                            "LOGIN",style: TextStyle(
                              fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white,),)),
                      Card(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Colors.black87)),
                        color: Colors.white.withOpacity(.3),
                        elevation: 60,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            //contener of the all imafe textfield and button
                              width: 350,
                              height: 400,
                              alignment: Alignment.topCenter,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // User Image profile circleAvatar......................
                                    //dicable due to singin page######
                                   /* CircleAvatar(
                                      maxRadius: 65,
                                      backgroundColor: Colors.cyan.withOpacity(0.0),
                                      child: Icon(
                                        Icons.account_circle_outlined,
                                        size: 130,
                                        color: CupertinoColors.white,
                                        fill: .5,
                                      ),
                                    ),
                                */
                                    //UserName TextField..............

                                    helper.TextFieldSample(
                                        user_profile_controlar,
                                        "userid",
                                        30,
                                        25,
                                        TextInputType.text,
                                        Colors.black,
                                        Icon(Icons.person),
                                        false),

                                    //  Gap Between two contener
                                    SizedBox(
                                      height: 10,
                                    ),

                                    //Email TextField..............//now email is temp disable
                                   /* helper.TextFieldSample(
                                        email_profile_controlar,
                                        "email",
                                        30,
                                        25,
                                        TextInputType.text,
                                        Colors.black,
                                        Icon(Icons.email),
                                        false),*/

                                    //  Gap Between two contener
                                    SizedBox(
                                      height: 10,
                                    ),

                                    //Password TextField..............
                                    helper.TextFieldSample(
                                        password_profile_controlar,
                                        "password",
                                        30,
                                        25,
                                        TextInputType.text,
                                        Colors.black,
                                        Icon(Icons.password),
                                        true),

                                    //  Gap Between two contener
                                    SizedBox(
                                      height: 30,
                                    ),


                                    ////Sign Up (Elevation) Button.#########################################

                                    helper.ButtonSample(() {
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> MyHomePage(title: "Home Page")));
                                    }, "SIGNIN", Colors.cyanAccent.shade100, Colors.blue,20 ),
                                    SizedBox(
                                      height: 10,
                                    ),


                                    Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,

                                        children: [
                                          //texe is deavle beacause this is login page


                                        //  Text("Already have an account?",style:TextStyle(color: CupertinoColors.white,fontSize: 15),),

                                          TextButton(onPressed: (){}, child: Text("forgot password ?",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.blue.withOpacity(.8),decoration: TextDecoration.underline,decorationColor: Colors.blue),))
                                        ],
                                      ),
                                    )



                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}