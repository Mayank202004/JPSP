import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/settingController.dart';
import '../../utils/helper.dart';

class Setting extends StatelessWidget {
  Setting({super.key});

  final SettingController settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap:() {
                confirmDialog("Logout","Are you sure you want to logout",settingController.logout);
              },
              leading:  const Icon(Icons.logout),
              title: const Text("Logout"),
              trailing: const Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
    );
  }
}
