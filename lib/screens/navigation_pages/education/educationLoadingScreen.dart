import 'package:flutter/material.dart';
import 'package:mindskape/screens/navigation_pages/education/educationService.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class educationLoading extends StatefulWidget {
  const educationLoading({super.key});

  @override
  State<educationLoading> createState() => _educationLoadingState();
}

class _educationLoadingState extends State<educationLoading> {

  void setupEdNews() async{
    MentalhealthEducation instance = MentalhealthEducation();
    await instance.getEdNews();

    Navigator.pushReplacementNamed(context, '/education', arguments: instance.articles);
  }

  @override
  void initState() {
    super.initState();
    setupEdNews();
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
