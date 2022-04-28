// ignore_for_file: prefer_function_declarations_over_variables
import 'package:flutter/material.dart';
import 'package:frontend/pages/cake_building/custom_cake_page.dart';
import 'package:frontend/pages/canceled_order.dart';
import 'package:frontend/pages/index.dart';
import 'package:frontend/pages/profile/customer/fav_cakes/fav_cakes_page.dart';
import 'package:frontend/pages/profile/customer/fav_merchants/fav_merchants.dart';
import 'package:frontend/pages/profile/customer/orders/orders.dart';
import 'package:frontend/pages/profile/customer/settings/customer_settings.dart';
import 'package:frontend/pages/profile/merchant/cake_products/cake_product.dart';
import 'package:frontend/pages/profile/merchant/orders/orders.dart';
import 'package:frontend/pages/profile/merchant/review/merchant_review.dart';
import 'package:frontend/pages/profile/merchant/settings/merchant_settings.dart';
import 'package:frontend/pages/profile/merchant/shop_manager/capabilities/add_capability_page.dart';
import 'package:frontend/pages/profile/merchant/shop_manager/capabilities/capability_page.dart';
import 'package:frontend/pages/profile/merchant/shop_manager/capabilities/modify_capability_page.dart';
import 'package:frontend/pages/profile/merchant/shop_manager/create_cake/add_prebuilt_cake.dart';
import 'package:frontend/pages/profile/merchant/shop_manager/shop_manager.dart';
import 'package:frontend/pages/profile/registration/account_registration.dart';
import 'package:frontend/pages/profile/customer/review/review.dart';
import 'package:frontend/pages/profile/registration/success.dart';
import 'package:frontend/pages/received_order.dart';
import 'package:frontend/pages/search/merchant_home/product_page.dart';
import 'package:frontend/pages/shopping_cart/payment/payment.dart';
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
  "/profile/customer/fav_cakes_page": (context, {arguments}) => FavCakesPage(arguments: arguments),
  "/profile/customer/fav_merchants": (context, {arguments}) => FavMerchantsPage(arguments: arguments),
  "/profile/customer/customer_settings": (context, {arguments}) => CustomerSettingsPage(arguments: arguments),

  // Merchant Profile Routes
  "/profile/merchant/merchant_all_orders": (context, {arguments}) => MerchantOrdersPage(arguments: arguments),
  "/profile/merchant/cake_product": (context, {arguments}) => CakeProductPage(),
  "/profile/merchant/merchant_reviews": (context, {arguments}) => MerchantReviewsPage(arguments: arguments),
  "/profile/merchant/merchant_settings": (context, {arguments}) => MerchantSettingsPage(arguments: arguments),
  "/profile/merchant/shop_manager": (context, {arguments}) => ShopManagerPage(arguments: arguments),
  "/profile/merchant/shop_manager/create_cake": (context, {arguments}) => AddPrebuiltCake(arguments: arguments),
  "/profile/merchant/shop_manager/modify_capability": (context, {arguments}) => CapabilityPage(arguments: arguments),
  "/profile/merchant/shop_manager/change_capability": (context, {arguments}) => ModifyCapabilityPage(arguments: arguments),
  "/profile/merchant/shop_manager/add_capability": (context, {arguments}) => AddCapabilityPage(arguments: arguments),

  "/cancel_order": (context, {arguments}) => CanceledOrder(arguments: arguments),
  "/received_order": (context, {arguments}) => ReceivedOrder(arguments: arguments),
  "/review": (context, {arguments}) => Review(arguments: arguments),
  "/build_cake": (context, {arguments}) => CustomCakePage(arguments: arguments),
  "/shopping_cart": (context, {arguments}) => ShoppingCartPage(argumenets: arguments),
  "/shopping_cart/summary": (context, {arguments}) => Summary(argumenets: arguments),
  "/shopping_cart/payment": (context, {arguments}) => Payment(argumenets: arguments),
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