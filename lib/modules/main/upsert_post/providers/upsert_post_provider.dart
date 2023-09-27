import 'package:dartz/dartz.dart';
import 'package:flutter_base_riverpod/global/repositories/post_repository.dart';
import 'package:flutter_base_riverpod/global/utils/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpsertPostProvider extends StateNotifier<AppState<Unit>> {
  UpsertPostProvider(this.ref) : super(AppState.initial());

  final Ref ref;

  late final postRepository = ref.watch(postRepositoryProvider);

  void createPost({
    required String title,
    required String content,
    required String imageUrl,
  }) {
    postRepository
        .create(
          content: content,
          imageUrl: imageUrl,
          title: title,
        )
        .then(
          (either) => either.fold(
            (l) => state = AppState.error(l),
            (r) => state = AppState.data(r),
          ),
        );
  }

  void updatePost({
    required String id,
    String? content,
    String? imageUrl,
    String? title,
  }) {
    postRepository
        .update(
          id: id,
          title: title,
          content: content,
          imageUrl: imageUrl,
        )
        .then(
          (either) => either.fold(
            (l) => state = AppState.error(l),
            (r) => state = AppState.data(r),
          ),
        );
  }
}
