import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MainApp()
    )
  );
}

final GoRouter _router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, stage) => const Login()),
  GoRoute(path: "/hub", builder: (context, stage) => const Hub()),
]);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}
