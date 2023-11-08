import 'package:bglobal/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:occam/occam.dart';

import '../../../domain/domains.dart';

class FormController extends StateController {
  final key = GlobalKey<FormState>();
  final obscurePassword = true.rx;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void onSave() {
    if (!key.currentState!.validate()) return;

    final email = emailController.text;
    final password = passwordController.text;

    // log.d(email);
    log.d(password);
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'No puede dejar el campo vacío';
    }
    if (value.length < 4) {
      return 'El campo ingresado no tiene el largor suficiente';
    }

    return null;
  }
}
