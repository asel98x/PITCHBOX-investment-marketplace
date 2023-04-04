import 'package:flutter/material.dart';

class BusinessListPage extends StatefulWidget {
  const BusinessListPage({Key? key}) : super(key: key);

  @override
  _BusinessListPageState createState() => _BusinessListPageState();
}

class _BusinessListPageState extends State<BusinessListPage> {
  // Define a list to keep track of the completion status of each step
  List<bool> _stepCompleted=[true,true,true];
  int _activeStepIndex = 0;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();

  List<Step> stepList() => [
    Step(
      state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
      isActive: _activeStepIndex >= 0,
      title: const Text('Account'),
      content: Container(
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Full Name',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: pass,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ],
        ),
      ),
    ),
    Step(
        state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 1,
        title: const Text('Address'),
        content: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: address,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full House Address',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: pincode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Pin Code',
                ),
              ),
            ],
          ),
        )),
    Step(
        state: StepState.complete,
        isActive: _activeStepIndex >= 2,
        title: const Text('Confirm'),
        content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Name: ${name.text}'),
                Text('Email: ${email.text}'),
                const Text('Password: *****'),
                Text('Address : ${address.text}'),
                Text('PinCode : ${pincode.text}'),
              ],
            )))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Flutter Stepper'),
    ),
    body: Stepper(
    type: StepperType.vertical,
    currentStep: _activeStepIndex,
    steps: stepList(),
    onStepContinue: () {
    if (_activeStepIndex < (stepList().length - 1)) {
    setState(() {
    // Mark the current step as completed
    _stepCompleted[_activeStepIndex] = true;
    // Move to the next step
    _activeStepIndex += 1;
    });
    } else {
    print('Submitted');
    }
    },
    onStepCancel: () {
    if (_activeStepIndex == 0) {
      return;
    }
    setState(() {
      _activeStepIndex -= 1;
    });
    },
      onStepTapped: (int index) {
        if (_stepCompleted[index]) {
          setState(() {
            _activeStepIndex = index;
          });
        }
      },
      controlsBuilder: (BuildContext context, ControlsDetails controlsDetails) {
        final isLastStep = _activeStepIndex == stepList().length - 1;
        final isCompleted = _stepCompleted[_activeStepIndex];
        return Row(
          children: [
            if (_activeStepIndex > 0)
              Expanded(
                child: ElevatedButton(
                  onPressed: controlsDetails.onStepCancel,
                  child: const Text('Back'),
                ),
              ),
            Expanded(
              child: ElevatedButton(
                onPressed: isCompleted ? controlsDetails.onStepContinue : null,
                child: isLastStep ? const Text('Submit') : const Text('Next'),
              ),
            ),
          ],
        );
      },
    ),
    );
  }
}