import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class Transformer extends StatefulWidget {
  const Transformer({super.key});

  @override
  State<Transformer> createState() => _GetStartedState();
}

class _GetStartedState extends State<Transformer> {
  StateMachineController? stateMachineController;
  Artboard? mainArtboard;
  SMITrigger? trigger;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
  }

  void _loadRiveFile() async {
    final riveByteData = await rootBundle.load("assets/rive/rivebot.riv");
    await RiveFile.initialize();
    final riveFile = RiveFile.import(riveByteData);
    final artboard = riveFile.mainArtboard;
    stateMachineController = StateMachineController.fromArtboard(artboard, "tap");
    if (stateMachineController != null) {
      artboard.addController(stateMachineController!);
      setState(() {
        mainArtboard = artboard;
      });
      trigger = stateMachineController!.findSMI("Trigger 1");
    }
  }

  // Function to trigger the animation
  void _triggerAnimation() {
    if (trigger != null) {
      trigger!.fire();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTapDown: (_) {
          _triggerAnimation();
        },
        child: Center(
          child: mainArtboard != null
              ? Rive(
            artboard: mainArtboard!,
            fit: BoxFit.cover,

          )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
