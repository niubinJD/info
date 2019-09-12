import 'package:infos/infolist/modal/info.dart';
import 'storage_service.dart';
class SharedService {
  List<InfoModal> _data = [];
  static final SharedService _instance = SharedService._internal();
  
  updateItem(InfoModal info) {
    int index = _data.indexWhere((value) => value.uuid == info.uuid);
    _data[index] = info;
    new StorageService().saveData(_data);
  }
  addItem(InfoModal info) {
    _data.add(info);
    new StorageService().saveData(_data);
  }
  remove(String uuid) {
    int index = _data.indexWhere((value) => value.uuid == uuid);
    if (index == -1) {
      return;
    }
    _data.removeAt(index);
    new StorageService().saveData(_data);
  }
  List<InfoModal> get data => _data;

  set data(List<InfoModal> value) {
    _data = value;
  }

  factory SharedService() {
    return _instance;
  }
  SharedService._internal();
}