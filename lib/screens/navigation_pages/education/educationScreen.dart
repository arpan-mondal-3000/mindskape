import 'package:flutter/material.dart';
import '../../../main.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {

  dynamic articles = [];

  @override
  Widget build(BuildContext context) {
    articles = ModalRoute.of(context)?.settings.arguments;
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

                Expanded(
                  child: ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: () => launchUrl(Uri.parse(articles[index][1])),
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.6),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                articles[index][0],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Text(articles[index][2], style: TextStyle(fontSize: 16),)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
