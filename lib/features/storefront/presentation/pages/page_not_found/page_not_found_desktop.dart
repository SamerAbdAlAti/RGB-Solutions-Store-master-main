import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../widgets/appbar/storefront_app_bar.dart';
import '../../widgets/footer_wrapper.dart';

class PageNotFoundDesktop extends StatelessWidget {
  final bool noProducts;

  const PageNotFoundDesktop({super.key, required this.noProducts});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const StorefrontAppBar(),
        body: FooterWrapper(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SelectableText(
                      noProducts
                          ? "يتم اضافة منتجات في هذا الصنف"
                          : "يتم إضافة وتحديث مزايا الموقع...",
                      style: Theme.of(context).textTheme.bodyMedium),
                  SizedBox(
                    width: 600,
                    height: 400,
                    child: RiveAnimation.asset(
                        noProducts ? "/lottie/empty.riv" : "/lottie/404.riv"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
