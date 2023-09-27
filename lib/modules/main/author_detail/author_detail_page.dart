import 'package:auto_route/auto_route.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_riverpod/global/models/user/user.dart';
import 'package:flutter_base_riverpod/global/repositories/post_repository.dart';
import 'package:flutter_base_riverpod/global/themes/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home/widgets/post_tile.dart';

@RoutePage()
class AuthorDetailPage extends ConsumerStatefulWidget {
  const AuthorDetailPage({
    required this.user,
    super.key,
  });

  final User user;

  @override
  ConsumerState<AuthorDetailPage> createState() => _AuthorDetailPageState();
}

class _AuthorDetailPageState extends ConsumerState<AuthorDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPost,
      appBar: AppBar(),
      body: SafeArea(
        child: FirestoreQueryBuilder(
          query: ref.watch(postRepositoryProvider).postRef.where(
                'userId',
                isEqualTo: widget.user.id,
              ),
          builder: (context, snapshot, child) {
            if (snapshot.isFetching) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.separated(
              itemCount: snapshot.docs.length,
              padding: const EdgeInsets.all(16),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final post = snapshot.docs[index].data();
                return PostTile(
                  post: post,
                  user: widget.user,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
