import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/category.dart';
import '../../bloc/storefront_bloc.dart';
import '../easy_layout_builder.dart';
import 'storefront_desktop_app_bar.dart';
import 'storefront_mobile_app_bar.dart';

class StorefrontAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isMobile;
  const StorefrontAppBar({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    Future<List<Category>> appbarFetch = context
        .read<StorefrontBloc>()
        .getCategories(
            amount: 20, channel: "default-channel", amountOfProducts: 1);
    return EasyLayoutBuilder(
        mobileWidget: const MobileAppbar(),
        desktopWidget: StorefrontDesktopAppBar(fetch: appbarFetch));
  }

  @override
  Size get preferredSize => Size.fromHeight(isMobile ? 80 : 250);
}
