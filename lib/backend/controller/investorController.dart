import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pitchbox/backend/model/fund.dart';
import 'package:pitchbox/backend/model/industry.dart';
import 'package:pitchbox/backend/model/investor.dart';
import 'package:pitchbox/backend/service/investorService.dart';
import 'package:pitchbox/backend/utility/investorInterface.dart';

class IndustryController {
  InvestorInterface _industryService = InvestorService();
  final _investorService = InvestorService();

  Future<List<String>> getIndustryNames() async {
    return await _industryService.getIndustryNames();
  }


  Future<void> addInvestorProfile({
    required String investorId,
    required String fullName,
    required String email,
    required String investmentInterest,
    required List<String> professionalBackground,
    required List<String> investmentExperience,
    required String accreditedInvestorStatus,
    required String linkedinProfile,

    required List<String> investmentstrategy,
    required List<String> investmentSuccessStory,

    required String minimumInvestmentAmount,
    required String maximumInvestmentAmount,
    required String investmentStage,
    required List<String> industryFocus,
    required String location,
    required String investmentGoal,
    required String investmentCriteria,

  }) async {
    final investor = Investor(
      investorId: investorId,
      fullName: fullName,
      email: email,
      investmentInterest: investmentInterest,
      professionalBackground: professionalBackground,
      investmentExperience: investmentExperience,
      accreditedInvestorStatus: accreditedInvestorStatus,
      linkedinProfile: linkedinProfile,

      investmentstrategy: investmentstrategy,
      investmentSuccessStory: investmentSuccessStory,
    );
    final fund = Fund(
    fundId: '',
    fundAmount: '',
    fundPurpose: '',
    timeline: '',
    fundingSources: '',
    investmentTerms: '',
    investorBenefits: '',
    riskFactors: '',
    minimumInvestmentAmount: minimumInvestmentAmount,
    maximumInvestmentAmount: maximumInvestmentAmount,
    investmentStage: investmentStage,
    industryFocus: industryFocus,
      investorLocation: location,
    investmentGoal: investmentGoal,
    investmentCriteria: investmentCriteria,);

    await _investorService.addInvestorProfile(investor,fund);
  }

}

