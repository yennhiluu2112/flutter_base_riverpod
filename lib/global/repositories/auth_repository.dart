import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_base_riverpod/global/models/failure.dart';
import 'package:flutter_base_riverpod/global/repositories/_base_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider((ref) => _AuthRepositoryImpl());

abstract class AuthRepository {
  Future<Either<Failure, Unit>> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> signOut();

  Future<Either<Failure, Unit>> signUpWithEmailPassword({
    required String fullName,
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> changePassword({
    required String oldPassword,
    required String newPassword,
  });
}

class _AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, Unit>> changePassword(
      {required String oldPassword, required String newPassword}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> signInWithEmailPassword({
    required String email,
    required String password,
  }) {
    return guardFuture(() async {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> signOut() {
    return guardFuture(() async {
      await firebaseAuth.signOut();
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> signUpWithEmailPassword(
      {required String fullName,
      required String email,
      required String password}) {
    return guardFuture(() async {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await firebaseAuth.currentUser?.updateDisplayName(fullName);
        await firebaseAuth.signOut();
      }

      return unit;
    });
  }
}
