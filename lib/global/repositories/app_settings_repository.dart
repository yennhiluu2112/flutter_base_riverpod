import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_base_riverpod/global/repositories/_base_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/app_settings/app_settings.dart';
import '../models/failure/failure.dart';
import '../utils/constants.dart';

final appSetingsRepositoryProvider = Provider(
  (ref) {
    return _AppSettingsRepositoryImpl(
      Hive.box<String>(Constants.hiveDataBox),
    );
  },
);

abstract class AppSettingsRepository {
  Either<Failure, AppSettings> getAppSettings();
  Future<Either<Failure, AppSettings>> save(AppSettings appSettings);

  Future<Either<Failure, AppSettings>> reset();
}

class _AppSettingsRepositoryImpl extends BaseRepository
    implements AppSettingsRepository {
  _AppSettingsRepositoryImpl(this.box);

  final Box<String> box;
  final String key = Constants.hiveAppSettingsKey;

  @override
  Either<Failure, AppSettings> getAppSettings() {
    return guard(() {
      final savedAppSettings = box.get(key);
      if (savedAppSettings != null) {
        return AppSettings.fromJson(jsonDecode(savedAppSettings));
      }
      return AppSettings();
    });
  }

  @override
  Future<Either<Failure, AppSettings>> reset() {
    return guardFuture(() async {
      final appSettings = AppSettings();
      box.put(
        key,
        jsonEncode(appSettings.toJson()),
      );
      return appSettings;
    });
  }

  @override
  Future<Either<Failure, AppSettings>> save(AppSettings appSettings) {
    return guardFuture(() async {
      box.put(
        key,
        jsonEncode(appSettings.toJson()),
      );
      return appSettings;
    });
  }
}
