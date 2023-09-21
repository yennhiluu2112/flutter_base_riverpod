import 'package:dartz/dartz.dart';
import 'package:flutter_base_riverpod/global/repositories/auth_repository.dart';
import 'package:flutter_base_riverpod/global/utils/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInProvider =
    StateNotifierProvider.autoDispose<SignInProvider, AppState>(
  (ref) => SignInProvider(ref),
);

class SignInProvider extends StateNotifier<AppState<Unit>> {
  SignInProvider(this.ref) : super(AppState.initial());

  final Ref ref;
  late final authRepository = ref.watch(authRepositoryProvider);

  void signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    state = AppState.loading();

    authRepository
        .signInWithEmailPassword(email: email, password: password)
        .then(
          (either) => either.fold(
            (l) => state = AppState.error(l),
            (r) => state = AppState.data(r),
          ),
        );
  }
}
