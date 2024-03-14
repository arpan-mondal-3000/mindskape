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


class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

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
                                Container(
                                  height: 200,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      image: NetworkImage(articles[index][2],),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                    articles[index][0],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                ),
                                const SizedBox(height: 5,),
                                Text(articles[index][3])
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
