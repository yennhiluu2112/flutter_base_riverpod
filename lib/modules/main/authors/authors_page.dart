import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_riverpod/global/repositories/user_repository.dart';
import 'package:flutter_base_riverpod/global/routers/app_router.dart';
import 'package:flutter_base_riverpod/global/themes/app_colors.dart';
import 'package:flutter_base_riverpod/global/widgets/shimmer_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AuthorsPage extends ConsumerStatefulWidget {
  const AuthorsPage({super.key});

  @override
  ConsumerState<AuthorsPage> createState() => _AuthorsPageState();
}

class _AuthorsPageState extends ConsumerState<AuthorsPage> {
  late final userProvider = ref.watch(userRepositoryProvider);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authors'),
      ),
      body: FirestoreQueryBuilder(
        query: userProvider.userRef,
        builder: (context, snapshot, child) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: snapshot.docs.length,
            itemBuilder: (context, index) {
              final data = snapshot.docs[index];
              final user = data.data();

              if (data.id == FirebaseAuth.instance.currentUser!.uid) {
                return const SizedBox();
              }

              return GestureDetector(
                onTap: () {
                  context.router.push(AuthorDetailRoute(user: user));
                },
                child: Row(
                  children: [
                    ShimmerImage(
                      imageUrl: user.photoUrl ?? '',
                      borderRadius: BorderRadius.circular(100),
                      width: 70,
                      height: 70,
                      errorWidget: const Icon(
                        Icons.account_circle_rounded,
                        size: 70,
                        color: AppColors.primary600,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.fullName ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Text(
                          user.email ?? '',
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              if (snapshot.docs[index].id ==
                  FirebaseAuth.instance.currentUser!.uid) {
                return const SizedBox();
              }
              return const Divider();
            },
          );
        },
      ),
    );
  }
}
