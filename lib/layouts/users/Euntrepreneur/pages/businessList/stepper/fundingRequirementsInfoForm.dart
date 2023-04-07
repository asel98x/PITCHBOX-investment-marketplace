import 'package:flutter/material.dart';
import 'package:pitchbox/backend/model/business.dart';
import 'package:pitchbox/backend/model/fund.dart';


class fundingRequirementsInfoForm extends StatefulWidget {
  late final Fund fund;
  late final Function onNext;

  fundingRequirementsInfoForm({required this.fund, required this.onNext});

  @override
  _fundingRequirementsInfoFormState createState() => _fundingRequirementsInfoFormState();
}

class _fundingRequirementsInfoFormState extends State<fundingRequirementsInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final _fundAmount = TextEditingController();
  final _fundPurpose = TextEditingController();
  final _timeline = TextEditingController();
  final _fundingSources = TextEditingController();
  final _investmentTerms = TextEditingController();
  final _investorBenefits = TextEditingController();
  final _riskFactors = TextEditingController();
  final _minimumInvestmentAmount = TextEditingController();
  final _maximumInvestmentAmount = TextEditingController();
  final _investmentStage = TextEditingController();
  final _industryFocus = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.fund != null) {
      _fundAmount.text = widget.fund.fundAmount;
      _fundPurpose.text = widget.fund.fundPurpose;
      _timeline.text = widget.fund.timeline;
      _fundingSources.text = widget.fund.fundingSources;
      _investmentTerms.text = widget.fund.investmentTerms;
      _investorBenefits.text = widget.fund.investorBenefits;
      _riskFactors.text = widget.fund.riskFactors;
      _minimumInvestmentAmount.text = widget.fund.minimumInvestmentAmount;
      _maximumInvestmentAmount.text = widget.fund.maximumInvestmentAmount;
      _investmentStage.text = widget.fund.investmentStage;
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
              maxLines: 3, // Set the maximum number of lines for the input
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
              maxLines: 3, // Set the maximum number of lines for the input
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
              maxLines: 3, // Set the maximum number of lines for the input
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Investment Terms';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller:  _investorBenefits,
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
              maxLines: 3, // Set the maximum number of lines for the input
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Investor Benefits';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller:  _riskFactors,
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
              maxLines: 3, // Set the maximum number of lines for the input
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Risk Factors';
                }
                return null;
              },
            ),SizedBox(height: 20),
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
              maxLines: 3,
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
            TextFormField(
              controller: _investmentStage,
              decoration: InputDecoration(
                labelText: 'Investment Stage',
                suffixIcon: Tooltip(
                  message: 'Investment Stage',
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
                  return 'Please enter Investment Stage';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _industryFocus,
              decoration: InputDecoration(
                labelText: 'Industry Focus',
                suffixIcon: Tooltip(
                  message: 'Industry Focus',
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
                  return 'Please enter Industry Focus';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                ElevatedButton(
                  child: Text('Next'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.fund.fundAmount = _fundAmount.text;
                      widget.fund.fundPurpose = _fundPurpose.text;
                      widget.fund.timeline = _timeline.text;
                      widget.fund.fundingSources = _fundingSources.text;
                      widget.fund.investmentTerms = _investmentTerms.text;
                      widget.fund.investorBenefits = _investorBenefits.text;
                      widget.fund.riskFactors = _riskFactors.text;
                      widget.fund.minimumInvestmentAmount = _minimumInvestmentAmount.text;
                      widget.fund.maximumInvestmentAmount = _maximumInvestmentAmount.text;
                      widget.fund.investmentStage = _investmentStage.text;
                      //widget.fund.industryFocus = _industryFocus.text;
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
