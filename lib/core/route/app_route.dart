import 'package:beamer/beamer.dart';
import 'package:saleor_app_flutter/core/route/locations/accounts_location.dart';
import 'package:saleor_app_flutter/core/route/locations/cart_location.dart';
import 'package:saleor_app_flutter/core/route/locations/checkout_location.dart';
import 'package:saleor_app_flutter/core/route/locations/delivery_location.dart';
import 'package:saleor_app_flutter/core/route/locations/order_location.dart';

import 'locations/about_location.dart';
import 'locations/banner_location.dart';
import 'locations/category_location.dart';
import 'locations/home_location.dart';
import 'locations/login_location.dart';
import 'locations/not_found_location.dart';
import 'locations/products_location.dart';
import 'locations/register_location.dart';
import 'locations/store_location.dart';

class DesktopRoute {
  BeamerDelegate routerDelegate = BeamerDelegate(
      notFoundRedirect: PageNotFoundLocation(),
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [
          HomeLocation(),
          StoreLocation(),
          ProductsLocation(),
          LoginLocation(),
          AboutLocation(),
          CategoryLocation(),
          RegisterLocation(),
          CheckoutLocation(),
          CartLocation(),
          OrderLocation(),
          DeliveryLocation(),
          BannerEditLocation(),
          AccountLocation()
        ],
      ));
}
