class Fund {
  late String fundId;
  String fundAmount;
  String fundPurpose;
  String timeline;
  String fundingSources;
  String investmentTerms;
  String investorBenefits;
  String riskFactors;
  String minimumInvestmentAmount;
  String maximumInvestmentAmount;
  String investmentStage;
  List<String> industryFocus;
  String location;
  String investmentGoal;
  String investmentCriteria;

  Fund({
    required this.fundId,
    required this.fundAmount,
    required this.fundPurpose,
    required this.timeline,
    required this.fundingSources,
    required this.investmentTerms,
    required this.investorBenefits,
    required this.riskFactors,
    required this.minimumInvestmentAmount,
    required this.maximumInvestmentAmount,
    required this.investmentStage,
    required this.industryFocus,
    required this.location,
    required this.investmentGoal,
    required this.investmentCriteria,
  });

  factory Fund.fromMap(Map<String, dynamic> map) {
    return Fund(
      fundId: map['fundId'],
      fundAmount: map['fundAmount'],
      fundPurpose: map['fundPurpose'],
      timeline: map['timeline'],
      fundingSources: map['fundingSources'],
      investmentTerms: map['investmentTerms'],
      investorBenefits: map['investorBenefits'],
      riskFactors: map['riskFactors'],
      minimumInvestmentAmount: map['minimumInvestmentAmount'],
      maximumInvestmentAmount: map['maximumInvestmentAmount'],
      investmentStage: map['investmentStage'],
      industryFocus: List<String>.from(map['industryFocus']),
      location: map['location'],
      investmentGoal: map['investmentGoal'],
      investmentCriteria: map['investmentCriteria'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fundId': fundId,
      'fundAmount': fundAmount,
      'fundPurpose': fundPurpose,
      'timeline': timeline,
      'fundingSources': fundingSources,
      'investmentTerms': investmentTerms,
      'investorBenefits': investorBenefits,
      'riskFactors': riskFactors,
      'minimumInvestmentAmount': minimumInvestmentAmount,
      'maximumInvestmentAmount': maximumInvestmentAmount,
      'investmentStage': investmentStage,
      'industryFocus': industryFocus,
      'location': location,
      'investmentGoal': investmentGoal,
      'investmentCriteria': investmentCriteria,
    };
  }
}
