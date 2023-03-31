import 'package:pitchbox/backend/model/user.dart';

class Entrepreneur extends User {
  String _professionalExperience;
  String _entrepreneurshipExperience;
  String _education;
  String _industryCertifications;
  String _awardsAchievements;

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
    required String provider,
    required String imgUrl,
    required String professionalExperience,
    required String entrepreneurshipExperience,
    required String education,
    required String industryCertifications,
    required String awardsAchievements,
  })  : _professionalExperience = professionalExperience,
        _entrepreneurshipExperience = entrepreneurshipExperience,
        _education = education,
        _industryCertifications = industryCertifications,
        _awardsAchievements = awardsAchievements,
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
        provider: provider,
        imgUrl: imgUrl,
      );

  String get professionalExperience => _professionalExperience;
  set professionalExperience(String professionalExperience) =>
      _professionalExperience = professionalExperience;

  String get entrepreneurshipExperience => _entrepreneurshipExperience;
  set entrepreneurshipExperience(String entrepreneurshipExperience) =>
      _entrepreneurshipExperience = entrepreneurshipExperience;

  String get education => _education;
  set education(String education) => _education = education;

  String get industryCertifications => _industryCertifications;
  set industryCertifications(String industryCertifications) =>
      _industryCertifications = industryCertifications;

  String get awardsAchievements => _awardsAchievements;
  set awardsAchievements(String awardsAchievements) =>
      _awardsAchievements = awardsAchievements;
}

