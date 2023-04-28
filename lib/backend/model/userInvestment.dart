import 'package:cloud_firestore/cloud_firestore.dart';

class userInvestment {
  String investmentId;
  String userId;
  final String businessId;
  final String businessName;
  final String investedAmount;

  userInvestment({
    required this.investmentId,
    required this.userId,
    required this.businessId,
    required this.businessName,
    required this.investedAmount,
  });

  factory userInvestment.fromSnapshot(DocumentSnapshot snapshot) {
    return userInvestment(
      investedAmount: snapshot['investedAmount'],
      businessId: snapshot['businessId'],
      businessName: snapshot['businessName'],
      userId: snapshot['userId'],
      investmentId: snapshot.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'investmentId': investmentId,
      'userId': userId,
      'businessId': businessId,
      'businessName': businessName,
      'investedAmount': investedAmount,
    };
  }
}