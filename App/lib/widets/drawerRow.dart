import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jpss/models/menuItem.dart';
import 'package:rive/rive.dart';

class DrawerRow extends StatelessWidget {
  const DrawerRow({super.key, required this.menu, this.selectedMenu="Home", this.onMenuPress});

  final MenuItem menu;
  final String selectedMenu;
  final Function? onMenuPress;

  void onMenuPressed(){
    if(selectedMenu != menu.title){
      onMenuPress!();
      menu.riveIcon.status!.change(true);
      Future.delayed(const Duration(seconds: 1),(){
        menu.riveIcon.status!.change(false);
      });
    }
  }

  void _onMenuIconInit(Artboard artboard){
    final controller = StateMachineController.fromArtboard(artboard, menu.riveIcon.stateMachine);
    artboard.addController(controller!);
    menu.riveIcon.status = controller.findInput<bool>("active") as SMIBool;

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      // This is the menu button background that animated as we click on it
      children: [
        AnimatedContainer(
          height: 56,
          curve: const Cubic(0.2, 0.8, 0.2, 1),
          width: selectedMenu == menu.title ? 288 -16 : 0,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10)
          ), duration: const Duration(milliseconds: 300),
        ),
        CupertinoButton(
          padding: const EdgeInsets.all(12),
          onPressed: onMenuPressed,
          pressedOpacity: 1,
          child: Row(
            children: [
              SizedBox(
                width: 32,
                height: 32,
                child: Opacity(
                  opacity: 0.6,
                  child: RiveAnimation.asset('assets/rive/icons.riv',
                  stateMachines: [menu.riveIcon.stateMachine],
                  artboard: menu.riveIcon.artboard,
                  onInit: _onMenuIconInit,),
                )
              ),
              const SizedBox(width: 14,),
              Text(menu.title,style: const TextStyle(color: Colors.white,fontFamily: "Inter",fontWeight: FontWeight.w600),)
            ],
          ),
        ),
      ]
    );
  }
}
