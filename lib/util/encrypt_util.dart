import 'package:flutter_string_encryption/flutter_string_encryption.dart';
import 'package:shared_preferences/shared_preferences.dart';
class EncryptUtil {
  static final _cryptor = new PlatformStringCryptor();
  static final _key = 'key';
  //// 加密
  static Future<String> encrypt(String data) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String pass = await _cryptor.generateRandomKey();
    prefs.setString(_key, pass);
    return await _cryptor.encrypt(data, pass);
  }
  //// 解密
  static Future<String> decrypt(String data) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String pass = prefs.getString(_key);
    if (pass == null) {
      throw new Exception('无法解密');
    }
    return await _cryptor.decrypt(data, pass);
  }
}