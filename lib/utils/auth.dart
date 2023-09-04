import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:seckill_deal/navigation/routes.dart';
import 'package:seckill_deal/utils/token_storage.dart';

class Auth {
  Auth._internal();

  static final Auth _singleton = Auth._internal();

  factory Auth() {
    return _singleton;
  }

  String authToken = '';

  bool get isAuthenticated {
    return authToken.isNotEmpty;
  }

  void logout() {
    authToken = '';
    tokenStorage.delete();
    Get.toNamed(Routes.login);
  }

  Future<void> loadAuthToken() async {
    authToken = await tokenStorage.get();
  }
}

final auth = Auth();
