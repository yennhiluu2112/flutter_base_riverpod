import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_base_riverpod/global/models/failure/failure.dart';
import 'package:flutter_base_riverpod/global/models/post/post.dart';
import 'package:flutter_base_riverpod/global/repositories/_base_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postRepositoryProvider = Provider((ref) => _PostRepositoryImpl());

abstract class PostRepository {
  Future<Either<Failure, Unit>> create({
    required String title,
    required String content,
    required String imageUrl,
  });

  Future<Either<Failure, Unit>> update({
    required String id,
    String? title,
    String? content,
  });
}

class _PostRepositoryImpl extends BaseRepository implements PostRepository {
  final postRef =
      FirebaseFirestore.instance.collection('posts').withPostConverter();
  @override
  Future<Either<Failure, Unit>> create({
    required String title,
    required String content,
    required String imageUrl,
  }) async {
    return guardFuture(() async {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final post = Post(
        title: title,
        content: content,
        userId: userId,
        imageUrl: imageUrl,
      );
      await postRef.add(post);
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> update({
    required String id,
    String? title,
    String? content,
    String? imageUrl,
  }) {
    return guardFuture(
      () async {
        final post = (await postRef.doc(id).get()).data();
        if (post == null) throw Exception('Post not found');
        final updatePost = post.copyWith(
          title: title,
          content: content,
          imageUrl: imageUrl,
        );
        await postRef.doc(id).set(updatePost);
        return unit;
      },
    );
  }
}
