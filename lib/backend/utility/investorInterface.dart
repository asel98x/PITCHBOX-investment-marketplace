import 'package:pitchbox/backend/model/fund.dart';
import 'package:pitchbox/backend/model/investor.dart';

abstract class InvestorInterface {
  Future<List<String>> getIndustryNames();
  void addInvestorProfile(String userId,Investor investor, Fund fund);
  Future<void> updateNewBusiness(String userId,Investor investor, Fund fund);
  Future<List<dynamic>> getNewBusinessDetails(String id);
}