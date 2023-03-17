import 'package:flutter/material.dart';
import 'desktop_product_details.dart';
import 'mobile_product_details.dart';
import '../../widgets/easy_layout_builder.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return EasyLayoutBuilder(
        mobileWidget: MobileProductDetails(id: id),
        desktopWidget: DesktopProductDetails(id: id));
  }
}
