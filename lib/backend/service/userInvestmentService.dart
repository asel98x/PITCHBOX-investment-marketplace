import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pitchbox/backend/model/userInvestment.dart';
import 'package:pitchbox/backend/utility/userInvestmentInterface.dart';

class userInterfaceService implements userInvestmentInterface {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('investment');

  @override
  Future<DocumentReference> addUserInvestment(userInvestment investment) async {
    final docRef = userCollection.doc();
    await docRef.set({
      'investmentId': docRef.id,
      'userId': investment.userId,
      'businessId': investment.businessId,
      'businessName': investment.businessName,
      'investedAmount': investment.investedAmount,
    });

    return docRef;
  }

  @override
  Future<List<userInvestment>> getInvestmentList(String userId) async {
    QuerySnapshot querySnapshot = await _firestore.collection('investment')
        .where('userId', isEqualTo: userId)
        .get();

    List<userInvestment> investmentList = [];

    querySnapshot.docs.forEach((doc) {
      userInvestment investment = userInvestment(
        investmentId: doc.id,
        userId: doc['userId'],
        businessId: doc['businessId'],
        businessName: doc['businessName'],
        investedAmount: doc['investedAmount'],
      );
      investmentList.add(investment);
    });

    return investmentList;
  }

}