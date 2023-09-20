import 'package:flutter/material.dart';
import 'package:flutter_base_riverpod/global/utils/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(Constants.hiveDataBox);
  runApp(const ProviderScope(child: MyApp()));
}
