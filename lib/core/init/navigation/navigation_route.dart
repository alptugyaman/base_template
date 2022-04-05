import 'package:flutter/material.dart';

import '../../../view/auth/login/view/login_view.dart';
import '../../../view/auth/register/view/register_view.dart';
import '../../../view/auth/splash/view/splash_view.dart';
import '../../../view/auth/welcome/view/welcome_view.dart';
import '../../../view/home/view/home_view.dart';
import '../../component/scaffold/no_network.dart';
import '../../component/scaffold/not_found_scaffold.dart';
import '../../constant/navigation/navigation_constants.dart';
import 'navigation_animation.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {

      //*       BASE      //
      case NavConstant.NO_NETWORK_VIEW:
        return defaultNavigate(const NoNetworkScaffold());

      //!      AUTH      //
      case NavConstant.SPLASH_VIEW:
        return defaultNavigate(SplashView());
      case NavConstant.WELCOME_VIEW:
        return defaultNavigate(WelcomeView());
      case NavConstant.LOGIN_VIEW:
        return defaultNavigate(LoginView());
      case NavConstant.REGISTER_VIEW:
        return defaultNavigate(RegisterView());

      //?       BASE      //
      case NavConstant.HOME_VIEW:
        return defaultNavigate(HomeView());

      //*       DEFAULT      //
      default:
        return defaultNavigate(const NotFoundScaffold());
    }
  }

  MaterialPageRoute defaultNavigate(Widget widget) =>
      MaterialPageRoute(builder: (context) => widget);

  MaterialPageRoute leftToRightNavigate(Widget widget) =>
      LeftToRight(builder: (context) => widget);

  MaterialPageRoute rightToLeftNavigate(Widget widget) =>
      RightToLeft(builder: (context) => widget);

  MaterialPageRoute fadeRouteNavigateInstant(Widget widget) =>
      FadeRouteInstant(builder: (context) => widget);

  MaterialPageRoute fadeRouteNavigateDelay(Widget widget) =>
      FadeRouteWithDelay(builder: (context) => widget);
}
