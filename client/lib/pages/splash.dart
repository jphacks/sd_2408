import 'package:flutter/material.dart';

class Splash extends StatelessWidget{
  const Splash({
    super.key,
    required this.changeIndex,
  });

  final void Function(int) changeIndex;

  @override
  Widget build(context){
    return const Center();
  }
}
