 class Fund {
  late String _fundId;
  late String _fundAmount;
  late String _fundPurpose;
  late String _timeline;
  late String _fundingSources;
  late String _investmentTerms;
  late String _investorBenefits;
  late String _riskFactors;
  late String _minimumInvestmentAmount;
  late String _maximumInvestmentAmount;
  late String _investmentStage;
  late String _industryFocus;

  Fund({
    required String fundId,
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
    required String industryFocus,
  })  : _fundId = fundId,
        _fundAmount = fundAmount,
        _fundPurpose = fundPurpose,
        _timeline = timeline,
        _fundingSources = fundingSources,
        _investmentTerms = investmentTerms,
        _investorBenefits = investorBenefits,
        _riskFactors = riskFactors,
        _minimumInvestmentAmount = minimumInvestmentAmount,
        _maximumInvestmentAmount = maximumInvestmentAmount,
        _investmentStage = investmentStage,
        _industryFocus = industryFocus;

  String get fundId => _fundId;

  set fundId(String fundId) => _fundId = fundId;

  String get fundAmount => _fundAmount;

  set fundAmount(String fundAmount) => _fundAmount = fundAmount;

  String get fundPurpose => _fundPurpose;

  set fundPurpose(String fundPurpose) => _fundPurpose = fundPurpose;

  String get timeline => _timeline;

  set timeline(String timeline) => _timeline = timeline;

  String get fundingSources => _fundingSources;

  set fundingSources(String fundingSources) => _fundingSources = fundingSources;

  String get investmentTerms => _investmentTerms;

  set investmentTerms(String investmentTerms) =>
      _investmentTerms = investmentTerms;

  String get investorBenefits => _investorBenefits;

  set investorBenefits(String investorBenefits) =>
      _investorBenefits = investorBenefits;

  String get riskFactors => _riskFactors;

  set riskFactors(String riskFactors) => _riskFactors = riskFactors;

  String get minimumInvestmentAmount => _minimumInvestmentAmount;

  set minimumInvestmentAmount(String minimumInvestmentAmount) =>
      _minimumInvestmentAmount = minimumInvestmentAmount;

  String get maximumInvestmentAmount => _maximumInvestmentAmount;

  set maximumInvestmentAmount(String maximumInvestmentAmount) =>
      _maximumInvestmentAmount = maximumInvestmentAmount;

  String get investmentStage => _investmentStage;

  set investmentStage(String investmentStage) =>
      _investmentStage = investmentStage;

  String get industryFocus => _industryFocus;

  set industryFocus(String industryFocus) => _industryFocus = industryFocus;
}
