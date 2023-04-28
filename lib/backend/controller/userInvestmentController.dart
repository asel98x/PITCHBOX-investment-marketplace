import 'package:pitchbox/backend/model/userInvestment.dart';
import 'package:pitchbox/backend/service/userInvestmentService.dart';

class userInvesmentController {
  final _userInvestment = userInterfaceService();

  Future<void> addUserInvestment({
    required String investmentId,
    required String userId,
    required String businessId,
    required String businessName,
    required String investedAmount,

  })async {
    final investment = userInvestment(
      investmentId: investmentId,
      userId: userId,
      businessId: businessId,
      businessName: businessName,
      investedAmount: investedAmount,
    );

    await _userInvestment.addUserInvestment(investment);

  }

  Future<List<userInvestment>> getInvestmentList(String userId) async {
    List<userInvestment> investmentList = await _userInvestment.getInvestmentList(userId);
    return investmentList;
  }
}