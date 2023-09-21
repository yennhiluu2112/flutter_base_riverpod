import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../gen/strings.g.dart';
import '../../enums/app_theme.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed
class AppSettings with _$AppSettings {
  factory AppSettings({
    @Default(AppLocale.en) AppLocale locale,
    @Default(AppTheme.auto) AppTheme theme,
    @Default(true) bool isFirstLaunch,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}
