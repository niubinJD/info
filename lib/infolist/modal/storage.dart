import 'package:json_annotation/json_annotation.dart';
import 'package:infos/infolist/modal/info.dart';
part 'storage.g.dart';

@JsonSerializable()
class Storage {
  DateTime date;
  List<InfoModal> data;

  Storage({this.date, this.data});

  factory Storage.fromJson(Map<String, dynamic> json) =>
      _$StorageFromJson(json);

  Map<String, dynamic> toJson() => _$StorageToJson(this);
}