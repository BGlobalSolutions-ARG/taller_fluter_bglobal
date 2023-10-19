import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  String? title;

  void init() async {
    await Future.delayed(Duration.zero);
    final args = ModalRoute.of(context)!.settings.arguments;
    log.d(args);
    setState(() {
      title = args.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Second Page'),
        // automaticallyImplyLeading: false,
      ),
      body: Center(
        child: CupertinoButton(
          onPressed: onTap,
          child: const Text('Volver'),
        ),
      ),
    );
  }

  void onTap() => Navigator.of(context).pop(true);
}
