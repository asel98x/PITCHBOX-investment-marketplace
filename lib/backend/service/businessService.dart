import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pitchbox/backend/model/business.dart';
import 'package:pitchbox/backend/model/entrepreneur.dart';
import 'package:pitchbox/backend/model/fund.dart';
import 'package:pitchbox/backend/model/team.dart';
import 'package:pitchbox/backend/utility/businessInterface.dart';

class EntrepreneurService implements BusinessInterface {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('Entrepreneur');

  Future<DocumentReference> addNewBusiness(Entrepreneur entrepreneur, Business business, Fund fund) async {
    // Create a new document reference for the investor
    final docRef = usersCollection.doc();

    // Set the data for the entrepreneur document
    //await docRef.set({'id': docRef.id});

    // Set the data for the entrepreneur document
    await docRef.set({
        'id': docRef.id,
      'name': entrepreneur.name,
      'mobile': entrepreneur.mobile,
      'city': entrepreneur.city,
      'country': entrepreneur.country,
      'professionalExperience': entrepreneur.professionalExperience,
      'entrepreneurshipExperience': entrepreneur.entrepreneurshipExperience,
      'education': entrepreneur.education,
      'industryCertifications': entrepreneur.industryCertifications,
      'awardsAchievements': entrepreneur.awardsAchievements,
      'trackRecord': entrepreneur.trackRecord,
      'email': entrepreneur.email,
      'linkedin': entrepreneur.linkedin,
      'facebook': entrepreneur.facebook,
      'twitter': entrepreneur.twitter,
      'instagram': entrepreneur.instagram,
      'website': entrepreneur.website,

      'businessName': business.businessName,
      'businessIndustry': business.businessIndustry,
      'businessLocation': business.businessLocation,
      'executiveSummary': business.executiveSummary,
      'companyDescription': business.companyDescription,
      'businessModel': business.businessModel,
      'valueProposition': business.valueProposition,
      'productOrServiceOffering': business.productOrServiceOffering,
      'fundingNeeds': business.fundingNeeds,
      'website': business.website,

      'fundAmount': fund.fundAmount,
      'fundPurpose': fund.fundPurpose,
      'timeline': fund.timeline,
      'fundingSources': fund.fundingSources,
      'investmentTerms': fund.investmentTerms,
      'investorBenefits': fund.investorBenefits,
      'riskFactors': fund.riskFactors,

      'minimumInvestmentAmount': fund.minimumInvestmentAmount,
      'maximumInvestmentAmount': fund.maximumInvestmentAmount,
      'investorLocation': fund.investorLocation,
      'investmentStage': fund.investmentStage,
      'industryFocus': fund.industryFocus,
    });

    // // Set the data for the Business Information document
    // await docRef.set({
    //   'businessName': business.businessName,
    //   'businessIndustry': business.businessIndustry,
    //   'businessLocation': business.businessLocation,
    //   'executiveSummary': business.executiveSummary,
    //   'companyDescription': business.companyDescription,
    //   'businessModel': business.businessModel,
    //   'valueProposition': business.valueProposition,
    //   'productOrServiceOffering': business.productOrServiceOffering,
    //   'fundingNeeds': business.fundingNeeds,
    //   'website': business.website,
    // });
    //
    // // Set the data for the Funding Requirements document
    // await docRef.set({
    //   'fundAmount': fund.fundAmount,
    //   'fundPurpose': fund.fundPurpose,
    //   'timeline': fund.timeline,
    //   'fundingSources': fund.fundingSources,
    //   'investmentTerms': fund.investmentTerms,
    //   'investorBenefits': fund.investorBenefits,
    //   'riskFactors': fund.riskFactors,
    // });
    //
    // //await docRef.collection('Investor_Criteria').doc().set({
    // // Set the data for the Investor Criteria document
    // await docRef.set({
    //   'minimumInvestmentAmount': fund.minimumInvestmentAmount,
    //   'maximumInvestmentAmount': fund.maximumInvestmentAmount,
    //   'investorLocation': fund.investorLocation,
    //   'investmentStage': fund.investmentStage,
    //   'industryFocus': fund.industryFocus,
    // });


    return docRef;
  }

  Future<List<Business>> getNewBusinessesList() async {
    QuerySnapshot querySnapshot = await usersCollection.get();

    List<Business> newBusinesses = [];

    querySnapshot.docs.forEach((doc) {
      Business business = Business(
        businessId: doc.id, // use Firebase's document ID as the business ID
        businessIndustry: doc['businessIndustry'],
        businessName: doc['businessName'],
        businessLocation: doc['businessLocation'],
        companyDescription: doc['companyDescription'],
        website: doc['website'],
        executiveSummary: doc['executiveSummary'],
        businessModel: doc['businessModel'],
        valueProposition: doc['valueProposition'],
        productOrServiceOffering: doc['productOrServiceOffering'],
        fundingNeeds: doc['fundingNeeds'],
      );
      newBusinesses.add(business);
    });

    return newBusinesses;
  }



  // Function to retrieve a single business by name
  Future<Map<String, dynamic>?> getBusinessByName(String businessName) async {
    QuerySnapshot snapshot = await usersCollection
        .where('Business_Information.businessName', isEqualTo: businessName)
        .get();

    if (snapshot.docs.isNotEmpty) {
      DocumentSnapshot doc = snapshot.docs.first;

      Map<String, dynamic> business = {
        'id': doc.id,
        'businessName': doc['Business_Information']['businessName'],
        'businessIndustry': doc['Business_Information']['businessIndustry'],
        'businessLocation': doc['Business_Information']['businessLocation'],
        'executiveSummary': doc['Business_Information']['executiveSummary'],
        'companyDescription': doc['Business_Information']['companyDescription'],
        'businessModel': doc['Business_Information']['businessModel'],
        'valueProposition': doc['Business_Information']['valueProposition'],
        'productOrServiceOffering': doc['Business_Information']['productOrServiceOffering'],
        'fundingNeeds': doc['Business_Information']['fundingNeeds'],
        'website': doc['Business_Information']['website'],
        'entrepreneur': {
          'name': doc['personal_information']['name'],
          'mobile': doc['personal_information']['mobile'],
          'city': doc['personal_information']['city'],
          'country': doc['personal_information']['country'],
          'professionalExperience': doc['personal_information']['professionalExperience'],
          'entrepreneurshipExperience': doc['personal_information']['entrepreneurshipExperience'],
          'education': doc['personal_information']['education'],
          'industryCertifications': doc['personal_information']['industryCertifications'],
          'awardsAchievements': doc['personal_information']['awardsAchievements'],
          'trackRecord': doc['personal_information']['trackRecord'],
          'email': doc['personal_information']['email'],
          'linkedin': doc['personal_information']['linkedin'],
          'facebook': doc['personal_information']['facebook'],
          'twitter': doc['personal_information']['twitter'],
          'instagram': doc['personal_information']['instagram'],
          'website': doc['personal_information']['website'],
        },
      };

      return business;
    } else {
      return null;
    }
  }


  Future<void> deleteBusiness(String businessId) async {
    try {
      // Delete the document with the specified ID
      await _firestore.collection('Entrepreneur').doc(businessId).delete();
    } catch (e) {
      print('Error deleting business: $e');
    }
  }



}