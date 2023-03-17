import 'package:flutter/material.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/order_details/desktop/dekstop_order_datails.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/order_details/mobile/mobile_order_details.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/order_details/widgets/order_details_util.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/easy_layout_builder.dart';

import '../../../../../core/types/order_status.dart';
import '../../../../../core/types/payment_charge_status_enum.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {


    return EasyLayoutBuilder(
        mobileWidget:  MobileOrderDetails(),
        desktopWidget: DekstopOrderDetails());
  }
}
