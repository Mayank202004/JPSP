import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jpss/models/menuItem.dart';
import 'package:rive/rive.dart';
import 'package:get/get.dart';
import '../../controllers/themeController.dart';
import '../../widets/drawerRow.dart';

class CustomDrawerView extends StatefulWidget {
  const CustomDrawerView({super.key});

  @override
  State<CustomDrawerView> createState() => _CustomDrawerViewState();
}

class _CustomDrawerViewState extends State<CustomDrawerView> {
  final List<MenuItem> _browseMenuIcons = MenuItem.menuItems;
  final List<MenuItem> _historyMenuIcons = MenuItem.menuItems2;
  final List<MenuItem> _themeMenuIcons = MenuItem.menuItems3;
  String _selectedMenu = MenuItem.menuItems[0].title;
  bool _isDarkMode = false;
  late SMIBool _menuButton;
  bool _menuButtonInitDone = false;

  void onMenuPress(MenuItem menu){
    setState(() {
      _selectedMenu = menu.title;
    });
  }

  // void onThemeToggle(value){
  //   setState(() {
  //     _isDarkMode = value;
  //   });
  //   _themeMenuIcons[0].riveIcon.status!.change(value);
  // }

  void _onMenuIconInit(Artboard artboard) {
    if (_menuButtonInitDone) return;
    final controller = StateMachineController.fromArtboard(artboard, "Light/Dark Mode Button");
    if (controller != null) {
      artboard.addController(controller);
      _menuButton = controller.findInput<bool>("Toggle_Is_Pressed") as SMIBool;
      _menuButtonInitDone = true;
      final isDark = Get
          .find<ThemeController>()
          .themeMode
          .value == ThemeMode.dark;
      _isDarkMode = isDark;
      print("Current _menuButton.value: ${_menuButton.value}");
      if (_menuButton.value != isDark) {
        _isDarkMode = isDark;

        _themeMenuIcons[0].riveIcon.status!.change(
            isDark);
        _menuButton.change(!_menuButton.value);
      }
      print("Updated _menuButton.value: ${_menuButton.value}");
    }
    }

  void onMenuPressed(value) {
    Get.find<ThemeController>().toggleTheme();
    _isDarkMode = !value;
    _menuButton.change(!_menuButton.value);
    _themeMenuIcons[0].riveIcon.status!.change(!value);
  }
  
  void onThemeRiveIconInit(Artboard artboard){
    final controller = StateMachineController.fromArtboard(artboard, _themeMenuIcons[0].riveIcon.stateMachine);
    artboard.addController(controller!);
    _themeMenuIcons[0].riveIcon.status = controller.findInput<bool>("active") as SMIBool;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 288),
      decoration: const BoxDecoration(
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
                    child: const Icon(Icons.person_2_outlined),
                  ),
                  const SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Ramesh",style: TextStyle(color: Colors.white,fontSize: 17,fontFamily: "Inter"),),
                      Text("X C",style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),)
                    ],
                  )
                ],
              ),
            ),
            MenuButtonSection(title: "BROWSE", menuItems: _browseMenuIcons,selectedMenu: _selectedMenu,onMenuPress: onMenuPress,),
            MenuButtonSection(title: "HISTORY", menuItems: _historyMenuIcons,selectedMenu: _selectedMenu,onMenuPress: onMenuPress),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 32,
                    width: 32,
                    child: IgnorePointer(
                      child: Opacity(
                        opacity: 0.6,
                        child: RiveAnimation.asset(
                          'assets/rive/icons.riv',
                          stateMachines: [_themeMenuIcons[0].riveIcon.stateMachine],
                          artboard: _themeMenuIcons[0].riveIcon.artboard,
                          onInit: onThemeRiveIconInit,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _themeMenuIcons[0].title,
                      style: const TextStyle(color: Colors.white,fontSize: 17,fontFamily: "Inter",fontWeight: FontWeight.w600),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){onMenuPressed(_isDarkMode);},
                    child: Container(
                      height: 70,
                      width: 70,
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                      ),
                      child: IgnorePointer(
                        child: RiveAnimation.asset(
                          'assets/rive/theme_toggle_button.riv',
                          stateMachines: const ["Light/Dark Mode Button"],
                          animations: const ["Anim_Light_to_Dark", "Anim_Dark_to_Light"],
                          onInit: _onMenuIconInit,
                        ),
                      ),
                    ),
                  ),
                  //CupertinoSwitch(value: _isDarkMode, onChanged: onThemeToggle),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuButtonSection extends StatelessWidget {
  const MenuButtonSection({super.key, required this.title, required this.menuItems, this.selectedMenu = "Home", this.onMenuPress});

  final String title;
  final String selectedMenu;
  final List<MenuItem> menuItems;
  final Function(MenuItem menu)? onMenuPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24,right: 24,top: 40,bottom: 8),
          child: Text(title,style: TextStyle(color: Colors.white.withValues(alpha: 0.7),fontSize: 15,fontFamily: "Inter"),),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              for (var menu in menuItems) ...[
                Divider(
                  color: Colors.white.withValues(alpha: 0.1),
                  thickness: 1,
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                DrawerRow(menu: menu,selectedMenu: selectedMenu,onMenuPress: () => onMenuPress!(menu),)
              ]
            ],
          ),
        )

      ],
    );
  }
}

