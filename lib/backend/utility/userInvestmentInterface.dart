
import 'package:pitchbox/backend/model/userInvestment.dart';

abstract class userInvestmentInterface {
  void addUserInvestment(userInvestment investment);
  Future<List<userInvestment>> getInvestmentList(String userId);
}