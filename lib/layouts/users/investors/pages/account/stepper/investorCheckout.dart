import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:pitchbox/backend/controller/investorController.dart';
import 'package:pitchbox/backend/model/fund.dart';
import 'package:pitchbox/backend/model/investor.dart';
import 'package:pitchbox/styles/appStyles.dart';

import '../../../../../../backend/service/investorService.dart';
import '../../../../../../styles/appColors.dart';

class InvestorCheckout extends StatefulWidget {
  const InvestorCheckout({Key? key}) : super(key: key);

  @override
  _InvestorCheckoutState createState() => _InvestorCheckoutState();
}

class _InvestorCheckoutState extends State<InvestorCheckout> {
  final _formKey = GlobalKey<FormState>();
  final _industryController = IndustryController();
  InvestorService _investorService = InvestorService();
  List<String> _selectedIndustries = [];
  List<bool> _stepCompleted = [true, true, true];
  int _activeStepIndex = 0;
  bool isSubmitting = false;

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
  final _industryFocus = <TextEditingController>[TextEditingController()];
  final _geographicLocation = TextEditingController();
  final _investmentGoals = TextEditingController();
  final _investmentCriteria = TextEditingController();

  //----------------------------------Investment Portfolio-------------------
  final _investmentStrategy = <TextEditingController>[TextEditingController()];
  final _investmentSuccessStories = <TextEditingController>[
    TextEditingController()
  ];

  @override
  void initState() {
    super.initState();
  }


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
  void _printSelectedIndustries() {
    print(_selectedIndustries);
  }


  void _addValue() async {
      late String investorId =  '';
      late String fullName= _name.text;
      late String email =  _email.text;
      late String investmentInterest = _investmentInterests.text;
      late List<String> professionalBackground = _professionalBackground.map((e) => e.text).toList();
      late List<String> investmentExperience = _investmentExperience.map((e) => e.text).toList();
      late String accreditedInvestorStatus = _accreditedInvestorStatus.text;
      late String linkedinProfile = _linkedInProfile.text;

      late List<String> investmentStrategy = _investmentStrategy.map((e) => e.text).toList();
      late List<String> investmentSuccessStories = _investmentSuccessStories.map((e) => e.text).toList();

      late String minimumInvestment = _minimumInvestment.text;
      late String maximumInvestment = _maximumInvestment.text;
      late String investmentStage = _investmentStage.text;
      late String geographicLocation = _geographicLocation.text;
      late String investmentGoals = _investmentGoals.text;
      late String investmentCriteria = _investmentCriteria.text;
      late List<String> industryFocus = _industryFocus.map((e) => e.text).toList();

//      _formKey.currentState!.save();
      try {
        await _investorService.addInvestorProfile(
          Investor(
            investorId: '',
            fullName: fullName,
            email: email,
            investmentInterest: investmentInterest,
            professionalBackground: professionalBackground,
            investmentExperience: investmentExperience,
            accreditedInvestorStatus: accreditedInvestorStatus,
            linkedinProfile: linkedinProfile,
            investmentstrategy: investmentStrategy,
            investmentSuccessStory: investmentSuccessStories,
          ),
          Fund(
            fundId: '',
            fundAmount: '',
            fundPurpose: '',
            timeline: '',
            fundingSources:'',
            investmentTerms: '',
            investorBenefits: '',
            riskFactors: '',
            minimumInvestmentAmount: minimumInvestment,
            maximumInvestmentAmount: maximumInvestment,
            investmentStage: investmentStage,
            industryFocus: industryFocus,
            location: geographicLocation,
            investmentGoal: investmentGoals,
            investmentCriteria: investmentCriteria,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Investor profile added successfully!'),
          ),
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to add investor profile.'),
          ),
        );
        print(e.toString());
      }

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
                  FutureBuilder<List<String>>(
                    future: _industryController.getIndustryNames(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      }
                      final industryNames = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text('Select your industries of interest'),
                            const SizedBox(height: 8),
                            MultiSelectDialogField<String>(
                              title: const Text('Industries'),
                              items: industryNames
                                  .map((industry) => MultiSelectItem(industry, industry))
                                  .toList(),
                              initialValue: _selectedIndustries,
                              buttonText : const Text('Select Industries'),
                              onConfirm: (value) {
                                setState(() {
                                  _selectedIndustries = value;
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            )),
        //----------------------------------Investment Portfolio-------------------
        Step(
            state: StepState.complete,
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
            print('Industry Focus : ${_industryFocus.map((e) => e.text).toList()}');
            print('Geographic Location : ${_geographicLocation.text}');
            print('Investment Goals : ${_investmentGoals.text}');
            print('Investment Criteria : ${_investmentCriteria.text}');
            Text('Selected Industries : ${_selectedIndustries}');

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
                  onPressed: isSubmitting
                      ? null
                      : isLastStep
                      ? () async {
                    setState(() {
                      isSubmitting = true;
                    });
                     _addValue();
                    setState(() {
                      isSubmitting = false;
                    });
                  }
                      : controlsDetails.onStepContinue,
                  child: isSubmitting
                      ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 2,
                    ),
                  )
                      : isLastStep
                      ? const Text('Submit')
                      : const Text('Next'),
                ),



              ),
            ],
          );
        },
      ),
    );
  }

}
