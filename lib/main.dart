// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      home: const HomePage(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sin estado'),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var counter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sin estado'),
        actions: [
          CupertinoButton(
            onPressed: onAdd,
            child: const Icon(Icons.plus_one),
          )
        ],
      ),
      body: Center(
        child: MyButton(
          label: 'Apretar aquí $counter',
          onTap: onAdd,
        ),
      ),
      bottomNavigationBar: Container(
        height: 56,
        color: Colors.white,
      ),
    );
  }

  void onAdd() {
    print(counter);
    setState(() => counter++);
  }
}

class MyButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const MyButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
          color: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
