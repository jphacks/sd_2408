
import '../hub/hub.dart' as hub;
import 'package:flutter/material.dart';

class HubList {
  static final ui = [
    const hub.Home(),
    const hub.Search(),
    const hub.Post(),
    const hub.Notification(),
    const hub.Profile(),
  ];

  static final floatingActionButton = [
    null,
    null,
    null,
    null,
    null,
  ];

  static const label = ["home", "search", "post", "notify", "profile"];

  static const icon = [
    Icons.home,
    Icons.search,
    Icons.post_add,
    Icons.notifications,
    Icons.person
  ];
}
