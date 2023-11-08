import 'package:ff_annotation_route_library/ff_annotation_route_library.dart';
import 'package:occam/occam.dart';

import '../../widgets/widgets.dart';
import 'form_controller.dart';

@FFRoute(name: '/form')
class FormPage extends StateWidget<FormController> {
  const FormPage({Key? key}) : super(key: key);

  @override
  FormController createState() => FormController();

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Palette.gray5),
    );
    const focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Palette.gray1),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Form(
          key: state.key,
          child: Column(
            children: [
              TextFormField(
                controller: state.emailController,
                validator: state.emailValidator,
                autofocus: true,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.name],
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Correo',
                  filled: true,
                  hintText: 'ingrese su correo',
                  errorBorder: border,
                  enabledBorder: border,
                  border: border,
                  focusedBorder: focusedBorder,
                  disabledBorder: border,
                ),
              ),
              gap6,
              RxWidget(
                notifier: state.obscurePassword,
                builder: (context, obscure) => TextFormField(
                  validator: state.emailValidator,
                  controller: state.passwordController,
                  onFieldSubmitted: (value) => state.onSave(),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: obscure,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    filled: true,
                    suffixIcon: Icon(
                      obscure ? Icons.visibility : Icons.visibility_off,
                      color: Palette.gray1,
                    ).toButton(() => state.obscurePassword.toggle()),
                    hintText: 'ingrese su contraseña',
                    errorBorder: border,
                    enabledBorder: border,
                    border: border,
                    focusedBorder: focusedBorder,
                    disabledBorder: border,
                  ),
                ),
              ),
              gap64,
              ElevatedButton.icon(
                onPressed: state.onSave,
                icon: const Icon(Icons.save),
                label: const Text("Guardar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
