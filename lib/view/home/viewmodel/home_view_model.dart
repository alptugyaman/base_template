import 'package:base_template/view/last/view/last_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../balance/view/balance_view.dart';
import '../../list/view/list_view.dart';

import '../../test/view/test_view.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  // @observable
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // @observable
  // FirebaseFirestore db = FirebaseFirestore.instance;

  @observable
  int currentIndex = 0;

  @observable
  List<Widget> children = [
    TestView(),
    BalanceView(),
    LitView(),
    LastView(),
  ];

  @action
  Future<void> onTabTapped(int index) async {
    currentIndex = index;
  }

  // @action
  // Future selectNotification(String? payload) async {
  //   if (payload != null) {
  //     await navigationManager
  //         .navPush(path: NavConstant.ACTIVITY_VIEW);
  //     print('payload : $payload');
  //   }
  // }

  // @action
  // Future<void> _registerNotification() async {
  //   await flutterLocalNotificationsPlugin.initialize(
  //     initializationSettings,
  //     onSelectNotification: selectNotification,
  //   );

  //   // await messaging.requestPermission(
  //   //   alert: true,
  //   //   announcement: false,
  //   //   badge: true,
  //   //   carPlay: false,
  //   //   criticalAlert: false,
  //   //   provisional: false,
  //   //   sound: true,
  //   // );

  //   FirebaseMessaging.onMessage.listen(
  //     (RemoteMessage message) {
  //       Provider.of<UINotifier>(context!, listen: false).changeNotify(true);
  //       RemoteNotification notification = message.notification!;
  //       if (Platform.isAndroid) {
  //         flutterLocalNotificationsPlugin.show(
  //           notification.hashCode,
  //           notification.title,
  //           notification.body,
  //           NotificationDetails(
  //             android: androidNotificationDetails,
  //             iOS: iosNotificationDetails(),
  //           ),
  //           payload: 'ACTIVITY_VIEW',
  //         );
  //       }
  //     },
  //   );

  //   RemoteMessage? initialMessage =
  //       await FirebaseMessaging.instance.getInitialMessage();

  //   if (initialMessage != null) {
  //     _handleMessage(initialMessage);
  //   }

  //   FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  // }

  // @action
  // Future<void> _handleMessage(RemoteMessage message) async {
  //   Provider.of<UINotifier>(context!, listen: false).changeNotify(true);
  //   await flutterLocalNotificationsPlugin.cancelAll();
  // }

  // @action
  // Future<void> _saveDeviceToken() async {
  //   String? fcmToken = await messaging.getToken();

  //   print('fcmToken - $fcmToken');

  //   if (fcmToken != null) {
  //     await getId().then((response) {
  //       var tokens = db.collection('device').doc(response.toString());
  //       tokens.set({
  //         'token': fcmToken,
  //         'createdAt': FieldValue.serverTimestamp(),
  //         'platform': Platform.operatingSystem,
  //         'operatingSystemVersion': Platform.operatingSystemVersion,
  //         'version': Platform.version,
  //         'userId': response.toString()
  //       });
  //     });
  //   }
  // }
}
