class Business {
   String _businessId;
   String _businessIndustry;
   String _businessName;
   String _businessLocation;
   String _companyDescription;
   String _website;
   String _executiveSummary;
   String _businessModel;
   String _valueProposition;
   String _productOrServiceOffering;
   String _fundingNeeds;

   Business({
      required String businessId,
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
   })
       : _businessId = businessId,
          _businessIndustry = businessIndustry,
          _businessName = businessName,
          _businessLocation = businessLocation,
          _companyDescription = companyDescription,
          _website = website,
          _executiveSummary = executiveSummary,
          _businessModel = businessModel,
          _valueProposition = valueProposition,
          _productOrServiceOffering = productOrServiceOffering,
          _fundingNeeds = fundingNeeds;

   String get businessId => _businessId;

   set businessId(String businessId) => _businessId = businessId;

   String get businessIndustry => _businessIndustry;

   set businessIndustry(String businessIndustry) =>
       _businessIndustry = businessIndustry;

   String get businessName => _businessName;

   set businessName(String businessName) => _businessName = businessName;

   String get businessLocation => _businessLocation;

   set businessLocation(String businessLocation) => _businessLocation = businessLocation;

   String get companyDescription => _companyDescription;

   set companyDescription(String companyDescription) =>
       _companyDescription = companyDescription;

   String get website => _website;

   set website(String website) => _website = website;

   String get executiveSummary => _executiveSummary;

   set executiveSummary(String executiveSummary) =>
       _executiveSummary = executiveSummary;

   String get businessModel => _businessModel;

   set businessModel(String businessModel) => _businessModel = businessModel;

   String get valueProposition => _valueProposition;

   set valueProposition(String valueProposition) =>
       _valueProposition = valueProposition;

   String get productOrServiceOffering => _productOrServiceOffering;

   set productOrServiceOffering(String productOrServiceOffering) =>
       _productOrServiceOffering = productOrServiceOffering;

   String get fundingNeeds => _fundingNeeds;

   set fundingNeeds(String fundingNeeds) => _fundingNeeds = fundingNeeds;

}
