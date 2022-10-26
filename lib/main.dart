import 'package:flutter/material.dart';
import 'package:mova/ui/screens/movie_details_screen.dart';
import 'package:mova/ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF181A20),
      ),
      initialRoute: '/details',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/details': (context) => const MovieDetailsScreen()
      },
    );
  }
}
