import 'package:flutter/material.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/cart/desktop/cart_desktop.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/cart/mobile/cart_mobile.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/easy_layout_builder.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EasyLayoutBuilder(
        mobileWidget: CartMobilePage(), desktopWidget: CartDesktopPage());
  }
}
