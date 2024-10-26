import 'package:flutter/material.dart';
import 'commons.dart';

const double p = 8;
const double n = 8;

class HackNavigationBar extends StatelessWidget {
  const HackNavigationBar({
    super.key,
    required this.index,
    required this.changeIndex,
    required this.icons,
    required this.labels
  });

  final int index;
  final void Function(int) changeIndex;
  final List<IconData> icons;
  final List<String> labels;

  @override
  Widget build(context) {
    return NavigationBar(
        backgroundColor: Colors.green,
        onDestinationSelected: changeIndex,
        selectedIndex: index,
        destinations: [
          for (int i = 0; i < icons.length; i++)
            NavigationDestination(
              icon: Icon(icons[i]),
              label: labels[i],
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
