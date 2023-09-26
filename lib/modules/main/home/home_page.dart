import 'package:auto_route/auto_route.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_riverpod/global/models/user/user.dart';
import 'package:flutter_base_riverpod/global/repositories/auth_repository.dart';
import 'package:flutter_base_riverpod/global/repositories/post_repository.dart';
import 'package:flutter_base_riverpod/global/themes/app_colors.dart';
import 'package:flutter_base_riverpod/modules/main/home/widgets/post_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postRepositoryProvider);
    final currentUser =
        ref.watch(authRepositoryProvider).firebaseAuth.currentUser;
    return Scaffold(
      backgroundColor: AppColors.greyG400.withOpacity(0.3),
      body: SafeArea(
        child: FirestoreQueryBuilder(
            query: state.postRef.where('userId', isEqualTo: currentUser!.uid),
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
                    user: User(
                      email: currentUser.email,
                      photoUrl: currentUser.photoURL,
                      fullName: currentUser.displayName,
                      id: currentUser.uid,
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
