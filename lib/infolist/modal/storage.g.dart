// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Storage _$StorageFromJson(Map<String, dynamic> json) {
  return Storage()
    ..date =
        json['date'] == null ? null : DateTime.parse(json['date'] as String)
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : InfoModal.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$StorageToJson(Storage instance) => <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'data': instance.data
    };
