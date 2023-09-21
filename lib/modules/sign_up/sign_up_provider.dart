import 'package:dartz/dartz.dart';
import 'package:flutter_base_riverpod/global/repositories/auth_repository.dart';
import 'package:flutter_base_riverpod/global/utils/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpProvider = StateNotifierProvider<SignUpProvider, AppState<Unit>>(
  (ref) => SignUpProvider(ref),
);

class SignUpProvider extends StateNotifier<AppState<Unit>> {
  SignUpProvider(this.ref) : super(AppState.initial());

  final Ref ref;
  late final authRepository = ref.watch(authRepositoryProvider);

  void signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
  }) {
    state = AppState.loading();

    authRepository
        .signUpWithEmailPassword(
          fullName: fullName,
          email: email,
          password: password,
        )
        .then(
          (either) => either.fold(
            (l) => state = AppState.error(l),
            (r) => state = AppState.data(r),
          ),
        );
  }
}
