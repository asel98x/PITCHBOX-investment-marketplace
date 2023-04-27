import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pitchbox/backend/model/loan.dart';
import 'package:pitchbox/backend/utility/loanInterface.dart';

class LoanService implements loanInterface {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('loan');

  @override
  Future<DocumentReference> addLoan(Loan loan) async {
    final docRef = userCollection.doc();
    await docRef.set({
      'loanId': docRef.id,
      'userId': loan.userId,
      'businessId': loan.businessId,
      'loanAmount': loan.loanAmount,
      'loanDescription': loan.loanDescription,
      'status': loan.status,
    });

    return docRef;
  }
  
}