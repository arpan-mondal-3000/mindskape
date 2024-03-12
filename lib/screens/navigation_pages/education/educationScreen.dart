import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
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
                    image: AssetImage('assets/images/MentalHealthEducationPageBg.jpg'),
                    fit: BoxFit.cover,
                    opacity: .8)),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                    child: const Text(
                        'MENTAL HEALTH EDUCATION',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff523037),
                        ),
                    ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                  height: 0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
