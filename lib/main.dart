import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/routes/app_pages.dart';
import 'package:treinar_app/app/shared/themes/app_theme.dart';

import 'app/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertinoDialog,
      getPages: AppPages.pages,
      initialRoute: Routes.INITIAL,
      theme: appTheme,
      // initialBinding: SplashBinding(),
    );
  }
}
