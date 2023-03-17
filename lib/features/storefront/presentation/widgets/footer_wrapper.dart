import 'package:flutter/material.dart';
import 'package:footer/footer_view.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/home/widgets/home_footer.dart';

class FooterWrapper extends StatelessWidget {
  const FooterWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FooterView(
      footer: const HomeFooter(),
      flex: 6,
      children: [child],
    );
  }
}
