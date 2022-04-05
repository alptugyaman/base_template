import 'package:base_template/core/constant/app/app_constants.dart';
import 'package:base_template/core/init/language/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'core/component/system_ui_overlay/system_ui_overlay.dart';
import 'core/init/cache/cache_manager.dart';
import 'core/init/navigation/navigation_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'view/home/view/home_view.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// }

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('@mipmap/winmie');

// const IOSInitializationSettings initializationSettingsIOS =
//     IOSInitializationSettings(
//   requestSoundPermission: false,
//   requestBadgePermission: false,
//   requestAlertPermission: false,
//   onDidReceiveLocalNotification: onDidReceiveLocalNotification,
// );

// final InitializationSettings initializationSettings = InitializationSettings(
//   android: initializationSettingsAndroid,
//   iOS: initializationSettingsIOS,
//   macOS: null,
// );

// Future onDidReceiveLocalNotification(
//     int? id, String? title, String? body, String? payload) async {
//   print('onDidReceiveLocalNotification');
// }

// AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'winmie',
//   'Android Notifications',
//   'This channel is used for notifications.',
//   importance: Importance.high,
//   playSound: true,
//   enableVibration: true,
//   sound: RawResourceAndroidNotificationSound('winmie_android_sound'),
// );

// var androidNotificationDetails = AndroidNotificationDetails(
//     channel.id, channel.name, channel.description,
//     color: Colors.blue,
//     playSound: true,
//     icon: '@mipmap/winmie',
//     enableLights: true);

// IOSNotificationDetails iosNotificationDetails() {
//   return IOSNotificationDetails(
//     presentAlert: true,
//     presentBadge: true,
//     presentSound: true,
//     sound: 'winmie_ios_sound.caf',
//     threadIdentifier: 'Winmie',
//   );
// }

Future<void> main() async {
  await _init();

  runApp(
    MultiProvider(
      providers: [
        ...ApplicationProvider.provider().dependItems,
        // ...ApplicationProvider.instance.uiChangesItems,
      ],
      child: EasyLocalization(
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: AppConstant.LANGUAGE_PATH,
        child: MyApp(),
      ),
    ),
  );

  SystemChrome.setSystemUIOverlayStyle(lightSystemUiOverlayStyle);
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await _firebaseConfig();
  await EasyLocalization.ensureInitialized();
  await CacheManager.instance.prefencesInit();
}

// Future<void> _firebaseConfig() async {
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<∏
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);

//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = context.watch<ThemeNotifier>().currentTheme;
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          builder: (context, child) => _mediaQuery(context, child),
          home: HomeView(),
          theme: _theme,
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          navigatorKey: NavigationManager.instance.navigatorKey,
          // localizationsDelegates: _localizationsDelegates,
          // supportedLocales: const [Locale('tr', 'TR')],
          // locale: const Locale('tr', 'TR'),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }

  MediaQuery _mediaQuery(BuildContext context, Widget? child) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: child!,
    );
  }

  // List<LocalizationsDelegate<dynamic>> get _localizationsDelegates {
  //   return const [
  //     GlobalMaterialLocalizations.delegate,
  //     GlobalWidgetsLocalizations.delegate,
  //     GlobalCupertinoLocalizations.delegate,
  //     DefaultCupertinoLocalizations.delegate,
  //   ];
  // }
}
