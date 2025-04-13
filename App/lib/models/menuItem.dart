import 'package:flutter/cupertino.dart';
import 'package:jpss/models/tabItem.dart';

class MenuItem{
  MenuItem({
    this.id,
    this.title = "",
    required this.riveIcon
  });

  UniqueKey? id = UniqueKey();
  String title;
  TabItem riveIcon;

  static List<MenuItem> menuItems = [
    MenuItem(
      riveIcon: TabItem(stateMachine: "HOME_interativity",artboard: "HOME"),
      title: "Home"
    ),
    MenuItem(
        riveIcon: TabItem(stateMachine: "SEARCH_Interativity",artboard: "SEARCH"),
        title: "Home"
    ),
    MenuItem(
        riveIcon: TabItem(stateMachine: "STAR_Interativity",artboard: "STAR"),
        title: "Home"
    ),
  ];

}