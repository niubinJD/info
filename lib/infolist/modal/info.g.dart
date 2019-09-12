// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoModal _$InfoModalFromJson(Map<String, dynamic> json) {
  return InfoModal(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      account: json['account'] as String,
      password: json['password'] as String,
      description: json['description'] as String);
}

Map<String, dynamic> _$InfoModalToJson(InfoModal instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'account': instance.account,
      'password': instance.password,
      'description': instance.description
    };
