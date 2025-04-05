import 'package:get_storage/get_storage.dart';

class TokenService {
  static final _box = GetStorage();

  static String? get accessToken => _box.read('accessToken');
  static String? get refreshToken => _box.read('refreshToken');

  static void saveTokens(String access, String refresh) {
    _box.write('accessToken', access);
    _box.write('refreshToken', refresh);
  }

  static void clearTokens() {
    _box.remove('accessToken');
    _box.remove('refreshToken');
  }
}
