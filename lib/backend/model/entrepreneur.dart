import 'package:pitchbox/backend/model/user.dart';

class Entrepreneur extends User {
  List<String> _professionalExperience;
  List<String>  _entrepreneurshipExperience;
  List<String>  _education;
  List<String>  _industryCertifications;
  List<String>  _awardsAchievements;
  List<String>  _trackRecord;

  Entrepreneur({
    required int uId,
    required String name,
    required String email,
    required String mobile,
    required String street,
    required String city,
    required String state,
    required String zipCode,
    required String country,
    required String industry,
    required String linkedin,
    required String twitter,
    required String facebook,
    required String instagram,
    required String website,
    required String provider,
    required String imgUrl,
    required List<String> professionalExperience,
    required List<String> entrepreneurshipExperience,
    required List<String> education,
    required List<String> industryCertifications,
    required List<String> awardsAchievements,
    required List<String> trackRecord,
  })  : _professionalExperience = professionalExperience,
        _entrepreneurshipExperience = entrepreneurshipExperience,
        _education = education,
        _industryCertifications = industryCertifications,
        _awardsAchievements = awardsAchievements,
        _trackRecord = trackRecord,
        super(
        uId: uId,
        name: name,
        email: email,
        mobile: mobile,
        street: street,
        city: city,
        state: state,
        zipCode: zipCode,
        country: country,
        industry: industry,
        linkedin: linkedin,
        twitter: twitter,
        facebook: facebook,
        instagram: instagram,
        website: website,
        provider: provider,
        imgUrl: imgUrl,
      );

  List<String> get professionalExperience => _professionalExperience;
  set professionalExperience(List<String> professionalExperience) =>
      _professionalExperience = professionalExperience;

  List<String> get entrepreneurshipExperience => _entrepreneurshipExperience;
  set entrepreneurshipExperience(List<String> entrepreneurshipExperience) =>
      _entrepreneurshipExperience = entrepreneurshipExperience;

  List<String> get education => _education;
  set education(List<String> education) => _education = education;

  List<String> get industryCertifications => _industryCertifications;
  set industryCertifications(List<String> industryCertifications) =>
      _industryCertifications = industryCertifications;

  List<String> get awardsAchievements => _awardsAchievements;
  set awardsAchievements(List<String> awardsAchievements) =>
      _awardsAchievements = awardsAchievements;

  List<String> get trackRecord => _trackRecord;
  set trackRecord(List<String> trackRecord) =>
      _trackRecord = trackRecord;
}
