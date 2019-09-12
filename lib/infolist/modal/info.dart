import 'package:json_annotation/json_annotation.dart';
part 'info.g.dart';

@JsonSerializable()
class InfoModal {
  String uuid;
  String name;
  String account;
  String password;
  String description;

  InfoModal({this.uuid, this.name, this.account, this.password, this.description});

  factory InfoModal.fromJson(Map<String, dynamic> json) =>
      _$InfoModalFromJson(json);

  Map<String, dynamic> toJson() => _$InfoModalToJson(this);

}
