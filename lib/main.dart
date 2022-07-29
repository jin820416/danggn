import 'package:danggn/home_screen.dart';
import 'package:danggn/splash_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3), () => 100),
      builder: (context, snapshot) {
        return AnimatedSwitcher(
            duration: Duration(milliseconds: 900),
            child: _splashLodingWidget(snapshot));
      },
    );
  }

  StatelessWidget _splashLodingWidget(AsyncSnapshot snapshot) {
    if (snapshot.hasError) {
      print("에러가 발생했습니다");
      return Text("Error");
    } else if (snapshot.hasData) {
      return HomeScreen();
    } else {
      return SplashScreen();
    }
  }
}
