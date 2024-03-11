import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class helper {
  static ButtonSample(VoidCallback? callback, String? name, Color baccolor,
      Color textcolor, double textsize) {
    return
    SizedBox(
        width: 150,
        height: 50,
        child: ElevatedButton(
            onPressed: callback,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(baccolor),

            ),
            child: Text(
              name!,
              style: TextStyle(
                fontSize: textsize,
                color: textcolor,
                fontWeight: FontWeight.w800,
              ),
            )));
  }

  static TextFieldSample(
    TextEditingController controller,
    String hinttext,
    double borderRadius,
    double textsize,
    TextInputType inputType,
    Color textcolor,
    Icon icon,
    bool hidetext,
  ) {
    return SizedBox(
      width: 300,
      height: 55,
      child: TextField(
          obscureText: hidetext,
          keyboardType: inputType,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical( y: .7),

          maxLines: 1,
          autofocus: false ,
          style: TextStyle(

            color: textcolor,
            fontSize: textsize,
            fontWeight: FontWeight.w600
          ),
          controller: controller,
          cursorHeight: 40,

          decoration: InputDecoration(
              hintText: hinttext,
              prefixIcon: icon,
              isDense: true,


              contentPadding: EdgeInsets.only(right:20 ,bottom: 10),
              filled: true,
              fillColor: CupertinoColors.white,

              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                  borderRadius: BorderRadius.circular(borderRadius)))),
    );
  }

  static bottomNavigationSamole() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.cyan,
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Call"),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: "camara"),
        ],
      ),
    );
  }

  static showProgresssbar(BuildContext context){
showDialog(context: context, builder: (BuildContext context)=>
const Center(child: CircularProgressIndicator(),)
);
  }
  static void showStackBaar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: Colors.blue.withOpacity(.7),
      behavior: SnackBarBehavior.floating,
    ));
  }

}
