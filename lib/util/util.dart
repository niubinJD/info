import 'package:uuid/uuid.dart';
class Util {
  static String generateUuid() {
    return new Uuid().v1();
  }
}