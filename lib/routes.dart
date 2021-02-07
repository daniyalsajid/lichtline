import 'package:lichtline/screens/auth/login_screen.dart';
import 'package:lichtline/screens/auth/signup_screen.dart';
import 'package:lichtline/screens/home/bottom_bar_screen.dart';
import 'package:lichtline/screens/home/menu_selection_screen.dart';
import 'package:lichtline/screens/input_readings/input_screen.dart';
import 'package:flutter/material.dart';
import 'package:lichtline/splash_screen.dart';
import 'constants/routes/routes_constants.dart';

onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case RouteConstants.splashScreen:
      return MaterialPageRoute(
        builder: (_) => SplashScreen(),
      );
    case RouteConstants.login:
      return MaterialPageRoute(
        builder: (_) => LoginScreen(),
      );
    case RouteConstants.signup:
      return MaterialPageRoute(
        builder: (_) => SignupScreen(),
      );
    case RouteConstants.bottomBarScreen:
      return MaterialPageRoute(
        builder: (_) => BottomBarScreen(),
      );
    case RouteConstants.inputScreen:
      return MaterialPageRoute(
        builder: (_) => InputScreen(),
      );
    case RouteConstants.menuSelection:
      return MaterialPageRoute(
        builder: (_) => MenuSelectionScreen(),
      );
    // case RouteConstants.paymentVerification:
    //   return MaterialPageRoute(
    //     builder: (_) => PaymentVerificationScreen(),
    //   );
    default:
  }
}
