import 'package:flutter/material.dart';
import '../../../main.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/CategoriesPageBg.jpg'),
                    fit: BoxFit.cover,
                    opacity: .8)),
          ),
          Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.symmetric(vertical: mq.height*.05, horizontal: 20),
                  child: Text(
                      'CATEGORIES',
                      style: TextStyle(
                        fontSize: 26,
                      ))),
            ],
          )
        ],
      ),

    );
  }
}
