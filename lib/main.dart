import 'dart:ui';

import 'package:ahziyah_flutter/bindings/initial_binding.dart';
import 'package:ahziyah_flutter/core/helpers/route_helper.dart';
import 'package:ahziyah_flutter/services/notification_service.dart';
import 'package:ahziyah_flutter/theme/app_theme.dart';
import 'package:ahziyah_flutter/utils/hive_registrar.g.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'core/helpers/dependency_injection.dart';
import 'utils/firebase_options.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapters();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await DependencyInjection.initialize();

  if (!GetPlatform.isWindows) {
    await Get.find<NotificationService>().initialize();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(context),
      darkTheme: AppTheme.dark(context),
      themeMode: ThemeMode.system,
      defaultTransition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      getPages: RouteHelper.pages,
      initialRoute: RouteHelper.initial,
      initialBinding: InitialBinding(),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.stylus,
        },
      ),
      onInit: () async {
        await Future.delayed(
          const Duration(seconds: 1),
          () => Get.find<NotificationService>().handlePendingNotification(),
        );
      },
    );
  }
}
