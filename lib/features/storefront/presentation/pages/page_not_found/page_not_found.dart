import 'package:flutter/material.dart';

import '../../widgets/easy_layout_builder.dart';
import 'page_not_found_desktop.dart';
import 'page_not_found_mobile.dart';

class PageNotFound extends StatelessWidget {
  final bool noProducts;
  const PageNotFound({required this.noProducts, super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLayoutBuilder(
        mobileWidget: PageNotFoundMobile(noProducts: noProducts),
        desktopWidget: PageNotFoundDesktop(noProducts: noProducts));
  }
}
