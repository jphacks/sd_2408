import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../commons/input_form.dart';

class SignIn extends HookWidget {
  const SignIn({
    super.key,
    required this.changeIndex,
  });

  final void Function(int) changeIndex;

  @override
  Widget build(context) {
    final controllers = useState([
      TextEditingController(),
      TextEditingController(),
    ]);

    final validators = [
      emptyValidator,
      emptyValidator,
    ];

    const labels = [
      "Email",
      "Password"
    ];

    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HackInputForm(
                controllers: controllers.value,
                validators: validators,
                labels: labels
              )
            ]
        )
    );
  }
}

String? emptyValidator(String? value) {
  return "";
}
