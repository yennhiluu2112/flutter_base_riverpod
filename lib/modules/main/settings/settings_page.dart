import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_riverpod/global/routers/app_router.dart';
import 'package:flutter_base_riverpod/global/utils/app_state.dart';
import 'package:flutter_base_riverpod/global/widgets/loading_overlay.dart';
import 'package:flutter_base_riverpod/modules/main/settings/settings_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  late final provider = ref.watch(settingsProvider.notifier);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(settingsProvider);

    ref.listen(
      settingsProvider,
      (_, next) {
        next.whenOrNull(
          data: (data, _) {
            context.router.replaceAll([const SignInRoute()]);
          },
          error: (e) => print(e),
        );
      },
    );
    return LoadingOverlay(
      loading: state.isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              provider.signOut();
            },
            child: const Text('Sign Out'),
          ),
        ),
      ),
    );
  }
}
