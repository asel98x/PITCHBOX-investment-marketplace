import 'package:flutter/material.dart';
import 'package:pitchbox/backend/model/fund.dart';

import '../../../../../../backend/model/investor.dart';
import '../../../../../../backend/service/investorService.dart';

class AddInvestorScreen extends StatefulWidget {
  const AddInvestorScreen({Key? key}) : super(key: key);

  @override
  _AddInvestorScreenState createState() => _AddInvestorScreenState();
}

final InvestorService _investorService = InvestorService();

void addInvestorProfiles() async {
  // Create sample investor data with multiple values in array lists
  final List<Investor> investors = [
    Investor(
      investorId: '1',
      fullName: 'John Doe',
      email: 'johndoe@example.com',
      investmentInterest: 'Real estate',
      professionalBackground: ['Accountant', 'Financial analyst'],
      investmentExperience: ['Residential', 'Commercial'],
      accreditedInvestorStatus: 'Yes',
      linkedinProfile: 'https://www.linkedin.com/in/johndoe',
      investmentstrategy: ['test1','test2'],
      investmentSuccessStory: ['test3','test4'],
    ),
  ];

  final List<Fund> funds = [
    Fund(
        fundId: '1',
        fundAmount: '500000',
        fundPurpose: 'To invest in early-stage technology startups',
        timeline: '3 years',
        fundingSources: 'Individual and institutional investors',
        investmentTerms: '10% equity stake in each portfolio company',
        investorBenefits: 'Quarterly updates, co-investment opportunities',
        riskFactors: 'Startup failure rates, market volatility',
        minimumInvestmentAmount: '10000',
        maximumInvestmentAmount: '100000',
        investmentStage: 'Seed and Series A',
        industryFocus: ['Artificial intelligence','Blockchain','Cybersecurity'
        ],
        location: 'San Francisco, CA',
        investmentGoal:
        'To generate returns for investors by investing in promising technology startups',
        investmentCriteria:
        'We seek companies with disruptive technologies, experienced teams, and strong growth potential'),

  ];

  // Add each investor profile to Firestore using service class
  for (int i = 0; i < investors.length && i < funds.length; i++) {
    await _investorService.addInvestorProfile(
      investors[i],
      funds[i],
    );
  }

  // Print message to confirm completion
  print('Investor profiles added successfully!');
}

class _AddInvestorScreenState extends State<AddInvestorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Investor'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Call the addInvestorProfiles function here
            addInvestorProfiles();
          },
          child: const Text('Add Investor'),
        ),
      ),
    );
  }
}
