import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mindskape/helper.dart';
import 'package:mindskape/screens/navigation_pages/profile/ProfileActivity.dart';
import '../../../main.dart';
import 'EducationLoadUrl.dart';

String? stringResponse;
Map? mapresponse;

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://api.nhs.uk/mental-health?subscription-key=527dd456f8bb49c59f4d3fb75879eef3'));
    if (response.statusCode == 200) {
      log("4");
      setState(() {
       // stringResponse = response.body;
        mapresponse = json.decode(response.body);
      });
    }

  }






  @override
  void initState() {
log("1");
    apicall();
log("2");
    Future.delayed(Duration(seconds: 3),(){log("3");});
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mental Education'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image:
                  AssetImage('assets/images/MentalHealthEducationPageBg.jpg'),
              fit: BoxFit.cover,
              opacity: .7),
        ),
        child:
        ListView.builder(
          itemCount: 34,
          itemBuilder: (context, index)  {
            return  (mapresponse?["hasPart"][index]["headline"]) != ""
                ?    Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: () {
                //  Navigator.pushNamedAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>ProfileActivity(profileDetail: profileDetail)), (route) => false)

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => WebViewPage(
                              mapresponse!["hasPart"][index]["url"]
                                  .toString())));

                },
                child: Card(
                  child:  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(

                        mapresponse!["hasPart"][index]["headline"]
                            .toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(

                          // decoration: TextDecoration.underline,
                          // decorationColor: Colors.blueAccent,
                          // decorationThickness: 3,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Text(mapresponse!["hasPart"][index]
                    ["description"]
                        .toString()),
                    trailing: Icon(Icons.more_horiz_outlined),
                  ),
                ),
              ),
            )
                : Card(
              child: ListTile(title: Text("data not found")),
            );
          },
        )
      ),
    );
  }
}
