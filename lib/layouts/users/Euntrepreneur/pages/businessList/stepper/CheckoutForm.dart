import 'package:flutter/material.dart';
import 'package:pitchbox/backend/model/businessTeam.dart';
import 'package:pitchbox/backend/model/entrepreneur.dart';
import 'package:pitchbox/backend/model/fund.dart';
import 'package:pitchbox/layouts/users/Euntrepreneur/pages/businessList/stepper/BusinessTeamMember.dart';
import 'package:pitchbox/layouts/users/Euntrepreneur/pages/businessList/stepper/fundingRequirementsInfoForm.dart';
import 'package:pitchbox/styles/appColors.dart';
import '../../../../../../backend/model/business.dart';
import 'AddressForm.dart';
import 'PaymentForm.dart';
import 'PersonalInfoForm.dart';
import 'PersonalInfoStep.dart';
import 'businessInfoForm.dart';

class CheckoutForm extends StatefulWidget {
  @override
  _CheckoutFormState createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  int _currentStep = 0;

  Business _business = Business(businessId: '', businessName: '', companyDescription: '', website: '', executiveSummary: '', businessModel: '', valueProposition: '', productOrServiceOffering: '', businessIndustry: '', fundingNeeds: '', businessLocation: '');
  Entrepreneur _entrepreneur = Entrepreneur(uId: 0, name: '', email: '', mobile: '', street: '', city: '', state: '', zipCode: '', country: '', industry: '', linkedin: '', twitter: '', facebook: '', instagram: '', provider: '', imgUrl: '', professionalExperience: [], entrepreneurshipExperience: [], education: [], industryCertifications: [], awardsAchievements: [], trackRecord: [], website: '', pass: '');
  BusinessTeam _businessTeam = BusinessTeam(teamMemberId: '', teamMember: '', teamMemberRole: '', teamMemberExperience: '', teamMemberAchievements: '', teamMemberLinkedIn_Profiles: '', teamMemberResponsibilities: '', teamCulture: '');
  List<BusinessTeam> teamMembers = [];
  Fund _fund = Fund(fundId: '', fundAmount: '', fundPurpose: '', timeline: '', fundingSources: '', investmentTerms: '', investorBenefits: '', riskFactors: '', minimumInvestmentAmount: '', maximumInvestmentAmount: '', investmentStage: '', industryFocus: [],  investmentGoal: '', investmentCriteria: '', investorLocation: '');
  PersonalInfoStep _personalInfoStep =PersonalInfoStep(fullName: '', city: '', email: '', phone: '', professionalExperience: []);
  AddressStep _addressStep =AddressStep(street: '', city: '', state: '', zipCode: '');
  PaymentStep _paymentStep =PaymentStep(cardNumber: '', expirationDate: '', cvv: '');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _goToNextStep() {
    if (_currentStep < 4) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _goToPreviousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout Form'),
        backgroundColor: AppColors.mainBlueColor
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Stepper(
                  type: StepperType.vertical,
                  currentStep: _currentStep,
                  controlsBuilder:
                      (BuildContext context, ControlsDetails controlsDetails) =>
                      Container(),
                  steps: <Step>[
                    Step(
                      state: _currentStep <= 0 ? StepState.editing : StepState.complete,
                      isActive: _currentStep >= 0,
                      title: Text('Personal Information'),
                      content: PersonalInfoForm(
                        entrepreneur: _entrepreneur,
                        onNext: _goToNextStep,
                      ),
                    ),
                    Step(
                      state: _currentStep <= 1 ? StepState.editing: StepState.complete,
                      isActive: _currentStep >= 1,
                      title: Text('Business Information'),
                      content: businessInfoForm(
                        business: _business,
                        onNext: _goToNextStep,
                      ),
                    ),
                    Step(
                      state: _currentStep <= 2 ? StepState.editing : StepState.complete,
                      isActive: _currentStep >= 2,
                      title: Text('Business Team Members Information'),
                      content: BusinessTeamMemberInfoForm(
                          teamMembers: teamMembers,
                        onNext: _goToNextStep,
                      ),
                    ),
                    Step(
                      state: _currentStep <= 3 ? StepState.editing : StepState.complete,
                      isActive: _currentStep >= 3,
                      title: Text('Funding Requirements'),
                      content: fundingRequirementsInfoForm(
                       fund: _fund,
                        onNext: _goToNextStep,
                      ),
                    ),
                    Step(
                      state: StepState.complete,
                      isActive: _currentStep >= 4,
                      title: Text('Funding Requirements'),
                      content: PaymentForm(
                        paymentStep: _paymentStep,
                        onSubmit: () {
                          // Submit the form data
                        },
                        onPrevious: _goToPreviousStep,
                      ),
                    ),
                  ],
                ),

                if (_currentStep == 4)
                  ElevatedButton(
                    child: Text('Place Order'),
                    onPressed: () {

                      for(int i = 0; i < teamMembers.length; i++){
                        print(teamMembers[i].teamMember);
                        print(teamMembers[i].teamCulture);
                        print(teamMembers[i].teamMemberResponsibilities);
                      }
                      print(_fund.fundAmount);
                      print(_fund.fundPurpose);
                      print(_fund.timeline);
                      print(_fund.fundingSources);
                      print(_fund.investmentTerms);
                      print(_fund.investorBenefits);
                      print(_fund.riskFactors);
                      print(_fund.minimumInvestmentAmount);
                      print(_fund.maximumInvestmentAmount);
                      print(_fund.investmentStage);
                      print(_fund.industryFocus);

                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
