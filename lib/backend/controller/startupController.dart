import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pitchbox/backend/model/businessModel.dart';
import 'package:pitchbox/backend/service/startupService.dart';

class BusinessController {
  final _BusinessService = BusinessService();
  List<Map<String, dynamic>> _newBusinesses = [];
  List<Map<String, dynamic>> get newBusinesses => _newBusinesses;

  Future<void> addNewBusiness({
    required String id,
    required String businessId,
    required String userId,
    required String name,
    required String email,
    required String mobile,
    required String street,
    required String city,
    required String state,
    required String zipCode,
    required String country,
    required String industry,
    required String linkedin,
    required String twitter,
    required String facebook,
    required String instagram,
    required String Userwebsite,
    required File UserImgUrl,
    required String provider,
    required String pass,
    required List<String> professionalExperience,
    required List<String> entrepreneurshipExperience,
    required List<String> education,
    required List<String> industryCertifications,
    required List<String> awardsAchievements,
    required List<String> trackRecord,
    required String businessIndustry,
    required String businessName,
    required String businessLocation,
    required String companyDescription,
    required String website,
    required String executiveSummary,
    required String businessModel,
    required String valueProposition,
    required String productOrServiceOffering,
    required String fundingNeeds,
    required File businessImgUrl,
    required String fundAmount,
    required String avaiableFundAmount,
    required String fundPurpose,
    required String timeline,
    required String fundingSources,
    required String investmentTerms,
    required String investorBenefits,
    required String riskFactors,
    required String minimumInvestmentAmount,
    required String maximumInvestmentAmount,
    required String investmentStage,
    required List<String> industryFocus,
    required String investorLocation,
    required String investmentGoal,
    required String investmentCriteria,
    required String status,
  }) async {

    // Upload user image to Firebase Storage
    final userImageRef = FirebaseStorage.instance
        .ref('user_images/${DateTime.now().millisecondsSinceEpoch}');
    final userImageUploadTask = userImageRef.putFile(UserImgUrl);
    final userImageSnapshot = await userImageUploadTask;
    final userImageDownloadUrl = await userImageSnapshot.ref.getDownloadURL();

    // Upload business image to Firebase Storage
    final businessImageRef = FirebaseStorage.instance
        .ref('business_images/${DateTime.now().millisecondsSinceEpoch}');
    final businessImageUploadTask = businessImageRef.putFile(businessImgUrl);
    final businessImageSnapshot = await businessImageUploadTask;
    final businessImageDownloadUrl = await businessImageSnapshot.ref.getDownloadURL();




    final business = Business(
      id: '',
      userId: userId ,
      name: name,
      email: email,
      mobile: mobile,
      city: city,
      country: country,
      linkedin: linkedin,
      twitter: twitter,
      facebook: facebook,
      instagram: instagram,
      Userwebsite: Userwebsite,
      UserImgUrl: userImageDownloadUrl,
      professionalExperience: professionalExperience,
      entrepreneurshipExperience: entrepreneurshipExperience,
      education: education,
      industryCertifications: industryCertifications,
      awardsAchievements: awardsAchievements,
      trackRecord: trackRecord,

      businessId: '',
      businessIndustry: businessIndustry,
      businessName: businessName,
      businessLocation: businessLocation,
      companyDescription: companyDescription,
      website: website,
      executiveSummary: executiveSummary,
      businessModel: businessModel,
      valueProposition: valueProposition,
      productOrServiceOffering: productOrServiceOffering,
      fundingNeeds: fundingNeeds,
      businessImgUrl: businessImageDownloadUrl,

      fundAmount: fundAmount,
      avaiableFundAmount: avaiableFundAmount,
      fundPurpose: fundPurpose,
      timeline: timeline,
      fundingSources: fundingSources,
      investmentTerms: investmentTerms,
      investorBenefits: investorBenefits,
      riskFactors: riskFactors,

      minimumInvestmentAmount: minimumInvestmentAmount,
      maximumInvestmentAmount: maximumInvestmentAmount,
      investmentStage: investmentStage,
      industryFocus: industryFocus,
      investorLocation: investorLocation,
      status: status,
    );



    await _BusinessService.addNewBusiness(business);
  }

  Future<List<Business>> getNewBusinessesList() async {
    List<Business> newBusinesses =
    await _BusinessService.getNewBusinessesList();
    return newBusinesses;
  }

  Future<List<Business>> getNewBusinessesListINT() async {
    List<Business> newBusinesses =
    await _BusinessService.getNewBusinessesListINT();
    return newBusinesses;
  }

  Future<List<Business>> getNewBusinessesListEUN(String userId) async {
    List<Business> newBusinesses =
    await _BusinessService.getNewBusinessesListEUN(userId);
    return newBusinesses;
  }

  Future<List<Business>> getNewBusiness(String businessName) async {
    return await _BusinessService.getNewBusiness(businessName);
  }

  Future<List<String>> getNewBusinessNames() async {
    return await _BusinessService.getNewBusinessNames();
  }

  Future<void> updateNewBusiness(
  {required String id,
    required String userId,
    required String name,
    required String email,
    required String mobile,
    required String street,
    required String city,
    required String state,
    required String zipCode,
    required String country,
    required String industry,
    required String linkedin,
    required String twitter,
    required String facebook,
    required String instagram,
    required String Userwebsite,
    required File? UserImgUrl,
    required String provider,
    required String pass,
    required List<String> professionalExperience,
    required List<String> entrepreneurshipExperience,
    required List<String> education,
    required List<String> industryCertifications,
    required List<String> awardsAchievements,
    required List<String> trackRecord,
    required String businessIndustry,
    required String businessName,
    required String businessLocation,
    required String companyDescription,
    required String website,
    required String executiveSummary,
    required String businessModel,
    required String valueProposition,
    required String productOrServiceOffering,
    required String fundingNeeds,
    required File? businessImgUrl,
    required String fundAmount,
    required String avaiableFundAmount,
    required String fundPurpose,
    required String timeline,
    required String fundingSources,
    required String investmentTerms,
    required String investorBenefits,
    required String riskFactors,
    required String minimumInvestmentAmount,
    required String maximumInvestmentAmount,
    required String investmentStage,
    required List<String> industryFocus,
    required String investorLocation,
    required String investmentGoal,
    required String investmentCriteria,
    required String status,
    required File? image,
    required String userImageDownloadUrl,
    required String businessImageDownloadUrl}) async {
    try{
      if (UserImgUrl != null && businessImgUrl != null) {
      // update user image to Firebase Storage
        final userImageRef = FirebaseStorage.instance
            .ref('user_images/${DateTime.now().millisecondsSinceEpoch}');
        final userImageUploadTask = userImageRef.putFile(UserImgUrl!);
        final userImageSnapshot = await userImageUploadTask;
        final userImageDownloadUrl2 = await userImageSnapshot.ref.getDownloadURL();

        // update business image to Firebase Storage
        final businessImageRef = FirebaseStorage.instance
            .ref('business_images/${DateTime.now().millisecondsSinceEpoch}');
        final businessImageUploadTask = businessImageRef.putFile(businessImgUrl!);
        final businessImageSnapshot = await businessImageUploadTask;
        final businessImageDownloadUrl2 = await businessImageSnapshot.ref.getDownloadURL();

        Business business = Business(
          id: id,
          userId: userId ,
          name: name,
          email: email,
          mobile: mobile,
          city: city,
          country: country,
          linkedin: linkedin,
          twitter: twitter,
          facebook: facebook,
          instagram: instagram,
          Userwebsite: Userwebsite,
          UserImgUrl: userImageDownloadUrl2,
          professionalExperience: professionalExperience,
          entrepreneurshipExperience: entrepreneurshipExperience,
          education: education,
          industryCertifications: industryCertifications,
          awardsAchievements: awardsAchievements,
          trackRecord: trackRecord,

          businessId: '',
          businessIndustry: businessIndustry,
          businessName: businessName,
          businessLocation: businessLocation,
          companyDescription: companyDescription,
          website: website,
          executiveSummary: executiveSummary,
          businessModel: businessModel,
          valueProposition: valueProposition,
          productOrServiceOffering: productOrServiceOffering,
          fundingNeeds: fundingNeeds,
          businessImgUrl: businessImageDownloadUrl2,

          fundAmount: fundAmount,
          avaiableFundAmount:avaiableFundAmount,
          fundPurpose: fundPurpose,
          timeline: timeline,
          fundingSources: fundingSources,
          investmentTerms: investmentTerms,
          investorBenefits: investorBenefits,
          riskFactors: riskFactors,

          minimumInvestmentAmount: minimumInvestmentAmount,
          maximumInvestmentAmount: maximumInvestmentAmount,
          investmentStage: investmentStage,
          industryFocus: industryFocus,
          investorLocation: investorLocation,
          status: status,
        );
        await _BusinessService.updateNewBusiness(business);

      }else{
        Business business = Business(
          id: id,
          userId: userId ,
          name: name,
          email: email,
          mobile: mobile,
          city: city,
          country: country,
          linkedin: linkedin,
          twitter: twitter,
          facebook: facebook,
          instagram: instagram,
          Userwebsite: Userwebsite,
          UserImgUrl: userImageDownloadUrl,
          professionalExperience: professionalExperience,
          entrepreneurshipExperience: entrepreneurshipExperience,
          education: education,
          industryCertifications: industryCertifications,
          awardsAchievements: awardsAchievements,
          trackRecord: trackRecord,

          businessId: '',
          businessIndustry: businessIndustry,
          businessName: businessName,
          businessLocation: businessLocation,
          companyDescription: companyDescription,
          website: website,
          executiveSummary: executiveSummary,
          businessModel: businessModel,
          valueProposition: valueProposition,
          productOrServiceOffering: productOrServiceOffering,
          fundingNeeds: fundingNeeds,
          businessImgUrl: businessImageDownloadUrl,

          fundAmount: fundAmount,
          avaiableFundAmount:avaiableFundAmount,
          fundPurpose: fundPurpose,
          timeline: timeline,
          fundingSources: fundingSources,
          investmentTerms: investmentTerms,
          investorBenefits: investorBenefits,
          riskFactors: riskFactors,

          minimumInvestmentAmount: minimumInvestmentAmount,
          maximumInvestmentAmount: maximumInvestmentAmount,
          investmentStage: investmentStage,
          industryFocus: industryFocus,
          investorLocation: investorLocation,
          status: status,
        );
        await _BusinessService.updateNewBusiness(business);
      }
    }catch(e){
      debugPrint('Error updating business: $e');
    }

  }

  Future<void> deleteNewBusiness(String businessId) async {
    await _BusinessService.deleteNewBusiness(businessId);
  }

  Future<Business> getBusiness(String businessId) async {
    return await _BusinessService.getBusiness(businessId);
  }
}