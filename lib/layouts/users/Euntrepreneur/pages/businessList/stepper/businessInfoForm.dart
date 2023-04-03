import 'package:flutter/material.dart';
import 'package:pitchbox/backend/model/business.dart';


class businessInfoForm extends StatefulWidget {
  late final Business business;
  late final Function onNext;

  businessInfoForm({required this.business, required this.onNext});

  @override
  _businessInfoFormState createState() => _businessInfoFormState();
}

class _businessInfoFormState extends State<businessInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final _businessName = TextEditingController();
  final _businessIndustry = TextEditingController();
  final _companyDescription = TextEditingController();
  final _website = TextEditingController();
  final _executiveSummary = TextEditingController();
  final _businessModel = TextEditingController();
  final _valueProposition = TextEditingController();
  final _productOrServiceOffering = TextEditingController();
  final _fundingNeeds = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.business != null) {
      _businessName.text = widget.business.businessName;
      _executiveSummary.text = widget.business.executiveSummary;
      _companyDescription.text = widget.business.companyDescription;
      _businessModel.text = widget.business.businessModel;
      _valueProposition.text = widget.business.valueProposition;
      _productOrServiceOffering.text = widget.business.productOrServiceOffering;
      _website.text = widget.business.website;
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
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
              maxLines: 3, // Set the maximum number of lines for the input
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
              maxLines: 3, // Set the maximum number of lines for the input
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
              maxLines: 3, // Set the maximum number of lines for the input
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a Business Model';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller:  _valueProposition,
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
              maxLines: 3, // Set the maximum number of lines for the input
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a Value Proposition';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller:  _productOrServiceOffering,
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
              maxLines: 3, // Set the maximum number of lines for the input
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Product Or Service Offering';
                }
                return null;
              },
            ),SizedBox(height: 20),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
              //   ElevatedButton(
              //   child: Text('Previous'),
              //   onPressed: () {
              //     widget.onNext(Business(
              //       businessName: _businessName.text,
              //       executiveSummary: _executiveSummary.text,
              //       companyDescription: _companyDescription.text,
              //       businessModel: _businessModel.text,
              //       valueProposition: _valueProposition.text,
              //       productOrServiceOffering: _productOrServiceOffering.text,
              //       website: _website.text, businessId: '',
              //     ), -1);
              //   },
              // ),
                ElevatedButton(
                  child: Text('Next'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.business.businessName = _businessName.text;
                      widget.business.businessIndustry = _businessIndustry.text;
                      widget.business.executiveSummary = _executiveSummary.text;
                      widget.business.companyDescription = _companyDescription.text;
                      widget.business.businessModel = _businessModel.text;
                      widget.business.valueProposition = _valueProposition.text;
                      widget.business.productOrServiceOffering = _productOrServiceOffering.text;
                      widget.business.fundingNeeds = _fundingNeeds.text;
                      widget.business.website = _website.text;
                      widget.onNext();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
