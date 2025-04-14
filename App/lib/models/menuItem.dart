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
      riveIcon: TabItem(stateMachine: "HOME_interactivity",artboard: "HOME"),
      title: "Home"
    ),
    MenuItem(
        riveIcon: TabItem(stateMachine: "SEARCH_Interactivity",artboard: "SEARCH"),
        title: "Search"
    ),
    MenuItem(
        riveIcon: TabItem(stateMachine: "STAR_Interactivity",artboard: "LIKE/STAR"),
        title: "Favourites"
    ),
    MenuItem(
        riveIcon: TabItem(stateMachine: "CHAT_Interactivity",artboard: "CHAT"),
        title: "Help"
    ),
  ];

  static List<MenuItem> menuItems2 = [
    MenuItem(
        riveIcon: TabItem(stateMachine: "TIMER_Interactivity",artboard: "TIMER"),
        title: "History"
    ),
    MenuItem(
        riveIcon: TabItem(stateMachine: "BELL_Interactivity",artboard: "BELL"),
        title: "Notifications"
    ),
  ];

  static List<MenuItem> menuItems3 = [
    MenuItem(
        riveIcon: TabItem(stateMachine: "SETTINGS_Interactivity",artboard: "SETTINGS"),
        title: "Dark Mode"
    ),
  ];


}