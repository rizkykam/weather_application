// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesEntity _$FavoritesEntityFromJson(Map<String, dynamic> json) =>
    FavoritesEntity(
      temp: (json['temp'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      icon: json['icon'] as String,
      cityId: json['cityId'] as num,
      name: json['name'] as String,
    );

Map<String, dynamic> _$FavoritesEntityToJson(FavoritesEntity instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'date': instance.date.toIso8601String(),
      'icon': instance.icon,
      'cityId': instance.cityId,
      'name': instance.name,
    };
