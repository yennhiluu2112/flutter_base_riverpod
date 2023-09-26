import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_base_riverpod/global/repositories/auth_repository.dart';
import 'package:flutter_base_riverpod/global/repositories/user_repository.dart';
import 'package:flutter_base_riverpod/global/utils/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpProvider =
    StateNotifierProvider<SignUpProvider, AppState<UserCredential>>(
  (ref) => SignUpProvider(ref),
);

class SignUpProvider extends StateNotifier<AppState<UserCredential>> {
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
            (r) {
              ref
                  .watch(userRepositoryProvider)
                  .create(
                    id: r.user!.uid,
                    email: email,
                    fullName: fullName,
                  )
                  .then(
                    (either) => either.fold(
                      (l) => state = AppState.error(l),
                      (r) => state,
                    ),
                  );
              state = AppState.data(r);
            },
          ),
        );
  }
}
