import 'package:flutter/material.dart';
import 'package:pitchbox/styles/appStyles.dart';

import '../../../../../../styles/appColors.dart';

class InvestorCheckout extends StatefulWidget {
  const InvestorCheckout({Key? key}) : super(key: key);

  @override
  _InvestorCheckoutState createState() => _InvestorCheckoutState();
}

class _InvestorCheckoutState extends State<InvestorCheckout> {
  List<bool> _stepCompleted = [true, true, true, true];
  int _activeStepIndex = 0;

//---------------Personal Information----------------------
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _professionalBackground = <TextEditingController>[
    TextEditingController()
  ];
  final _investmentExperience = <TextEditingController>[TextEditingController()];
  final _investmentInterests = TextEditingController();
  final _accreditedInvestorStatus = TextEditingController();
  final _linkedInProfile = TextEditingController();

  //----------------Investment Preferences----------------------
  final _minimumInvestment = TextEditingController();
  final _maximumInvestment = TextEditingController();
  final List<String> _selectedInvestmentStage = ['seed', 'early-stage', 'growth-stage'];
  String? _selectedInvestmentExperience;
  final _investmentStage = TextEditingController();
  final _industryFocus = TextEditingController();
  final _geographicLocation = TextEditingController();
  final _investmentGoals = TextEditingController();
  final _investmentCriteria = TextEditingController();

  //----------------------------------Investment Portfolio-------------------
  final _investmentStrategy = <TextEditingController>[TextEditingController()];
  final _investmentSuccessStories = <TextEditingController>[
    TextEditingController()
  ];

  void _addprofessionalBackgroundField() {
    setState(() {
      _professionalBackground.add(TextEditingController());
    });
  }void _addInvestmentExperienceField() {
    setState(() {
      _investmentExperience.add(TextEditingController());
    });
  }
  void _addInvestmentStrategyField() {
    setState(() {
      _investmentStrategy.add(TextEditingController());
    });
  }
  void _addInvestmentSuccessStoriesField() {
    setState(() {
      _investmentSuccessStories.add(TextEditingController());
    });
  }

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('Personal Information'),
          content: Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _investmentInterests,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Investment Interests',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Professional Background",
                      style: ralewayStyle.copyWith(
                        fontSize: 18.0,
                        color: AppColors.blueDarkColor,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.info_outline),
                      tooltip: "Professional Background",
                      onPressed: () {},
                    ),
                  ],
                ),
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _professionalBackground.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _professionalBackground[index],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                maxLines: 3,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.remove_circle),
                              color: AppColors.redColor,
                              onPressed: () {
                                setState(() {
                                  _professionalBackground.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  },
                ),
                TextButton.icon(
                  icon: Icon(Icons.add),
                  label: Text('Add'),
                  onPressed: () {
                    _addprofessionalBackgroundField();
                  },
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Investment Experience",
                      style: ralewayStyle.copyWith(
                        fontSize: 18.0,
                        color: AppColors.blueDarkColor,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.info_outline),
                      tooltip: "Investment Experience",
                      onPressed: () {},
                    ),
                  ],
                ),
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _investmentExperience.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _investmentExperience[index],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                maxLines: 3,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.remove_circle),
                              color: AppColors.redColor,
                              onPressed: () {
                                setState(() {
                                  _investmentExperience.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  },
                ),
                TextButton.icon(
                  icon: Icon(Icons.add),
                  label: Text('Add'),
                  onPressed: () {
                    _addInvestmentExperienceField();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _accreditedInvestorStatus,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Accredited Investor Status',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _linkedInProfile,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'linkedIn Profile',
                  ),
                ),
              ],
            ),
          ),
        ),

        //-------------------------Investment Preferences----------------------------------------

        Step(
            state:
                _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: const Text('Investment Preferences'),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: _minimumInvestment,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Minimum Investment',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: _maximumInvestment,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'maximum Investment',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedInvestmentExperience,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Investment Stage',
                    ),
                    items: _selectedInvestmentStage.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedInvestmentExperience = newValue;
                      });
                    },
                  ),
                   SizedBox(height: 20,),
                  TextField(
                    controller: _industryFocus,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Industry Focus',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _geographicLocation,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Geographic Location',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _investmentGoals,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Investment Goals',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _investmentCriteria,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Investment Criteria',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),
        //----------------------------------Investment Portfolio-------------------
        Step(
            state:
                _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: const Text('Investment Portfolio'),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Investment Strategy",
                        style: ralewayStyle.copyWith(
                          fontSize: 18.0,
                          color: AppColors.blueDarkColor,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.info_outline),
                        tooltip: "Investment Strategy",
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Divider(
                    height: 15,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _investmentStrategy.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _investmentStrategy[index],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  maxLines: 3,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.remove_circle),
                                color: AppColors.redColor,
                                onPressed: () {
                                  setState(() {
                                    _investmentStrategy.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
                  TextButton.icon(
                    icon: Icon(Icons.add),
                    label: Text('Add'),
                    onPressed: () {
                      _addInvestmentStrategyField();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Investment Success Stories",
                        style: ralewayStyle.copyWith(
                          fontSize: 18.0,
                          color: AppColors.blueDarkColor,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.info_outline),
                        tooltip: "Investment Success Stories",
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Divider(
                    height: 15,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _investmentSuccessStories.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _investmentSuccessStories[index],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  maxLines: 3,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.remove_circle),
                                color: AppColors.redColor,
                                onPressed: () {
                                  setState(() {
                                    _investmentSuccessStories.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
                  TextButton.icon(
                    icon: Icon(Icons.add),
                    label: Text('Add'),
                    onPressed: () {
                      _addInvestmentSuccessStoriesField();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),

        Step(
            state: StepState.complete,
            isActive: _activeStepIndex >= 3,
            title: const Text('Confirm'),
            content: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text('Name: ${_name.text}'),
                Text('Email: ${_email.text}'),
                Text('Professional Background: ${_professionalBackground.map((e) => e.text).toList()}'),
                Text('Investment Experience: ${_investmentExperience.map((e) => e.text).toList()}'),
                Text('investment Interests : ${_investmentInterests.text}'),
                Text(
                    'accredited InvestorStatus : ${_accreditedInvestorStatus.text}'),
                Text('linkedIn Profile : ${_linkedInProfile.text}'),

                //----------------Investment Preferences----------------------
                Text('minimum Investment : ${_minimumInvestment.text}'),
                Text('maximum Investment : ${_maximumInvestment.text}'),
                Text('investment Stage : ${_selectedInvestmentExperience}'),
                Text('industry Focus : ${_industryFocus.text}'),
                Text('geographic Location : ${_geographicLocation.text}'),
                Text('investment Goals : ${_investmentGoals.text}'),
                Text('investment Criteria : ${_investmentCriteria.text}'),

                //----------------------------------Investment Portfolio-------------------
                Text('Investment Strategy: ${_investmentStrategy.map((e) => e.text).toList()}'),
                Text('Investment Success Stories: ${_investmentSuccessStories.map((e) => e.text).toList()}'),
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
            print('Name: ${_name.text}');
            print('Email: ${_email.text}');
            print('Professional Background: ${_professionalBackground.map((e) => e.text).toList()}');
            print('Investment Experience: ${_investmentExperience.map((e) => e.text).toList()}');
            print('Investment Interests : ${_investmentInterests.text}');
            print('Accredited Investor Status : ${_accreditedInvestorStatus.text}');
            print('LinkedIn Profile : ${_linkedInProfile.text}');

//----------------Investment Preferences----------------------
            print('Minimum Investment : ${_minimumInvestment.text}');
            print('Maximum Investment : ${_maximumInvestment.text}');
            print('Investment Stage : ${_investmentStage.text}');
            print('Industry Focus : ${_industryFocus.text}');
            print('Geographic Location : ${_geographicLocation.text}');
            print('Investment Goals : ${_investmentGoals.text}');
            print('Investment Criteria : ${_investmentCriteria.text}');

//----------------------------------Investment Portfolio-------------------
            print('Investment Strategy: ${_investmentStrategy.map((e) => e.text).toList()}');
            print('Investment Success Stories: ${_investmentSuccessStories.map((e) => e.text).toList()}');
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
        controlsBuilder:
            (BuildContext context, ControlsDetails controlsDetails) {
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
              const SizedBox(width: 8.0),
              Expanded(
                child: ElevatedButton(
                  onPressed:
                  isCompleted ? controlsDetails.onStepContinue : null,
                  child:
                  isLastStep ? const Text('Submit') : const Text('Next'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

}
