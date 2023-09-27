import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../global/helpers/permission_helper.dart';
import '../../../../../global/widgets/dialog_widget.dart';

class ImagePickerField extends StatelessWidget {
  const ImagePickerField({
    super.key,
    required this.didChangeField,
    required this.field,
  });

  final Function(String value) didChangeField;
  final FormFieldState<String> field;

  void uploadFile(XFile xfile) async {
    final fileName = '${DateTime.now().toString()}.png';
    final ref = FirebaseStorage.instance.ref().child(fileName);

    File file = File(xfile.path);

    try {
      await ref.putFile(file);
      final newPath = await ref.getDownloadURL();
      didChangeField(newPath);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  static Future<XFile?> launchImagePicker(context, ImageSource source) async {
    bool isGranted = true;

    if (source == ImageSource.camera) {
      isGranted =
          await PermissionHelper.request(PermissionTarget.camera, context);
    } else {
      isGranted =
          await PermissionHelper.request(PermissionTarget.readPhoto, context);
    }

    if (!isGranted) return null;

    try {
      final picker = ImagePicker();
      final file = await picker.pickImage(source: source);
      return file;
    } catch (e) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) {
            return DialogWidget(
              onTapNegativeButton: null,
              onTapPositiveButton: context.popRoute,
              contentText: e.toString(),
            );
          },
        );
      }
    }
    return null;
  }

  void pickAndUploadImage(
    ImageSource source,
    BuildContext context,
  ) async {
    final file = await launchImagePicker(context, source);
    if (file != null) {
      uploadFile(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return DialogWidget(
              contentText:
                  'Please chooose if you want to pick image or capture a new photo',
              onTapPositiveButton: () {
                pickAndUploadImage(ImageSource.camera, context);
              },
              onTapNegativeButton: () {
                pickAndUploadImage(ImageSource.gallery, context);
              },
              positiveButtonText: 'Camera',
              negativeButtonText: 'Gallery',
            );
          },
        );
      },
      child: InputDecorator(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 13,
          ),
          constraints: BoxConstraints(minHeight: 48),
          isDense: true,
        ),
        child: CachedNetworkImage(
          imageUrl: field.value?.toString() ?? '',
          fit: BoxFit.cover,
          errorWidget: (_, __, ___) => const SizedBox(),
        ),
      ),
    );
  }
}
