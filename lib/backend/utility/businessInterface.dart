import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pitchbox/backend/model/business.dart';
import 'package:pitchbox/backend/model/entrepreneur.dart';
import 'package:pitchbox/backend/model/fund.dart';
import 'package:pitchbox/backend/model/team.dart';

abstract class BusinessInterface {
  void addNewBusiness(Entrepreneur entrepreneur, Business business, Fund fund);
  Future<List<Business>> getNewBusinessesList();
  Future<void> deleteBusiness(String businessId);
}