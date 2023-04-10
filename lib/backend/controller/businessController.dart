import 'package:pitchbox/backend/model/business.dart';
import 'package:pitchbox/backend/model/entrepreneur.dart';
import 'package:pitchbox/backend/model/fund.dart';
import 'package:pitchbox/backend/service/businessService.dart';

class BusinessController {
  final _EntrepreneurService = EntrepreneurService();
  final EntrepreneurService _service = EntrepreneurService();
  List<Map<String, dynamic>> _newBusinesses = [];

  List<Map<String, dynamic>> get newBusinesses => _newBusinesses;

  Future<void> addNewBusiness({
    required int uId,
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
    required String website,
    required String provider,
    required String imgUrl,
    required String pass,
    required List<String> professionalExperience,
    required List<String> entrepreneurshipExperience,
    required List<String> education,
    required List<String> industryCertifications,
    required List<String> awardsAchievements,
    required List<String> trackRecord,
    required String businessId,
    required String businessIndustry,
    required String businessName,
    required String businessLocation,
    required String companyDescription,
    required String website2,
    required String executiveSummary,
    required String businessModel,
    required String valueProposition,
    required String productOrServiceOffering,
    required String fundingNeeds,
    required String fundAmount,
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
  }) async {
    final entrepreneur = Entrepreneur(
      uId: uId,
      name: name,
      email: email,
      mobile: mobile,
      street: street,
      city: city,
      state: state,
      zipCode: zipCode,
      country: country,
      industry: industry,
      linkedin: linkedin,
      twitter: twitter,
      facebook: facebook,
      instagram: instagram,
      website: website,
      provider: provider,
      imgUrl: imgUrl,
      pass: pass,
      professionalExperience: professionalExperience,
      entrepreneurshipExperience: entrepreneurshipExperience,
      education: education,
      industryCertifications: industryCertifications,
      awardsAchievements: awardsAchievements,
      trackRecord: trackRecord,
    );
    final business = Business(
      businessId: '',
      businessIndustry: businessIndustry,
      businessName: businessName,
      businessLocation: businessLocation,
      companyDescription: companyDescription,
      website: website2,
      executiveSummary: executiveSummary,
      businessModel: businessModel,
      valueProposition: valueProposition,
      productOrServiceOffering: productOrServiceOffering,
      fundingNeeds: fundingNeeds,
    );
    final fund = Fund(
      fundId: '',
      fundAmount: fundAmount,
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
      investmentGoal: investmentGoal,
      investmentCriteria: investmentCriteria,
    );

    await _EntrepreneurService.addNewBusiness(entrepreneur, business, fund);
  }

  Future<List<Business>> getNewBusinesses() async {
    List<Business> newBusinesses =
        await _EntrepreneurService.getNewBusinessesList();
    return newBusinesses;
  }
}
