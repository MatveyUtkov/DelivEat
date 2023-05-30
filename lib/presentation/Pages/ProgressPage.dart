import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  StepperDemo() : super();

  @override
  StepperDemoState createState() => StepperDemoState();
}

class StepperDemoState extends State<StepperDemo> {
  //
  int current_step = 0;
  List<Step> steps = [
    const Step(
      title: Text('Order accepted'),
      content: Text(''),
      isActive: true,
    ),
    const Step(
      title: Text('The order is being prepared'),
      content: Text(''),
      isActive: true,
    ),
    const Step(
      title: Text('The order is being delivered'),
      content: Text(''),
      state: StepState.complete,
      isActive: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        backgroundColor:Color(0xFF2C2C33),
      ),
      // Body
      body: Container(
        child: Stepper(
          currentStep: this.current_step,
          steps: steps,
          type: StepperType.vertical,
          onStepTapped: (step) {
            setState(() {
              current_step = step;
            });
          },
          onStepContinue: () {
            setState(() {
              if (current_step < steps.length - 1) {
                current_step = current_step + 1;
              } else {
                current_step = 0;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (current_step > 0) {
                current_step = current_step - 1;
              } else {
                current_step = 0;
              }
            });
          },
        ),
      ),
    );
  }
}