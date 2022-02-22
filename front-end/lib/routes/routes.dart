// ignore_for_file: prefer_function_declarations_over_variables
import 'package:flutter/material.dart';
import 'package:frontend/pages/cake_building/custom_cake_page.dart';
import 'package:frontend/pages/canceled_order.dart';
import 'package:frontend/pages/index.dart';
import 'package:frontend/pages/profile/registration/account_registration.dart';
import 'package:frontend/pages/profile/customer/review/review.dart';
import 'package:frontend/pages/profile/registration/success.dart';
import 'package:frontend/pages/received_order.dart';
import 'package:frontend/pages/profile/customer/shopping_cart/shopping_cart.dart';

/* We write front-end routes here.
 * It is key-value pattern.
 * e.g. "/registration" : (context, {arguments}) => RegistrationPage(arguments: arguments)
 */
final routes = {
  "/": (context, {arguments}) => Index(arguments: arguments),
  "/profile/registration_success": (context, {arguments}) => Success(arguments: arguments),
  "/profile/registration_options": (context, {arguments}) => AccountRegistrationScreen(arguments: arguments),
  "/cancel_order": (context, {arguments}) => CanceledOrder(arguments: arguments),
  "/received_order": (context, {arguments}) => ReceivedOrder(arguments: arguments),
  "/review": (context, {arguments}) => Review(arguments: arguments),
  "/build_cake": (context, {arguments}) => CustomCakePage(arguments: arguments),
  "/shopping_cart": (context, {arguments}) => ShoppingCart(arguments: arguments),
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