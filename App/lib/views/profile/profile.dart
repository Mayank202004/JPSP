import 'package:flutter/material.dart';

import 'MultiStepForm.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentStep=0;
  @override
  Widget build(BuildContext context) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: isDarkMode ? 
      Stepper(
        //type: StepperType.horizontal,

        type: StepperType.vertical,
        steps: getStep(),
        currentStep: currentStep,
        onStepContinue: () =>{
          setState(() {
            currentStep+=1;
          })
        },
        onStepCancel: () =>{
          setState(() {
            currentStep-=1;
          })
        },
        connectorColor: const WidgetStatePropertyAll(Colors.blueAccent),

      ) : 
      Stepper(
        physics: const BouncingScrollPhysics(),

        //type: StepperType.horizontal,
        steps: getStep(),
        currentStep: currentStep,
        onStepContinue: () =>{
          setState(() {
            currentStep+=1;
          })
        },
        onStepCancel: () =>{
          setState(() {
            currentStep-=1;
          })
        },
      )
    );
  }
  List<Step> getStep() =>[
    Step(title: const Text("Personal Details"), content: MultiStepForm.personalInfo()),
    Step(title: const Text("Educational Details"), content: MultiStepForm.educationalInfo()),
    Step(title: const Text("Other Details"), content: MultiStepForm.otherInfo()),
    Step(title: const Text("Bank Details"), content: MultiStepForm.bankInfo()),
    Step(title: const Text("Parents Details"), content: MultiStepForm.parentsInfo()),
    Step(title: const Text("Hostel Details Details"), content: MultiStepForm.hostelInfo()),

  ];
}
