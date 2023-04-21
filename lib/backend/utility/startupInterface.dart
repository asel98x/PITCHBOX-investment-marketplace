import 'package:pitchbox/backend/model/businessModel.dart';

abstract class BusinessInterface {
  void addNewBusiness(Business business);
  Future<List<Business>> getNewBusinessesList();
}