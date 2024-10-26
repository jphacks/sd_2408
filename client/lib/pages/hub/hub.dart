export '../hub/home.dart';
export '../hub/notification.dart';
export '../hub/post.dart';
export '../hub/profile.dart';
export '../hub/search.dart';
import '../commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../commons/navigation_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

const double imageSize = 100;
const double elevation = 16;
const drawerImage =
    "https://pbs.twimg.com/profile_images/516483897786265600/rlLkOs-C_400x400.jpeg";
final url = Uri.parse("https://jphacks.com");
const double n = 1;

class Hub extends HookWidget {
  const Hub({super.key});

  @override
  Widget build(context) {
    final index = useState(0);
    return Scaffold(
        appBar: appBar(),
        drawer: drawer(
            context: context,
            index: index.value,
            changeIndex: (int a) {
              index.value = a;
              context.pop(context);
            }),
        bottomNavigationBar: HackNavigationBar(
            index: index.value,
            changeIndex: (int a) {
              index.value = a;
            }),
        body: HubList.ui[index.value]
    );
  }
}

PreferredSizeWidget? appBar() {
  return AppBar(
    title: const Center(
      child: Text("Hack Match", style: TextStyle(color: Colors.white)),
    ),
    elevation: elevation,
    backgroundColor: Colors.green,
  );
}

Widget drawer({
  required BuildContext context,
  required int index,
  required void Function(int a) changeIndex,
}) {
  return Drawer(
    child: ListView(children: [
      DrawerHeader(
          decoration: const BoxDecoration(color: Colors.green),
          child: Center(
              child: SizedBox(
                  width: imageSize,
                  height: imageSize,
                  child: GestureDetector(
                      onTap: () {
                        launchUrl(url);
                      },
                      child: Image.network(
                        drawerImage,
                        cacheWidth: 100,
                        cacheHeight: 100,
                      )
)))),
      for (int i = 0; i < HubList.ui.length; i++)
        listTile(context, i, changeIndex),
    ]),
  );
}

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
