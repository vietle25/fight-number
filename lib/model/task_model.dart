import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable(includeIfNull: false)
class TaskModel {
  String? content;
  String? type;
  String? category;
  String? lang;

  TaskModel({
    this.content,
    this.type,
    this.category,
    this.lang,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
