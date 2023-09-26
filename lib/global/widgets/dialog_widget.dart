import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    this.titleText,
    this.contentText,
    this.title,
    this.content,
    this.positiveButtonText,
    this.onTapPositiveButton,
    this.negativeButtonText,
    this.onTapNegativeButton,
    this.image,
  });

  final String? titleText;
  final String? contentText;
  final Widget? title;
  final Widget? content;
  final String? positiveButtonText;
  final VoidCallback? onTapPositiveButton;
  final String? negativeButtonText;
  final VoidCallback? onTapNegativeButton;
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      surfaceTintColor: AppColors.white,
      insetPadding: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (image != null) ...[
              image!,
              const SizedBox(height: 16),
            ],
            if (titleText != null)
              Text(
                titleText ?? '',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )
            else if (title != null)
              title!,
            if (contentText != null)
              Text(
                contentText ?? '',
                textAlign: TextAlign.center,
              )
            else if (content != null)
              content!,
            const SizedBox(height: 32),
            Row(
              children: [
                if (onTapNegativeButton != null) ...[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onTapNegativeButton,
                      child: Text(
                        negativeButtonText ?? 'Cancel',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: ElevatedButton(
                    onPressed: onTapPositiveButton,
                    child: Text(
                      positiveButtonText ?? 'OK',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
