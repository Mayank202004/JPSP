import 'package:flutter/material.dart';
import 'package:jpss/views/profile/personalDetails.dart';
import 'package:jpss/views/profile/profile.dart';
import 'package:jpss/views/scholarships/scholarships.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Scholar"),
              accountEmail: Text("scholar@edu.in"),
              currentAccountPicture: CircleAvatar(child: Icon(Icons.account_circle,size: 80,),),
            ),
            ListTile(
              title: const Text("Home"),
              leading: const Icon(Icons.home),
              onTap: (){},
            ),
            ListTile(
              title: const Text("Profile"),
              leading: const Icon(Icons.account_circle_sharp),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => personalDetails(),));
              },
            ),
            ListTile(
              title: const Text("Scholarships"),
              leading: const Icon(Icons.pending_actions),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Scholarships(),));
              },
            ),
            ListTile(
              title: const Text("Settings"),
              leading: const Icon(Icons.settings),
              onTap: (){},
            ),
            ListTile(
              title: const Text("About"),
              leading: const Icon(Icons.info),
              onTap: (){},
            ),
            const ListTile(
              title: Text("jpss"),
              subtitle: Text("Developed by JP's GLobal"),

            ),
          ],
        )
    );
  }
}
