import 'package:dartz/dartz.dart';
import 'package:flutter_base_riverpod/global/repositories/auth_repository.dart';
import 'package:flutter_base_riverpod/global/utils/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsProvider =
    StateNotifierProvider.autoDispose<SettingsProvider, AppState<Unit>>(
  (ref) => SettingsProvider(ref),
);

class SettingsProvider extends StateNotifier<AppState<Unit>> {
  SettingsProvider(this.ref) : super(AppState.initial());
  final Ref ref;
  late final authRepository = ref.watch(authRepositoryProvider);

  void signOut() {
    state = AppState.loading();

    authRepository.signOut().then(
          (either) => either.fold(
            (l) => state = AppState.error(l),
            (r) => state = AppState.data(r),
          ),
        );
  }
}
