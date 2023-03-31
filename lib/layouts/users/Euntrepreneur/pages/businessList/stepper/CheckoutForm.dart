import 'package:flutter/material.dart';
import 'AddressForm.dart';
import 'PaymentForm.dart';
import 'PersonalInfoForm.dart';
import 'PersonalInfoStep.dart';

class CheckoutForm extends StatefulWidget {
  @override
  _CheckoutFormState createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  int _currentStep = 0;

  PersonalInfoStep _personalInfoStep =
  PersonalInfoStep(firstName: '', lastName: '', email: '', phone: '');
  AddressStep _addressStep =
  AddressStep(street: '', city: '', state: '', zipCode: '');
  PaymentStep _paymentStep =
  PaymentStep(cardNumber: '', expirationDate: '', cvv: '');
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
                      title: Text('Personal Information'),
                      content: PersonalInfoForm(
                        personalInfoStep: _personalInfoStep,
                        onNext: _goToNextStep,
                      ),
                    ),
                    Step(
                      state: _currentStep <= 1
                          ? StepState.editing
                          : StepState.complete,
                      isActive: _currentStep >= 1,
                      title: Text('Shipping Address'),
                      content: AddressForm(
                        addressStep: _addressStep,
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
                      print(_personalInfoStep.firstName);
                      print(_personalInfoStep.lastName);
                      print(_personalInfoStep.phone);
                      print(_personalInfoStep.email);

                      print("-------------------------");

                      print(_addressStep.street);
                      print(_addressStep.city);
                      print(_addressStep.state);
                      print(_addressStep.zipCode);

                      print("-------------------------");

                      print(_paymentStep.cardNumber);
                      print(_paymentStep.expirationDate);
                      print(_paymentStep.cvv);
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
