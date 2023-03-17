import 'package:flutter/material.dart';
import 'desktop_category_page.dart';
import 'mobile_category_page.dart';
import '../../widgets/easy_layout_builder.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return EasyLayoutBuilder(
        mobileWidget: MobileCategoryPage(id: id),
        desktopWidget: DesktopCategoryPage(id: id));
  }
}
