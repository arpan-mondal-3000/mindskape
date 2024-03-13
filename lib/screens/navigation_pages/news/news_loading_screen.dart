import 'package:flutter/material.dart';
import 'package:mindskape/screens/navigation_pages/news/news_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupNews() async{
    MentalhealthNews instance = MentalhealthNews();
    await instance.getNews();

    Navigator.pushReplacementNamed(context, '/news', arguments: instance.articles);
  }

  @override
  void initState() {
    super.initState();
    setupNews();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.black,
          size: 50.0,
        ),
      ),
    );
  }
}
