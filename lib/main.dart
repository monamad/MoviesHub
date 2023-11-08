import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/database_utils/firebase_options.dart';
import 'package:movies_app/ui/HomePage.dart';
import 'package:movies_app/ui/movie_details.dart';
import 'package:movies_app/myThemeData/MyThemeData.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        MovieDetails.routeName: (_) => MovieDetails(),
      },

      initialRoute: HomePage.routeName,

      title: 'Movies',
      theme: MyThemeData.Themes,
    );
  }
}
