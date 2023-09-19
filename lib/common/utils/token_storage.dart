import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  TokenStorage._internal();

  static final TokenStorage _singleton = TokenStorage._internal();
  final storage = const FlutterSecureStorage();

  factory TokenStorage() {
    return _singleton;
  }

  Future<void> set(String value) async {
    await storage.write(key: _key, value: value);
  }

  Future<String> get() async {
    return await storage.read(key: _key) ?? '';
  }

  Future<void> delete() async {
    await storage.delete(key: _key);
  }
}

const _key = 'loginToken';
final tokenStorage = TokenStorage();
