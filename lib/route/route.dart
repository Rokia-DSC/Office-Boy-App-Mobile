import 'package:flutter/material.dart';
import 'package:coffee_ui/pages/cart_page.dart';
import 'package:coffee_ui/pages/office_boy_screens/office_boy_home.dart';
import 'package:coffee_ui/pages/details.dart';
import 'package:coffee_ui/pages/widgets/category_tabs.dart';
import 'package:coffee_ui/pages/widgets/product_card.dart';
import 'package:coffee_ui/pages/widgets/favorites.dart';
import 'package:coffee_ui/pages/widgets/home_page.dart';
import 'package:coffee_ui/pages/widgets/notification_card.dart';
import 'package:coffee_ui/pages/widgets/notifications.dart';
import 'package:coffee_ui/pages/edit_location.dart';
import 'package:coffee_ui/pages/onboardingscreen.dart';
import 'package:coffee_ui/pages/order_accteped.dart';
import 'package:coffee_ui/pages/order_page.dart';
import 'package:coffee_ui/pages/signin_page.dart';
import 'package:coffee_ui/pages/signup_page.dart';
import 'package:coffee_ui/util/bottom_navigator_bar.dart';
import 'package:coffee_ui/util/coffeetile.dart';
import 'package:coffee_ui/util/coffeetype.dart';
import 'package:coffee_ui/util/upcoming_orders.dart';

//Routes Name
const String onBoardingPage = 'onBoardingPage';
const String signInPage = 'signInPage';
const String signUpPage = 'signUpPage';
const String homePage = 'homePage';
const String detailsPage = 'detailsPage';
const String cartPage = 'cartPage';
const String officePage = 'officePage';
const String editLocationPage = 'editLocationPage';
const String orderAcceptedPage = 'orderAcceptedPage';
const String orderPage = 'orderPage';

//Control our page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case onBoardingPage:
      return MaterialPageRoute(builder: (context) => const OnboardingScreen());
    case signInPage:
      return MaterialPageRoute(builder: (context) => const SignInPage());
    case signUpPage:
      return MaterialPageRoute(builder: (context) => const SignupPage());
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case detailsPage:
      return MaterialPageRoute(builder: (context) => const DetailsPage());
    case cartPage:
      return MaterialPageRoute(builder: (context) => const CartPage());
    case officePage:
      return MaterialPageRoute(builder: (context) => const HomeOfficeBoy());
    case editLocationPage:
      return MaterialPageRoute(builder: (context) => const EditLocation());
    case orderAcceptedPage:
      return MaterialPageRoute(builder: (context) => const OrderAccepted());
    case orderPage:
      return MaterialPageRoute(builder: (context) => const OrderPage());
    default:
      throw Exception('Unknown route: ${settings.name}');
  }
}
