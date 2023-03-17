import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../widgets/appbar/storefront_app_bar.dart';
import '../../widgets/appbar/storefront_mobile_app_bar.dart';

class PageNotFoundMobile extends StatelessWidget {
  final bool noProducts;

  const PageNotFoundMobile({super.key, required this.noProducts});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
        appBar: const StorefrontAppBar(isMobile: true),
        drawer: const MobileDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectableText(
                  noProducts
                      ? "يتم اضافة منتجات في هذا الصنف"
                      : "يتم إضافة وتحديث مزايا الموقع...",
                  style: Theme.of(context).textTheme.displayLarge),
              SizedBox(
                  width: 500,
                  height: 400,
                  child: RiveAnimation.asset(noProducts
                      ? "assets/lottie/empty.riv"
                      : "assets/lottie/404.riv")),
            ],
          ),
        ),
      )),
    );
  }
}
