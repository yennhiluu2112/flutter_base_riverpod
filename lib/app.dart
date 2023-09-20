import 'package:flutter/material.dart';
import 'package:flutter_base_riverpod/global/providers/app_settings_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'global/routers/app_router.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  final _appRouter = AppRouter();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Base Riverpod',
      debugShowCheckedModeBanner: false,
      theme: ref.watch(appSettingsProvider).theme.toThemeData(),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
