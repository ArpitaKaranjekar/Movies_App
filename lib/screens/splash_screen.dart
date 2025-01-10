import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quadb_tech_task/bottom_navigator.dart';
//import 'package:quadb_tech_task/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavScreen()),
      );
    });
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset("assets/images/movie.json",
            width: width * 0.5, height: height * 0.6),
      ),
    );
  }
}
