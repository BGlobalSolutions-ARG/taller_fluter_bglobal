// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bglobal/src/presentation/pages/home/home_page.dart';
import 'package:bglobal/src/presentation/pages/second/second_page.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final log = Logger();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          backgroundColor: Colors.deepOrange,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/second': (context) => const SecondPage(),
      },
    );
  }
}
