import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pitchbox/backend/model/fund.dart';
import 'package:pitchbox/backend/model/industry.dart';
import 'package:pitchbox/backend/model/investor.dart';
import 'package:pitchbox/backend/utility/investorInterface.dart';

class InvestorService implements InvestorInterface {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('industries');
  final CollectionReference usersCollection2 = FirebaseFirestore.instance.collection('users');

  @override
  Future<List<String>> getIndustryNames() async {
    QuerySnapshot querySnapshot = await _firestore.collection('industries').get();
    List<String> industryNames = [];
    querySnapshot.docs.forEach((doc) {
      industryNames.add(doc.get('name'));
    });
    return industryNames;
  }

  Future<DocumentReference> addInvestorProfile(String userId, Investor investor, Fund fund) async {
    final querySnapshot = await usersCollection2.where('userId', isEqualTo: userId).get();
    if (querySnapshot.docs.isEmpty) {
      // If the user document doesn't exist, create a new document reference for the user
      final docRef = usersCollection2.doc();

      // Set the data for the user document
      await docRef.set({'userId': userId});

      // Set the data for the user's investor profile document
      final investorRef = docRef.collection('investor_profile').doc();
      await investorRef.set({
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
        'minimumInvestmentAmount': fund.minimumInvestmentAmount,
        'maximumInvestmentAmount': fund.maximumInvestmentAmount,
        'investmentStage': fund.investmentStage,
        'industryFocus': fund.industryFocus,
        'investorLocation': fund.investorLocation,
        'investmentGoal': fund.investmentGoal,
        'investmentCriteria': fund.investmentCriteria,
      });

      return docRef; // Return the document reference
    } else {
      // If the user document already exists, use its document reference to add the investor profile
      final docRef = querySnapshot.docs.first.reference;
      final investorRef = docRef.collection('investor_profile').doc();
      await investorRef.set({
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
        'minimumInvestmentAmount': fund.minimumInvestmentAmount,
        'maximumInvestmentAmount': fund.maximumInvestmentAmount,
        'investmentStage': fund.investmentStage,
        'industryFocus': fund.industryFocus,
        'investorLocation': fund.investorLocation,
        'investmentGoal': fund.investmentGoal,
        'investmentCriteria': fund.investmentCriteria,
      });

      return docRef; // Return the document reference
    }
  }

  @override
  Future<void> updateNewBusiness(String userId, Investor investor, Fund fund) async {
    final querySnapshot = await usersCollection2.where('userId', isEqualTo: userId).get();
    if (querySnapshot.docs.isNotEmpty) {
      final docRef = querySnapshot.docs.first.reference;
      var investorProfileRef = await docRef.collection('investor_profile').limit(1).get();

      await investorProfileRef.docs.first.reference.update({
        'fullName': investor.fullName,
        'email': investor.email,
        'investmentInterest': investor.investmentInterest,
        'professionalBackground': investor.professionalBackground,
        'investmentExperience': investor.investmentExperience,
        'accreditedInvestorStatus': investor.accreditedInvestorStatus,
        'linkedinProfile': investor.linkedinProfile,
        'investmentstrategy': investor.investmentstrategy,
        'investmentSuccessStory': investor.investmentSuccessStory,
        'minimumInvestmentAmount': fund.minimumInvestmentAmount,
        'maximumInvestmentAmount': fund.maximumInvestmentAmount,
        'investmentStage': fund.investmentStage,
        'industryFocus': fund.industryFocus,
        'investorLocation': fund.investorLocation,
        'investmentGoal': fund.investmentGoal,
        'investmentCriteria': fund.investmentCriteria,
      });
    } else {
      throw Exception("User document doesn't exist");
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getNewBusinessDetails(String id) async {
    final querySnapshot = await _firestore
        .collection('users')
        .doc(id)
        .collection('investor_profile')
        .get();

    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }







}
