
import '../model/industry.dart';

abstract class IndustryInterface {
  Future<List<Industry>> getIndustries();
  Future<List<Industry>> getIndustry(String industryName);
  Future<List<String>> getIndustryNames();
}
