import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:infos/infolist/modal/info.dart';
import 'package:infos/infolist/modal/storage.dart';
import 'encrypt_util.dart';
import 'dart:convert';
class StorageService {
  Future<File> file;
  static final StorageService _instance = StorageService._internal();

  void _init() async{
    file = _getLocalFile();
    Future<bool> exist = (await file).exists();
    if (!(await exist)) {
      file = (await file).create();
    }
  }

  Future<File> _getLocalFile() async {
    // 获取应用目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/infos.txt');
  }

  Future<Null> saveData(List<InfoModal> data) async {
    var getStorageData = _getStorageData(data);
    var infos = EncryptUtil.encrypt(json.encode(getStorageData.toJson()).toString());
    // 将点击次数以字符串类型写到文件中
    infos.then((value){
      _save(value);
    });
  }

  void _save(String str) async{
    (await file).writeAsString('$str');
  }
  Future<String> readData() async {
    // 将点击次数以字符串类型写到文件中
    var exists = (await file).exists();
    if (!(await exists)) {
      return new Future((){
        return '';
      });
    }
    return (await file).readAsString();
  }

  factory StorageService() {
    return _instance;
  }

  StorageService._internal() {
    _init();
  }

  Storage _getStorageData(List<InfoModal> data) {
    return Storage(date: new DateTime.now(),data: data);
  }
}
