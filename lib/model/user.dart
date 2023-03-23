abstract class User {
  int _uId;
  String _name;
  String _email;
  String _provider;
  String _imgUrl;

  User({
    required int uId,
    required String name,
    required String email,
    required String provider,
    required String imgUrl,
  })  : _uId = uId,
        _name = name,
        _email = email,
        _provider = provider,
        _imgUrl = imgUrl;

  int get uId => _uId;
  set uId(int uId) => _uId = uId;

  String get name => _name;
  set name(String name) => _name = name;

  String get email => _email;
  set email(String email) => _email = email;

  String get provider => _provider;
  set provider(String provider) => _provider = provider;

  String get imgUrl => _imgUrl;
  set imgUrl(String imgUrl) => _imgUrl = imgUrl;
}
