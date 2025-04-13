import 'package:flutter/material.dart';
import 'package:jpss/models/menuItem.dart';

import '../../widets/drawerRow.dart';

class CustomDrawerView extends StatefulWidget {
  const CustomDrawerView({super.key});

  @override
  State<CustomDrawerView> createState() => _CustomDrawerViewState();
}

class _CustomDrawerViewState extends State<CustomDrawerView> {
  final List<MenuItem> _browseMenuIcons = MenuItem.menuItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 288),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),topRight: Radius.circular(30)),
        color: Color(0xFF22263E)
      ),
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white.withValues(alpha: 0.2),
                    foregroundColor: Colors.white,
                    child: Icon(Icons.person_2_outlined),
                  ),
                  SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Ramesh",style: TextStyle(color: Colors.white,fontSize: 17,fontFamily: "Inter"),),
                      Text("X C",style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),)
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24,right: 24,top: 40,bottom: 8),
              child: Text("Browse",style: TextStyle(color: Colors.white.withValues(alpha: 0.7),fontSize: 15,fontFamily: "Inter"),),
            ),
            DrawerRow(menu: _browseMenuIcons[0],)
          ],
        ),
      ),
    );
  }
}
