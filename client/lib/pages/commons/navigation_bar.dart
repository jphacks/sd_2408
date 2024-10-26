import 'package:flutter/material.dart';
import 'commons.dart';

const double p = 8;
const double n = 8;

class HackNavigationBar extends StatelessWidget {
  const HackNavigationBar({
    super.key,
    required this.index,
    required this.changeIndex,
  });

  final int index;
  final void Function(int) changeIndex;

  @override
  Widget build(context) {
    return NavigationBar(
        backgroundColor: Colors.green,
        onDestinationSelected: changeIndex,
        selectedIndex: index,
        destinations: [
          for (int i = 0; i < HubList.ui.length; i++)
            NavigationDestination(
              icon: Icon(HubList.icon[i]),
              label: HubList.label[i],
            )
        ]);
  }
}

/////////////////////////////////////////////////////////////////////////

Widget listTile(BuildContext context, i, void Function(int) changeIndex) {
  return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.transparent),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, p, p, p),
          child: Icon(HubList.icon[i], size: 32 * n, color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.all(p),
          child: Text(HubList.label[i],
              style: const TextStyle(fontSize: 16 * n, color: Colors.black)),
        )
      ]),
      onPressed: () {
        changeIndex(i);
      });
}
