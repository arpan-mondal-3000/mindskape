import 'package:flutter/material.dart';
import '../../../main.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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
                    image: AssetImage('assets/images/NewsPageBg.jpg'),
                    fit: BoxFit.cover,
                    opacity: .8,
                    alignment: Alignment(0.5, 0),
                ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
                  child: const Text(
                    'NEWS',
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
