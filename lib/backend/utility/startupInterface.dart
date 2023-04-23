import 'package:pitchbox/backend/model/businessModel.dart';

abstract class BusinessInterface {
  void addNewBusiness(Business business);
  Future<List<Business>> getNewBusinessesList();
  Future<List<Business>> getNewBusinessesListINT();
  Future<List<Business>> getNewBusinessesListEUN(String id);
  Future<void> updateNewBusiness(Business business);
}