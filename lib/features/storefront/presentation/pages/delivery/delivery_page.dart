import 'package:flutter/material.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/delivery/desktop/desktop_delivery.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/delivery/mobile/mobile_delivery.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/easy_layout_builder.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EasyLayoutBuilder(
        mobileWidget: MobileDelivery(), desktopWidget: DesktopDelivery());
  }
}
