// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_feed_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsFeedVO _$NewsFeedVOFromJson(Map<String, dynamic> json) => NewsFeedVO(
      json['id'] as int?,
      json['description'] as String?,
      json['file'] as String?,
      json['profile'] as String?,
      json['user_name'] as String?,
    );

Map<String, dynamic> _$NewsFeedVOToJson(NewsFeedVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'file': instance.file,
      'profile': instance.profile,
      'user_name': instance.userName,
    };
