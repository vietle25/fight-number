// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) =>
    LanguageModel(
      name: json['name'] as String,
      code: json['code'] as String,
      countryCode: json['countryCode'] as String,
      localesCode: json['localesCode'] as String,
      flag: json['flag'] as String,
    );

Map<String, dynamic> _$LanguageModelToJson(LanguageModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'countryCode': instance.countryCode,
      'localesCode': instance.localesCode,
      'flag': instance.flag,
    };
