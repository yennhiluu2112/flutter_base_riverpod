import 'package:flutter/material.dart';
import 'package:flutter_base_riverpod/global/models/post/post.dart';

import '../../../../../../global/themes/app_colors.dart';

import '../../../../global/models/user/user.dart';
import '../../../../global/widgets/shimmer_image.dart';

class PostTile extends StatelessWidget {
  const PostTile({
    super.key,
    required this.post,
    required this.user,
  });

  final Post post;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ShimmerImage(
                  imageUrl: user.photoUrl ?? '',
                  width: 35,
                  height: 35,
                  borderRadius: BorderRadius.circular(100),
                  errorWidget: const Icon(
                    Icons.account_circle_rounded,
                    size: 35,
                    color: AppColors.primary600,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  user.email ?? '',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ShimmerImage(
                fit: BoxFit.cover,
                imageUrl: post.imageUrl ?? '',
                height: 200,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              post.title ?? '',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Text(
              post.content ?? '',
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  Icons.favorite,
                  color: AppColors.error,
                ),
                const SizedBox(width: 4),
                Text(
                  '${post.likes}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: PostActionTile(
                    onTap: () {},
                    label: 'Like',
                    icon: Icons.favorite_border,
                  ),
                ),
                Expanded(
                  child: PostActionTile(
                    onTap: () {},
                    label: 'Comment',
                    icon: Icons.message,
                  ),
                ),
                Expanded(
                  child: PostActionTile(
                    onTap: () {},
                    label: 'Share',
                    icon: Icons.share,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PostActionTile extends StatelessWidget {
  const PostActionTile({
    super.key,
    required this.onTap,
    required this.label,
    required this.icon,
  });

  final VoidCallback onTap;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(label),
          ],
        ),
      ),
    );
  }
}
