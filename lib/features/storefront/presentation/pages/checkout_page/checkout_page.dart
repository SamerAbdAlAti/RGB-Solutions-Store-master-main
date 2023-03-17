import 'package:flutter/material.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/checkout_page/desktop/checkout_desktop.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/checkout_page/mobile/checkout_mobile.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/easy_layout_builder.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EasyLayoutBuilder(
        mobileWidget: CheckoutMobile(), desktopWidget: CheckoutDekstop());
  }
}
