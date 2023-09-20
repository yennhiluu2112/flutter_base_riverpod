import 'package:flutter_base_riverpod/global/models/app_settings/app_settings.dart';
import 'package:flutter_base_riverpod/global/repositories/app_settings_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appSettingsProvider =
    StateNotifierProvider<AppSettingsProvider, AppSettings>(
  (ref) => AppSettingsProvider(
    ref.watch(appSetingsRepositoryProvider),
  ),
);

class AppSettingsProvider extends StateNotifier<AppSettings> {
  AppSettingsProvider(this._appSettingsRepository)
      : super(
          _appSettingsRepository.getAppSettings().fold(
                (l) => AppSettings(),
                (r) => r,
              ),
        );

  final AppSettingsRepository _appSettingsRepository;

  Future<AppSettings?> save(AppSettings Function(AppSettings state) newState) {
    return _appSettingsRepository.save(newState(state)).then(
          (either) => either.fold(
            (l) => null,
            (r) => state = r,
          ),
        );
  }

  void reset() {
    _appSettingsRepository.reset().then(
          (either) => either.fold(
            (l) => null,
            (r) => state = r,
          ),
        );
  }
}
