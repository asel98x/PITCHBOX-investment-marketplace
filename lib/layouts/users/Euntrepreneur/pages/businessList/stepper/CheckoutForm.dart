import 'package:flutter/material.dart';
import 'package:pitchbox/backend/model/businessTeam.dart';
import 'package:pitchbox/backend/model/entrepreneur.dart';
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

  Business _business = Business(businessId: '', businessName: '', companyDescription: '', website: '', executiveSummary: '', businessModel: '', valueProposition: '', productOrServiceOffering: '', businessIndustry: '', fundingNeeds: '');
  Entrepreneur _entrepreneur = Entrepreneur(uId: 0, name: '', email: '', mobile: '', street: '', city: '', state: '', zipCode: '', country: '', industry: '', linkedin: '', twitter: '', facebook: '', instagram: '', provider: '', imgUrl: '', professionalExperience: [], entrepreneurshipExperience: [], education: [], industryCertifications: [], awardsAchievements: [], trackRecord: [], website: '');
  BusinessTeam _businessTeam = BusinessTeam(teamMemberId: '', teamMember: '', teamMemberRole: '', teamMemberExperience: '', teamMemberAchievements: '', teamMemberLinkedIn_Profiles: '', teamMemberResponsibilities: '', teamCulture: '');
  PersonalInfoStep _personalInfoStep =PersonalInfoStep(fullName: '', city: '', email: '', phone: '', professionalExperience: []);
  AddressStep _addressStep =AddressStep(street: '', city: '', state: '', zipCode: '');
  PaymentStep _paymentStep =PaymentStep(cardNumber: '', expirationDate: '', cvv: '');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _goToNextStep() {
    if (_currentStep < 2) {
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
                      state: _currentStep <= 0
                          ? StepState.editing
                          : StepState.complete,
                      isActive: _currentStep >= 0,
                      title: Text('Business Information'),
                      content: businessInfoForm(
                        business: _business,
                        onNext: _goToNextStep,
                      ),
                    ),
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
                      state: StepState.complete,
                      isActive: _currentStep >= 2,
                      title: Text('Payment Information'),
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

                if (_currentStep == 2)
                  ElevatedButton(
                    child: Text('Place Order'),
                    onPressed: () {

                      print(_business.businessName);
                      print(_business.businessIndustry);
                      print(_business.executiveSummary);
                      print(_business.companyDescription);
                      print(_business.businessModel);
                      print(_business.valueProposition);
                      print(_business.productOrServiceOffering);
                      print(_business.fundingNeeds);
                      print(_business.website);

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
