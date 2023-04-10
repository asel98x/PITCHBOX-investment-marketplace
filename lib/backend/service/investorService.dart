import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pitchbox/backend/model/fund.dart';
import 'package:pitchbox/backend/model/industry.dart';
import 'package:pitchbox/backend/model/investor.dart';
import 'package:pitchbox/backend/utility/investorInterface.dart';

class InvestorService implements InvestorInterface {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('industries');
  final CollectionReference usersCollection2 = FirebaseFirestore.instance.collection('investor');

  @override
  Future<List<String>> getIndustryNames() async {
    QuerySnapshot querySnapshot = await _firestore.collection('industries').get();
    List<String> industryNames = [];
    querySnapshot.docs.forEach((doc) {
      industryNames.add(doc.get('name'));
    });
    return industryNames;
  }

  Future<DocumentReference> addInvestorProfile(Investor investor, Fund fund) async {
    // Create a new document reference for the investor
    final docRef = usersCollection2.doc();

    // Set the data for the investor document
    await docRef.set({'id': docRef.id});

    // Set the data for the investor document
    await docRef.collection('personal_information').doc().set({
      'investorId': investor.investorId,
      'fullName': investor.fullName,
      'email': investor.email,
      'investmentInterest': investor.investmentInterest,
      'professionalBackground': investor.professionalBackground,
      'investmentExperience': investor.investmentExperience,
      'accreditedInvestorStatus': investor.accreditedInvestorStatus,
      'linkedinProfile': investor.linkedinProfile,

      'investmentstrategy': investor.investmentstrategy,
      'investmentSuccessStory': investor.investmentSuccessStory,
    });


    // Set the data for the fund document
    await docRef.collection('Investment_Preferences').doc().set({
      'minimumInvestmentAmount': fund.minimumInvestmentAmount,
      'maximumInvestmentAmount': fund.maximumInvestmentAmount,
      'investmentStage': fund.investmentStage,
      'industryFocus': fund.industryFocus,
      'investorLocation': fund.investorLocation,
      'investmentGoal': fund.investmentGoal,
      'investmentCriteria': fund.investmentCriteria,
    });

    return docRef;
  }


}
