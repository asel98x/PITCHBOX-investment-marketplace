import 'package:pitchbox/backend/model/mainUser.dart';
import 'package:pitchbox/backend/service/userService.dart';

class UserController {
  final _userService = UserService();
  

  Future<void> addEntrepreneur({
    required String userId,
    required String userName,
    required String userEmail,
    required String userPassword,
    required String userType,
  })async {
    final mainUser = MainUser(
        userId: userId,
        userName: userName,
        userEmail: userEmail,
        userPassword: userPassword,
        userType: userType);

    await _userService.addEntrepreneur(mainUser);
  }


  Future<void> addInvestor({
    required String userId,
    required String userName,
    required String userEmail,
    required String userPassword,
    required String userType,
  })async {
    final mainUser = MainUser(
        userId: userId,
        userName: userName,
        userEmail: userEmail,
        userPassword: userPassword,
        userType: userType);

    await _userService.addInvestor(mainUser);
  }

  Future<List<MainUser>> getUserDetails(String id) async {
    return await _userService.getUserDetails(id);
  }
}