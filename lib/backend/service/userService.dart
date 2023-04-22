import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pitchbox/backend/model/mainUser.dart';
import 'package:pitchbox/backend/utility/userInterface.dart';

class UserService implements UserInterface {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');


  @override
  Future<DocumentReference> addEntrepreneur(MainUser mainUser) async{
    final docRef = userCollection.doc();
    await docRef.set({
      'userId': docRef.id,
      'userName': mainUser.userName,
      'userEmail': mainUser.userEmail,
      'userPassword': mainUser.userPassword,
      'userType': mainUser.userType,
    });

    return docRef;
  }

  @override
  Future<DocumentReference> addInvestor(MainUser mainUser) async{
    final docRef = userCollection.doc();
    await docRef.set({
      'userId': docRef.id,
      'userName': mainUser.userName,
      'userEmail': mainUser.userEmail,
      'userPassword': mainUser.userPassword,
      'userType': mainUser.userType,
    });

    return docRef;
  }

  @override
  Future<List<MainUser>> getUserDetails(String id) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('users')
        .where('userId', isEqualTo: id)
        .get();
    List<MainUser> investors = [];
    querySnapshot.docs.forEach((doc) {
      investors.add(MainUser.fromSnapshot(doc));
    });
    return investors;
  }
  
}