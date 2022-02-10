// ignore_for_file: prefer_function_declarations_over_variables
import 'package:flutter/material.dart';
import 'package:frontend/pages/index.dart';
import 'package:frontend/pages/profile/account_registration.dart';
import 'package:frontend/pages/profile/success.dart';

/* We write front-end routes here.
 * It is key-value pattern.
 * e.g. "/registration" : (context, {arguments}) => RegistrationPage(arguments: arguments)
 */
final routes = {
  "/": (context, {arguments}) => Index(arguments: arguments),
  "/profile/login_success": (context, {arguments}) => Success(arguments: arguments),
  "/profile/registration_options": (context, {arguments}) => AccountRegistrationScreen(arguments: arguments),
};

/* This function is similar to a callback function.
 * Each time we do navigation, this function will be called.
 * The following code is fixed.
 */
var onGeneratedRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name] as Function;

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context, arguments: settings.arguments)
      );
      return route;
    }
    else {
      final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context)
      );
      return route;
    }
  }
};