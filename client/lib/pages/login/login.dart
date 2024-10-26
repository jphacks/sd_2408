import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'sign_in.dart';
import 'sign_up.dart';
import '../commons/navigation_bar.dart';
import 'package:go_router/go_router.dart';

const double p = 2;

class Login extends HookWidget {
  const Login({super.key});

  @override
  Widget build(context) {
    final index = useState(0);

    final logins = [
      SignIn(changeIndex: (int a) {
        index.value = a;
      }),
      SignUp(changeIndex: (int a) {
        index.value = a;
      }),
    ];

    const icons = [
      Icons.login,
      Icons.add_circle,
    ];
    const labels = [
      "SignIn",
      "SignUp"
    ];

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Center(child: Text("Hack Match", style: TextStyle(color: Colors.white))),
          backgroundColor: Colors.green,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logins[index.value],
            Padding(
                padding: const EdgeInsets.all(p),
                child: ElevatedButton(
                    onPressed: () {
                      context.go("/hub");
                    },
                    child: const Text("Go to hub")))
          ],
        )),
        bottomNavigationBar: HackNavigationBar(
            index: index.value,
            changeIndex: (int a) {
              index.value = a;
            },
            icons: icons,
            labels: labels,
        ));
  }
}
