import 'package:pitchbox/backend/model/user.dart';

class Investor {
  String investorId;
  String fullName;
  String email;
  String investmentInterest;
  List<String> professionalBackground;
  List<String> investmentExperience;
  String accreditedInvestorStatus;
  String linkedinProfile;

  List<String> investmentstrategy;
  List<String> investmentSuccessStory;

  Investor({
    required this.investorId,
    required this.fullName,
    required this.email,
    required this.investmentInterest,
    required this.professionalBackground,
    required this.investmentExperience,
    required this.accreditedInvestorStatus,
    required this.linkedinProfile,

    required this.investmentstrategy,
    required this.investmentSuccessStory,
  });

  factory Investor.fromMap(Map<String, dynamic> map) {
    return Investor(
      investorId: map['investorId'],
      fullName: map['fullName'],
      email: map['email'],
      investmentInterest: map['investmentInterest'],
      professionalBackground: List<String>.from(map['professionalBackground']),
      investmentExperience: List<String>.from(map['investmentExperience']),
      accreditedInvestorStatus: map['accreditedInvestorStatus'],
      linkedinProfile: map['linkedinProfile'],

      investmentstrategy: List<String>.from(map['investmentstrategy']),
      investmentSuccessStory: List<String>.from(map['investmentSuccessStory']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'investorId': investorId,
      'fullName': fullName,
      'email': email,
      'investmentInterest': investmentInterest,
      'professionalBackground': professionalBackground,
      'investmentExperience': investmentExperience,
      'accreditedInvestorStatus': accreditedInvestorStatus,
      'linkedinProfile': linkedinProfile,

      'investmentstrategy': investmentstrategy,
      'investmentSuccessStory': investmentSuccessStory,
    };
  }
}
