import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../commons/input_form.dart';
import '../commons/button.dart';
import '../../logics/http/post.dart';
import 'package:go_router/go_router.dart';

class SignUp extends HookWidget {
  const SignUp({
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

    const labels = ["Email", "Password"];

    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      HackInputForm(
          controllers: controllers.value,
          validators: validators,
          labels: labels),
      HackButton(
          handler: () async {
            try {
              final response = await postUser(
                name: "namae",
                birthday: 19900101, // yyyymmdd形式
                email: controllers.value[0].text,
                password: controllers.value[1].text,
                place: "Tokyo",
                githubURL: "https://github.com/johndoe",
                selfIntro: "Hello, I am John!",
                groupIDs: [],
                iconPath: "/home/segnities007/Pictures/image/segnities007.png",
                preference: "Go, Docker",
              );
              if(context.mounted){
                context.go("");
              }
            } catch (e) {
              print(e); //TODO デバック用に修正
            }
          },
          label: "Create")
    ]));
  }
}

String? emptyValidator(String? value) {
  return "";
}
