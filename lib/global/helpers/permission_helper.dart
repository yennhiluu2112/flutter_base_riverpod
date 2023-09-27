import 'package:app_settings/app_settings.dart' as settings;
import 'package:auto_route/auto_route.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../widgets/dialog_widget.dart';

enum PermissionTarget { camera, readPhoto, writePhoto, storage }

class PermissionHelper {
  const PermissionHelper._();

  static Future<bool> request(
    PermissionTarget target,
    BuildContext? context,
  ) async {
    try {
      final permission = await getPermission(target);
      final status = await permission.status;
      switch (status) {
        case PermissionStatus.granted:
        case PermissionStatus.limited:
          return true;
        case PermissionStatus.denied:
          final requestStatus = await permission.request();
          if (requestStatus == PermissionStatus.permanentlyDenied &&
              TargetPlatform.android == defaultTargetPlatform) {
            showDialogOpenSettings(context!, target);
          }
          return requestStatus.isGranted;
        case PermissionStatus.restricted:
        case PermissionStatus.permanentlyDenied:
          if (context != null && context.mounted) {
            showDialogOpenSettings(context, target);
          }
          return false;
        case PermissionStatus.provisional:
          return false;
      }
    } catch (_) {
      return false;
    }
  }

  static Future<Permission> getPermission(PermissionTarget target) async {
    switch (target) {
      case PermissionTarget.camera:
        return Permission.camera;
      case PermissionTarget.storage:
        return Permission.storage;
      case PermissionTarget.writePhoto:
        if (TargetPlatform.android == defaultTargetPlatform) {
          if (((await DeviceInfoPlugin().androidInfo).version.sdkInt) <= 32) {
            return Permission.storage;
          } else {
            return Permission.photos;
          }
        } else {
          return Permission.photosAddOnly;
        }
      case PermissionTarget.readPhoto:
        if (TargetPlatform.android == defaultTargetPlatform &&
            ((await DeviceInfoPlugin().androidInfo).version.sdkInt) <= 32) {
          return Permission.storage;
        } else {
          return Permission.photos;
        }
    }
  }

  static Future<bool> writeFile() async {
    var isPhotosGranted = false;

    isPhotosGranted = await Permission.storage.request().isGranted;

    return isPhotosGranted;
  }

  static void showDialogOpenSettings(
    BuildContext context,
    PermissionTarget target,
  ) {
    var message = '';

    switch (target) {
      case PermissionTarget.camera:
        message = 'Please allow app to access camera';
        break;
      case PermissionTarget.readPhoto:
        message = 'Please allow app to access photo';
        break;
      case PermissionTarget.writePhoto:
        message = 'Please allow app to write photo';
        break;

      default:
    }

    showDialog(
      context: context,
      builder: (context) {
        return DialogWidget(
          titleText: 'Music App',
          contentText: message,
          onTapPositiveButton: () {
            Future.delayed(
              const Duration(milliseconds: 150),
              () {
                settings.AppSettings.openAppSettings();
              },
            );
            context.popRoute();
          },
        );
      },
    );
  }
}
