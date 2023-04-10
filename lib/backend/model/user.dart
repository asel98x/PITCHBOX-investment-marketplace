abstract class UserPro {
  int _uId;
  String _name;
  String _email;
  String _mobile;
  String _street;
  String _city;
  String _state;
  String _zipCode;
  String _country;
  String _industry;
  String _linkedin;
  String _twitter;
  String _facebook;
  String _instagram;
  String _website;
  String _provider;
  String _imgUrl;
  String _pass;

  UserPro({
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
    required String pass,
  })  : _uId = uId,
        _name = name,
        _email = email,
        _mobile = mobile,
        _street = street,
        _city = city,
        _state = state,
        _zipCode = zipCode,
        _country = country,
        _industry = industry,
        _linkedin = linkedin,
        _twitter = twitter,
        _facebook = facebook,
        _instagram = instagram,
        _website = website,
        _provider = provider,
        _imgUrl = imgUrl,
        _pass = pass;

  int get uId => _uId;
  set uId(int uId) => _uId = uId;

  String get name => _name;
  set name(String name) => _name = name;

  String get email => _email;
  set email(String email) => _email = email;

  String get mobile => _mobile;
  set mobile(String mobile) => _mobile = mobile;

  String get street => _street;
  set street(String street) => _street = street;

  String get city => _city;
  set city(String city) => _city = city;

  String get state => _state;
  set state(String state) => _state = state;

  String get zipCode => _zipCode;
  set zipCode(String zipCode) => _zipCode = zipCode;

  String get country => _country;
  set country(String country) => _country = country;

  String get industry => _industry;
  set industry(String industry) => _industry = industry;

  String get linkedin => _linkedin;
  set linkedin(String linkedin) => _linkedin = linkedin;

  String get twitter => _twitter;
  set twitter(String twitter) => _twitter = twitter;

  String get facebook => _facebook;
  set facebook(String facebook) => _facebook = facebook;

  String get instagram => _instagram;
  set instagram(String instagram) => _instagram = instagram;

  String get website => _website;
  set website(String website) => _website = website;

  String get provider => _provider;
  set provider(String provider) => _provider = provider;

  String get imgUrl => _imgUrl;
  set imgUrl(String imgUrl) => _imgUrl = imgUrl;

  String get pass => _pass;
  set pass(String pass) => _pass = pass;
}
