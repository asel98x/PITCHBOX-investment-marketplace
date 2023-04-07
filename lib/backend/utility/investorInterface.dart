import 'package:pitchbox/backend/model/fund.dart';
import 'package:pitchbox/backend/model/investor.dart';

abstract class InvestorInterface {
  Future<List<String>> getIndustryNames();
  void addInvestorProfile(Investor investor, Fund fund);
}