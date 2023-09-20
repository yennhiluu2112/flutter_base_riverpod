// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppSettings _$$_AppSettingsFromJson(Map<String, dynamic> json) =>
    _$_AppSettings(
      locale: $enumDecodeNullable(_$AppLocaleEnumMap, json['locale']) ??
          AppLocale.auto,
      theme: $enumDecodeNullable(_$AppThemeEnumMap, json['theme']) ??
          AppTheme.auto,
      isFirstLaunch: json['isFirstLaunch'] as bool? ?? true,
    );

Map<String, dynamic> _$$_AppSettingsToJson(_$_AppSettings instance) =>
    <String, dynamic>{
      'locale': _$AppLocaleEnumMap[instance.locale]!,
      'theme': _$AppThemeEnumMap[instance.theme]!,
      'isFirstLaunch': instance.isFirstLaunch,
    };

const _$AppLocaleEnumMap = {
  AppLocale.auto: 'auto',
  AppLocale.viVN: 'viVN',
  AppLocale.enUs: 'enUs',
};

const _$AppThemeEnumMap = {
  AppTheme.auto: 'auto',
  AppTheme.light: 'light',
  AppTheme.dark: 'dark',
};
