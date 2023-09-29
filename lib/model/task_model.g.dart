// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      content: json['content'] as String?,
      type: json['type'] as String?,
      category: json['category'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  writeNotNull('type', instance.type);
  writeNotNull('category', instance.category);
  writeNotNull('lang', instance.lang);
  return val;
}
