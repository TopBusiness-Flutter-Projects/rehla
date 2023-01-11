import 'package:flutter/material.dart';

import '../../core/utils/app_strings.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';


class Routes {
  static const String initialRoute = '/';
  static const NavigationBottomRoute = '/NavigationBottom';
  static const String contactUsScreenRoute = '/contactUsScreen';
  static const String weightLoseScreenRoute = '/weightLoseScreen';
  static const String weightLoseResultScreenRoute = '/weightLoseResultScreen';
  static const String allPackagesScreensRoute = '/allPackagesScreens';
  static const String profileRoute = '/Profile';
}

class AppRoutes {
  static String route = '';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      // case Routes.NavigationBottomRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => NavigationBottom(),
      //   );
      // case Routes.contactUsScreenRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => ContactUsScreen(),
      //   );
      // case Routes.registerRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => RegisterScreen(),
      //   );
      // case Routes.loginRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => LoginScreen(),
      //   );
      // case Routes.forgetPasswordRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => ForgetPasswordScreen(),
      //   );
      // case Routes.checkCodeRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => CheckCodeScreen(),
      //   );
      // case Routes.newPasswordRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => NewPassword(),
      //   );
      // case Routes.weightLoseScreenRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => WeightLoseScreen(),
      //   );
      // case Routes.weightLoseResultScreenRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => WeightLoseResultScreen(),
      //   );
      // case Routes.allPackagesScreensRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => AllPackagesScreens(),
      //   );
      // case Routes.profileRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => ProfileScreen(),
      //   );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
