import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:pitchbox/backend/controller/investorController.dart';
import 'package:pitchbox/backend/model/businessTeam.dart';
import 'package:pitchbox/backend/model/fund.dart';
import 'package:pitchbox/backend/model/investor.dart';
import 'package:pitchbox/styles/appStyles.dart';

import '../../../../../../backend/service/investorService.dart';
import '../../../../../../styles/appColors.dart';

class BusinessListCheckoutForm extends StatefulWidget {
  const BusinessListCheckoutForm({Key? key}) : super(key: key);

  @override
  _BusinessListCheckoutFormState createState() =>
      _BusinessListCheckoutFormState();
}

class _BusinessListCheckoutFormState extends State<BusinessListCheckoutForm> {
  final _formKey = GlobalKey<FormState>();
  List<bool> _stepCompleted = [true, true, true, true,true];
  int _activeStepIndex = 0;
  bool isSubmitting = false;

  List<BusinessTeam> _teamMembersList = [];

  //====================================================================================//
  //----------------------Personal Information------------------------------------------//
  //====================================================================================//
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _industryController = IndustryController();
  final _professionalExperienceController = <TextEditingController>[
    TextEditingController()
  ];
  final _entrepreneurshipExperienceController = <TextEditingController>[
    TextEditingController()
  ];
  final _educationController = <TextEditingController>[TextEditingController()];
  final _industryCertificationsController = <TextEditingController>[
    TextEditingController()
  ];
  final _awardsAchievementsController = <TextEditingController>[
    TextEditingController()
  ];
  final _trackRecordController = <TextEditingController>[
    TextEditingController()
  ];
  final _emailController = TextEditingController();
  final _facebookController = TextEditingController();
  final _twitterController = TextEditingController();
  final _instagramController = TextEditingController();
  final _linkedinController = TextEditingController();
  final _websiteController = TextEditingController();

  //====================================================================================//
  //----------------------Business Information------------------------------------------//
  //====================================================================================//
  final _businessName = TextEditingController();
  final _businessIndustry = TextEditingController();
  final _businessLocation = TextEditingController();
  final _companyDescription = TextEditingController();
  final _website = TextEditingController();
  final _executiveSummary = TextEditingController();
  final _businessModel = TextEditingController();
  final _valueProposition = TextEditingController();
  final _productOrServiceOffering = TextEditingController();
  final _fundingNeeds = TextEditingController();

  //====================================================================================//
  //----------------------Business Team Information-------------------------------------//
  //====================================================================================//
  final _teamMember = TextEditingController();
  final _teamMemberRole = TextEditingController();
  final _teamMemberExperience = TextEditingController();
  final _teamMemberAchievements = TextEditingController();
  final _teamMemberLinkedInProfiles = TextEditingController();
  final _teamMemberResponsibilities = TextEditingController();
  final _teamCulture = TextEditingController();

  //====================================================================================//
  //----------------------Funding Requirments------------------------------------------//
  //====================================================================================//
  final _fundAmount = TextEditingController();
  final _fundPurpose = TextEditingController();
  final _timeline = TextEditingController();
  final _fundingSources = TextEditingController();
  final _investmentTerms = TextEditingController();
  final _investorBenefits = TextEditingController();
  final _riskFactors = TextEditingController();

  //====================================================================================//
  //----------------------Funding Requirments------------------------------------------//
  //====================================================================================//
  final _minimumInvestmentAmount = TextEditingController();
  final _maximumInvestmentAmount = TextEditingController();
  final List<String> _selectedInvestmentStage = ['seed', 'early-stage', 'growth-stage'];
  String? _selectedInvestmentExperience;
  List<String> _industryFocus = [];
  final _geographicLocation = TextEditingController();



  @override
  void initState() {
    super.initState();
  }

  void _addProfessionalExperienceField() {
    setState(() {
      _professionalExperienceController.add(TextEditingController());
    });
  }

  void _addEntrepreneurshipExperienceField() {
    setState(() {
      _entrepreneurshipExperienceController.add(TextEditingController());
    });
  }

  void _addEducationExperienceField() {
    setState(() {
      _educationController.add(TextEditingController());
    });
  }

  void _addindustryCertificationsField() {
    setState(() {
      _industryCertificationsController.add(TextEditingController());
    });
  }

  void _addawardsAchievementsField() {
    setState(() {
      _awardsAchievementsController.add(TextEditingController());
    });
  }

  void _addtrackRecordField() {
    setState(() {
      _trackRecordController.add(TextEditingController());
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
                TextFormField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    suffixIcon: Tooltip(
                      message: 'Full Name',
                      child: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {},
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Business Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Mobile',
                    suffixIcon: Tooltip(
                      message: 'Mobile',
                      child: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {},
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Mobile number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    labelText: 'City',
                    suffixIcon: Tooltip(
                      message: 'City',
                      child: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {},
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter City';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _countryController,
                  decoration: InputDecoration(
                    labelText: 'Country',
                    suffixIcon: Tooltip(
                      message: 'Country',
                      child: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {},
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Country';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _professionalExperienceController.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller:
                                    _professionalExperienceController[index],
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
                                  _professionalExperienceController
                                      .removeAt(index);
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
                    _addProfessionalExperienceField();
                  },
                ),
                SizedBox(height: 20),

                //--------------------------------------------------------------------------------

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Entrepreneurship Experience",
                      style: ralewayStyle.copyWith(
                        fontSize: 18.0,
                        color: AppColors.blueDarkColor,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.info_outline),
                      tooltip: "Entrepreneurship Experience",
                      onPressed: () {},
                    ),
                  ],
                ),
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _entrepreneurshipExperienceController.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller:
                                    _entrepreneurshipExperienceController[
                                        index],
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
                                  _entrepreneurshipExperienceController
                                      .removeAt(index);
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
                    _addEntrepreneurshipExperienceField();
                  },
                ),

                //--------------------------------------------------------------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Education",
                      style: ralewayStyle.copyWith(
                        fontSize: 18.0,
                        color: AppColors.blueDarkColor,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.info_outline),
                      tooltip: "Education",
                      onPressed: () {},
                    ),
                  ],
                ),
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _educationController.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _educationController[index],
                                decoration: InputDecoration(
                                  labelText: 'Education',
                                  suffixIcon: Tooltip(
                                    message: 'Education',
                                    child: IconButton(
                                      icon: Icon(Icons.info),
                                      onPressed: () {},
                                    ),
                                  ),
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
                                  _educationController.removeAt(index);
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
                    _addEducationExperienceField();
                  },
                ),

                //--------------------------------------------------------------------------------

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Industry Certifications",
                      style: ralewayStyle.copyWith(
                        fontSize: 18.0,
                        color: AppColors.blueDarkColor,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.info_outline),
                      tooltip: "Industry Certifications",
                      onPressed: () {},
                    ),
                  ],
                ),
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _industryCertificationsController.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller:
                                    _industryCertificationsController[index],
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
                                  _industryCertificationsController
                                      .removeAt(index);
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
                    _addindustryCertificationsField();
                  },
                ),

                //--------------------------------------------------------------------------------

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Awards Achievements",
                      style: ralewayStyle.copyWith(
                        fontSize: 18.0,
                        color: AppColors.blueDarkColor,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.info_outline),
                      tooltip: "Awards Achievements",
                      onPressed: () {},
                    ),
                  ],
                ),
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _awardsAchievementsController.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller:
                                    _awardsAchievementsController[index],
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
                                  _awardsAchievementsController.removeAt(index);
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
                    _addawardsAchievementsField();
                  },
                ),

                //--------------------------------------------------------------------------------

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Track Record",
                      style: ralewayStyle.copyWith(
                        fontSize: 18.0,
                        color: AppColors.blueDarkColor,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.info_outline),
                      tooltip: "Track Record",
                      onPressed: () {},
                    ),
                  ],
                ),
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _trackRecordController.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _trackRecordController[index],
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
                                  _trackRecordController.removeAt(index);
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
                    _addtrackRecordField();
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    suffixIcon: Tooltip(
                      message: 'enter Email',
                      child: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {},
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _linkedinController,
                  decoration: InputDecoration(
                    labelText: 'Linkedin profile',
                    suffixIcon: Tooltip(
                      message: 'enter Linkedin profile link',
                      child: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {},
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _facebookController,
                  decoration: InputDecoration(
                    labelText: 'Facebook profile',
                    suffixIcon: Tooltip(
                      message: 'enter Facebook profile link',
                      child: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {},
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _twitterController,
                  decoration: InputDecoration(
                    labelText: 'Twitter profile',
                    suffixIcon: Tooltip(
                      message: 'enter Twitter profile link',
                      child: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {},
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _instagramController,
                  decoration: InputDecoration(
                    labelText: 'Instagram profile',
                    suffixIcon: Tooltip(
                      message: 'enter Instagram profile link',
                      child: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {},
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _websiteController,
                  decoration: InputDecoration(
                    labelText: 'Website',
                    suffixIcon: Tooltip(
                      message: 'enter Website link',
                      child: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {},
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),

        //====================================================================================//
        //----------------------Business Information------------------------------------------//
        //====================================================================================//

        Step(
            state:
                _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: const Text('Business Information'),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _businessName,
                    decoration: InputDecoration(
                      labelText: 'Business Name',
                      suffixIcon: Tooltip(
                        message: 'Business Name',
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {},
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Business Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _businessIndustry,
                    decoration: InputDecoration(
                      labelText: 'Business Industry',
                      suffixIcon: Tooltip(
                        message: 'Business Industry',
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {},
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Business Industry';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _businessLocation,
                    decoration: InputDecoration(
                      labelText: 'Business Location',
                      suffixIcon: Tooltip(
                        message: 'Business Location',
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {},
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Business Location';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _executiveSummary,
                    decoration: InputDecoration(
                      labelText: 'Executive Summary',
                      suffixIcon: Tooltip(
                        message: 'Executive Summary',
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {},
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    maxLines: 3,
                    // Set the maximum number of lines for the input
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Executive Summary';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _companyDescription,
                    decoration: InputDecoration(
                      labelText: 'Company Description',
                      suffixIcon: Tooltip(
                        message: 'Company Description',
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {},
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    maxLines: 3,
                    // Set the maximum number of lines for the input
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Company Description';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _businessModel,
                    decoration: InputDecoration(
                      labelText: 'Business Model',
                      suffixIcon: Tooltip(
                        message: 'Business Model',
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {},
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    maxLines: 3,
                    // Set the maximum number of lines for the input
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Business Model';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _valueProposition,
                    decoration: InputDecoration(
                      labelText: ' Value Proposition',
                      suffixIcon: Tooltip(
                        message: 'Value Proposition',
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {},
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    maxLines: 3,
                    // Set the maximum number of lines for the input
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Value Proposition';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _productOrServiceOffering,
                    decoration: InputDecoration(
                      labelText: ' Product Or Service Offering',
                      suffixIcon: Tooltip(
                        message: 'Product Or Service Offering',
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {},
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    maxLines: 3,
                    // Set the maximum number of lines for the input
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Product Or Service Offering';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _fundingNeeds,
                    decoration: InputDecoration(
                      labelText: 'Funding Needs',
                      suffixIcon: Tooltip(
                        message: 'Funding Needs',
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {},
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    maxLines: 3,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Funding Needs';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _website,
                    decoration: InputDecoration(
                      labelText: 'Website',
                      suffixIcon: Tooltip(
                        message: 'Website',
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {},
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Website';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            )),
        //====================================================================================//
        //----------------------Business Team Information-------------------------------------//
        //====================================================================================//
        Step(
          state: _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text('Business Team Information'),
          content: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Team members",
                        style: ralewayStyle.copyWith(
                          fontSize: 18.0,
                          color: AppColors.blueDarkColor,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.info_outline),
                        tooltip: "Team members",
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Divider(
                    height: 15,
                    thickness: 2,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _teamMembersList.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == _teamMembersList.length) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: ElevatedButton(
                            child: Text('Add Team Member'),
                            onPressed: () {
                              setState(() {
                                _teamMembersList.add(BusinessTeam(
                                  teamMemberId: '',
                                  teamMember: '',
                                  teamMemberRole: '',
                                  teamMemberExperience: '',
                                  teamMemberAchievements: '',
                                  teamMemberLinkedIn_Profiles: '',
                                  teamMemberResponsibilities: '',
                                  teamCulture: '',
                                ));
                              });
                            },
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Team Member ${index + 1}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.remove_circle),
                                        color: AppColors.redColor,
                                        onPressed: () {
                                          setState(() {
                                            _teamMembersList.removeAt(index);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  TextFormField(
                                    initialValue:
                                        _teamMembersList[index].teamMember,
                                    decoration:InputDecoration(
                                        labelText: 'Name',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),),
                                    onChanged: (value) {
                                      setState(() {
                                        _teamMembersList[index].teamMember =
                                            value;
                                      });
                                    },

                                  ),
                                  SizedBox(height: 08,),
                                  TextFormField(
                                    initialValue:
                                        _teamMembersList[index].teamMemberRole,
                                    decoration:
                                        InputDecoration(labelText: 'Role',
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),),
                                    onChanged: (value) {
                                      setState(() {
                                        _teamMembersList[index].teamMemberRole =
                                            value;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 08,),
                                  TextFormField(
                                    initialValue: _teamMembersList[index]
                                        .teamMemberExperience,
                                    decoration: InputDecoration(
                                        labelText: 'Experience',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),),
                                    onChanged: (value) {
                                      setState(() {
                                        _teamMembersList[index]
                                            .teamMemberExperience = value;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 08,),
                                  TextFormField(
                                    initialValue: _teamMembersList[index]
                                        .teamMemberAchievements,
                                    decoration: InputDecoration(
                                        labelText: 'Achievements',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),),
                                    onChanged: (value) {
                                      setState(() {
                                        _teamMembersList[index]
                                            .teamMemberAchievements = value;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 08,),
                                  TextFormField(
                                    initialValue: _teamMembersList[index]
                                        .teamMemberLinkedIn_Profiles,
                                    decoration: InputDecoration(
                                        labelText: 'LinkedIn Profiles',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),),
                                    onChanged: (value) {
                                      setState(() {
                                        _teamMembersList[index]
                                                .teamMemberLinkedIn_Profiles =
                                            value;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 08,),
                                  TextFormField(
                                    initialValue: _teamMembersList[index]
                                        .teamMemberResponsibilities,
                                    decoration: InputDecoration(
                                        labelText: 'Responsibilities',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),),
                                    onChanged: (value) {
                                      setState(() {
                                        _teamMembersList[index]
                                            .teamMemberResponsibilities = value;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 08,),
                                  TextFormField(
                                    initialValue:
                                        _teamMembersList[index].teamCulture,
                                    decoration: InputDecoration(
                                      labelText: 'Team Culture',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _teamMembersList[index].teamCulture =
                                            value;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 20,),
                                ],
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),

        //====================================================================================//
        //----------------------Funding Requirments------------------------------------------//
        //====================================================================================//

        Step(
            state:
                _activeStepIndex <= 3 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 3,
            title: const Text('Funding Requirments'),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _fundAmount,
                    decoration: InputDecoration(
                      labelText: 'Fund Amount',
                      suffixIcon: Tooltip(
                        message: 'Fund Amount',
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {},
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Fund Amount';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _fundPurpose,
                    decoration: InputDecoration(
                      labelText: 'Fund Purpose',
                      suffixIcon: Tooltip(
                        message: 'Fund Purpose',
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {},
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Fund Purpose';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _timeline,
                    decoration: InputDecoration(
                      labelText: 'Timeline',
                      suffixIcon: Tooltip(
                        message: 'Timeline',
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {},
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    maxLines: 3,
                    // Set the maximum number of lines for the input
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Timeline';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _fundingSources,
                    decoration: InputDecoration(
                      labelText: 'Funding Sources',
                      suffixIcon: Tooltip(
                        message: 'Funding Sources',
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {},
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    maxLines: 3,
                    // Set the maximum number of lines for the input
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Funding Sources';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _investmentTerms,
                    decoration: InputDecoration(
                      labelText: 'Investment Terms',
                      suffixIcon: Tooltip(
                        message: 'Investment Terms',
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {},
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    maxLines: 3,
                    // Set the maximum number of lines for the input
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Investment Terms';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _investorBenefits,
                    decoration: InputDecoration(
                      labelText: ' Investor Benefits',
                      suffixIcon: Tooltip(
                        message: 'Investor Benefits',
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {},
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    maxLines: 3,
                    // Set the maximum number of lines for the input
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Investor Benefits';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _riskFactors,
                    decoration: InputDecoration(
                      labelText: 'Risk Factors',
                      suffixIcon: Tooltip(
                        message: 'Risk Factors',
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {},
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    maxLines: 3,
                    // Set the maximum number of lines for the input
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Risk Factors';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),


        //====================================================================================//
        //----------------------Investor Criteria------------------------------------------//
        //====================================================================================//
    Step(
        state: StepState.complete,
        isActive: _activeStepIndex >= 4,
        title: const Text('Investor Criteria'),
        content: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _minimumInvestmentAmount,
                decoration: InputDecoration(
                  labelText: 'Minimum Investment Amount',
                  suffixIcon: Tooltip(
                    message: 'Minimum Investment Amount',
                    child: IconButton(
                      icon: Icon(Icons.info),
                      onPressed: () {},
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Minimum Investment Amount';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _maximumInvestmentAmount,
                decoration: InputDecoration(
                  labelText: 'Maximum Investment Amount',
                  suffixIcon: Tooltip(
                    message: 'Maximum Investment Amount',
                    child: IconButton(
                      icon: Icon(Icons.info),
                      onPressed: () {},
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Maximum Investment Amount';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextField(
                controller: _geographicLocation,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Geographic Location',
                ),
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 20),
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
                          initialValue: _industryFocus,
                          buttonText : const Text('Select Industries'),
                          onConfirm: (value) {
                            setState(() {
                              _industryFocus = value;
                            });
                          },
                        ),
                      ],
                    ),
                  );
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
        title: const Text('New Business Idea'),
        backgroundColor: AppColors.mainBlueColor,
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
                              //_addValue();
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
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
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
