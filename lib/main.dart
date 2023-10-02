import 'package:fight_number/firebase_options.dart';
import 'package:fight_number/locales/app_translations.dart';
import 'package:fight_number/locales/languages.dart';
import 'package:fight_number/router/app_route.dart';
import 'package:fight_number/styles/app_theme.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:fight_number/values/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setupLogging();
  await Utils.getLocaleLanguageApp();
  configLoading();
  runApp(MyApp());
}

/// Setup log
void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

/// Config loading
void configLoading() => EasyLoading.instance
  ..displayDuration = const Duration(milliseconds: 2000)
  ..indicatorType = EasyLoadingIndicatorType.ring
  ..loadingStyle = EasyLoadingStyle.custom
  ..indicatorSize = 40.0
  ..radius = 10.0
  ..progressColor = AppColors.primary
  ..backgroundColor = AppColors.transparent
  ..indicatorColor = AppColors.primary
  ..textColor = AppColors.primary
  ..maskColor = AppColors.blue.withOpacity(0.5)
  ..userInteractions = true
  ..dismissOnTap = false;

class MyApp extends StatelessWidget {
  getInitialRoute() {
    return AppRoute.splash;
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: GetMaterialApp(
              title: 'Flutter base',
              debugShowCheckedModeBanner: false,
              defaultTransition: Transition.rightToLeft,
              transitionDuration: const Duration(milliseconds: 200),
              getPages: AppRoute.route,
              initialRoute: getInitialRoute(),
              translations: AppTranslations(),
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.system,
              builder: EasyLoading.init(),
              routingCallback: (routing) {},
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale(Language.English, ''),
                Locale(Language.Vietnamese, ''),
              ],
            ),
          );
        },
      );
    });
  }
}
