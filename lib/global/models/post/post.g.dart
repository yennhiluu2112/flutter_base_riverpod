// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      title: json['title'] as String?,
      content: json['content'] as String?,
      userId: json['userId'] as String?,
      imageUrl: json['imageUrl'] as String?,
      likes: json['likes'] as int? ?? 0,
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'userId': instance.userId,
      'imageUrl': instance.imageUrl,
      'likes': instance.likes,
    };
