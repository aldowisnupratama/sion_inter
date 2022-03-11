import 'package:flutter/material.dart';

import 'package:sion_inter/shared/shared.dart';

import 'package:sion_inter/ui/pages/find_pages.dart';
import 'package:sion_inter/ui/pages/update_password_page.dart';

import '../../ui/ui.dart';

class AppRoute {
  AppRoute();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashPage());
      case loginScreenPath:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case biodataScreenPath:
        return MaterialPageRoute(builder: (_) => BiodataPage());

      case mainScreenPath:
        return MaterialPageRoute(builder: (_) => MainPage());
      case updatePasswordScreenPath:
        return MaterialPageRoute(builder: (_) => UpdatePasswordPage());
      case findPages:
        return MaterialPageRoute(builder: (_) => FindPages());

      default:
        return null;
    }
  }
}
