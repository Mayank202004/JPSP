import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:rive/rive.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controllers/profileController.dart';
import '../drawerView/customDrawerView.dart';
import '../drawerView/drawerView.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  late SMIBool _menuButton;
  late AnimationController? _animationController;
  late Animation<double> _sidebarAnim;
  final springDesc = const SpringDescription(mass: 0.1, stiffness: 40, damping: 5);

  @override
  void initState(){
    _animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 200),upperBound: 1);
    _sidebarAnim = Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: _animationController!, curve: Curves.linear));
    super.initState();
  }

  @override
  void dispose(){
    _animationController?.dispose();
    super.dispose();
  }

  void _onMenuIconInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, "State Machine");
    artboard.addController(controller!);
    _menuButton = controller.findInput<bool>("isOpen") as SMIBool;
    _menuButton.value = true;
  }

  void onMenuPressed() {
    if(_menuButton.value){
      final springAnim = SpringSimulation(springDesc,0,1,0);
      _animationController?.animateWith(springAnim);
    }else{
      _animationController?.reverse();
    }
    _menuButton.change(!_menuButton.value);
  }

  @override
  Widget build(BuildContext context) {
    Get.find<ProfileController>();
    final username = GetStorage().read('username') ?? 'Scholar';
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
              animation: _sidebarAnim,
              builder: (context,child){
                return Transform.translate(offset: Offset(_sidebarAnim.value * 265, 0),child: child,);
              },
              child: CustomDrawerView()),
          home(username), // Pass username to home method
          SafeArea(
            child: GestureDetector(
              onTap: onMenuPressed,
              child: Container(
                height: 44,
                width: 44,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(44 / 2),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 5, offset: const Offset(0, 5))],
                ),
                child: RiveAnimation.asset(
                  'assets/rive/menu_button.riv',
                  stateMachines: const ["State Machine"],
                  animations: const ["open", "close"],
                  onInit: _onMenuIconInit,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const DrawerView(),
    );
  }

  Widget home(String username) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome $username!", style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const Text("Profile Completeness"),
            Stack(
              children: [
                Container(
                  width: 250,
                  height: 15,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.green),
                ),
                Container(
                  width: double.infinity,
                  height: 15,
                  decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(20)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
