import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';

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
        title: const Text('Home'),
        actions: [
          CupertinoButton(
            onPressed: onAdd,
            child: const Icon(Icons.plus_one),
          )
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: 1000,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: onDialog,
                icon: const Icon(Icons.menu),
                label: const Text('Abrir dialogo'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: onBottomSheet,
                child: const Text('Abrir bottomsheet'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              MyButton(
                label: 'Navegar a otra pantalla',
                onTap: onAdd,
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: showValue,
                child: const Text('Uso de extensiones'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onAdd() async {
    final result = await Navigator.of(context).pushNamed(
      '/second',
      arguments: 'HOLA PERO DESDE UN PUSHNAMED',
    );
    log.d(result);
  }

  void onDialog() async {
    final result = await showAdaptiveDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('Hola soy un dialogo'),
        content: const Center(child: CircularProgressIndicator.adaptive()),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
    log.d(result);
  }

  void onBottomSheet() async {
    final result = await showCupertinoModalPopup(
      context: context,
      builder: (ctx) => Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height / 2,
        child: Center(
          child: TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Aceptar'),
          ),
        ),
      ),
    );
    log.d(result);
  }

  void showValue() {
    context.showValue('este es un valor para mostrarse'.allUppercase());
  }
}

extension MyStringExtension on String {
  String allUppercase() => toUpperCase();
}

extension MyExtension on BuildContext {
  void showValue(String value) => showAdaptiveDialog(
        context: this,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text('Hola soy un dialogo'),
          content: Center(child: Text(value)),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
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
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
