// ignore_for_file: prefer_function_declarations_over_variables
import 'package:flutter/material.dart';
import 'package:frontend/pages/cake_building/custom_cake_page.dart';
import 'package:frontend/pages/canceled_order.dart';
import 'package:frontend/pages/index.dart';
import 'package:frontend/pages/profile/customer/fav_cakes/fav_cakes.dart';
import 'package:frontend/pages/profile/customer/fav_merchants/fav_merchants.dart';
import 'package:frontend/pages/profile/customer/orders/orders.dart';
import 'package:frontend/pages/profile/customer/settings/customer_settings.dart';
import 'package:frontend/pages/profile/merchant/cake_products/cake_product.dart';
import 'package:frontend/pages/profile/merchant/orders/orders.dart';
import 'package:frontend/pages/profile/merchant/review/merchant_review.dart';
import 'package:frontend/pages/profile/merchant/settings/merchant_settings.dart';
import 'package:frontend/pages/profile/registration/account_registration.dart';
import 'package:frontend/pages/profile/customer/review/review.dart';
import 'package:frontend/pages/profile/registration/success.dart';
import 'package:frontend/pages/received_order.dart';
import 'package:frontend/pages/search/merchant_home/product_page.dart';
import 'package:frontend/pages/shopping_cart/shopping_cart.dart';
import 'package:frontend/pages/shopping_cart/summary/summary.dart';

/* We write front-end routes here.
 * It is key-value pattern.
 * e.g. "/registration" : (context, {arguments}) => RegistrationPage(arguments: arguments)
 */
final routes = {
  "/": (context, {arguments}) => Index(arguments: arguments),
  "/profile/registration_success": (context, {arguments}) => Success(arguments: arguments),
  "/profile/registration_options": (context, {arguments}) => AccountRegistrationScreen(arguments: arguments),
  // -------- Customer Profile Routes --------
  "/profile/customer/customer_all_orders": (context, {arguments}) => CustomerAllOrdersPage(arguments: arguments),
  "/profile/customer/customer_reviews": (context, {arguments}) => Review(arguments: arguments),
  "/profile/customer/fav_cakes": (context, {arguments}) => FavCakesPage(arguments: arguments),
  "/profile/customer/fav_merchants": (context, {arguments}) => FavMerchantsPage(arguments: arguments),
  "/profile/customer/customer_settings": (context, {arguments}) => CustomerSettingsPage(arguments: arguments),

  // Merchant Profile Routes
  "/profile/merchant/merchant_all_orders": (context, {arguments}) => MerchantOrdersPage(arguments: arguments),
  "/profile/merchant/cake_product": (context, {arguments}) => CakeProductPage(arguments: arguments),
  "/profile/customer/merchant_reviews": (context, {arguments}) => MerchantReviewsPage(arguments: arguments),
  "/profile/merchant/merchant_settings": (context, {arguments}) => MerchantSettingsPage(arguments: arguments),

  "/cancel_order": (context, {arguments}) => CanceledOrder(arguments: arguments),
  "/received_order": (context, {arguments}) => ReceivedOrder(arguments: arguments),
  "/review": (context, {arguments}) => Review(arguments: arguments),
  "/build_cake": (context, {arguments}) => CustomCakePage(arguments: arguments),
  "/shopping_cart": (context, {arguments}) => ShoppingCart(arguments: arguments),
  "/shopping_cart/summary": (context, {arguments}) => Summary(arguments: arguments),
  "/product_page": (context, {arguments}) => ProductPage(arguments: arguments),
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