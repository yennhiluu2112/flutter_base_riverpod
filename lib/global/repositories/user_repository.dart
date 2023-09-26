import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_base_riverpod/global/models/failure/failure.dart';
import 'package:flutter_base_riverpod/global/repositories/_base_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user/user.dart' as u;

final userRepositoryProvider = Provider((ref) => _UserRepositoryImpl());

abstract class UserRepository {
  Future<Either<Failure, Unit>> create({
    required String id,
    required String email,
    String? fullName,
    String? photoUrl,
  });
  Future<Either<Failure, Unit>> update({
    required String id,
    String? fullName,
    String? photoUrl,
  });
}

class _UserRepositoryImpl extends BaseRepository implements UserRepository {
  final userRef =
      FirebaseFirestore.instance.collection('users').withUserConverter();
  @override
  Future<Either<Failure, Unit>> create({
    required String id,
    required String email,
    String? fullName,
    String? photoUrl,
  }) {
    return guardFuture(() async {
      final user = u.User(
        id: id,
        fullName: fullName,
        photoUrl: photoUrl,
        email: email,
      );
      await userRef.doc(id).set(user);
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> update({
    required String id,
    String? fullName,
    String? photoUrl,
  }) {
    return guardFuture(
      () async {
        final user = (await userRef.doc(id).get()).data();
        if (user == null) throw Exception('Post not found');
        final updateUser = user.copyWith(
          fullName: fullName,
          photoUrl: photoUrl,
        );
        await userRef.doc(id).set(updateUser);
        return unit;
      },
    );
  }
}
