import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/failure.dart';

part 'app_state.freezed.dart';

enum InteractionDataType {
  get,
  create,
  update,
  delete,
}

@freezed
class AppState<T> with _$AppState<T> {
  factory AppState.initial() = _Initial;

  factory AppState.loading() = _Loading;

  factory AppState.data(T data, [InteractionDataType? type]) = _Data;

  factory AppState.error(Failure e) = _Error;
}

extension AppStateExt<T> on AppState<T> {
  bool get isLoading => whenOrNull(loading: () => true) ?? false;

  T? get data {
    return whenOrNull(
      data: (d, _) => d,
    );
  }
}
