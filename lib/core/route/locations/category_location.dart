import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../features/storefront/presentation/pages/category_page/category_page.dart';
import '../../../features/storefront/presentation/pages/home/home_page.dart';

class CategoryLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('home'),
          title: "تمور الحواري | الصفحة الرئيسية",
          child: HomePage()),
    ];
    final String? categoryIdPrameter = state.pathParameters['categoryId'];
    if (categoryIdPrameter != null) {
      final categoryId = categoryIdPrameter;
      pages.add(BeamPage(
        child: CategoryPage(id: categoryId),
        type: BeamPageType.noTransition,
        key: ValueKey('category-$categoryId'),
      ));
    }
    return pages;
  }

  @override
  List<Pattern> get pathPatterns => ['/c/:categoryId'];
}
