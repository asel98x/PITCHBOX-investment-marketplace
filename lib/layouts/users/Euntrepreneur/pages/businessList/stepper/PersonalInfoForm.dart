import 'package:flutter/material.dart';

import 'PersonalInfoStep.dart';

class PersonalInfoForm extends StatefulWidget {
  final PersonalInfoStep personalInfoStep;
  final Function onNext;

  PersonalInfoForm({required this.personalInfoStep, required this.onNext});

  @override
  _PersonalInfoFormState createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.personalInfoStep != null) {
      _firstNameController.text = widget.personalInfoStep.firstName;
      _lastNameController.text = widget.personalInfoStep.lastName;
      _emailController.text = widget.personalInfoStep.email;
      _phoneController.text = widget.personalInfoStep.phone;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _firstNameController,
            decoration: InputDecoration(labelText: 'First Name'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your first name.';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _lastNameController,
            decoration: InputDecoration(labelText: 'Last Name'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your last name.';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email address.';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(labelText: 'Phone'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone number.';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: Text('Next'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.personalInfoStep.firstName = _firstNameController.text;
                    widget.personalInfoStep.lastName = _lastNameController.text;
                    widget.personalInfoStep.email = _emailController.text;
                    widget.personalInfoStep.phone = _phoneController.text;
                    widget.onNext();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
