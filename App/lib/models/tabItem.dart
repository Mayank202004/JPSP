import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class TabItem{
  TabItem({
    this.stateMachine = "",
    this.artboard = "",
    this.status,

 });

  UniqueKey id = UniqueKey();
  String stateMachine;
  String artboard;
  late SMIBool? status;

  static List<TabItem> tabItemList = [
    TabItem(stateMachine: "CHAT_Interconnectivity",artboard: "CHAT")
  ];
 }