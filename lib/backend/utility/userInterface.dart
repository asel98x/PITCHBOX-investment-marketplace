import 'package:pitchbox/backend/model/mainUser.dart';

abstract class UserInterface {
  void addInvestor(MainUser mainUser);
  void addEntrepreneur(MainUser MainUser);
  Future<List<MainUser>> getUserDetails(String id);
}