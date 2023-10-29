import 'package:flutter/material.dart';
import 'package:movies_app/ui/HomePage.dart';
import 'package:movies_app/ui/myThemeData/MyThemeData.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (_) => HomePage(),
      },
      initialRoute: HomePage.routeName,

      title: 'Movies',
      theme: MyThemeData.Themes,
    );
  }
}
