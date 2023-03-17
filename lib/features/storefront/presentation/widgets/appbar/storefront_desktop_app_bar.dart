import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/category.dart';
import 'widgets/desktop/app_bar.dart';

class StorefrontDesktopAppBar extends StatefulWidget {
  const StorefrontDesktopAppBar({super.key, required this.fetch});
  final Future<List<Category>> fetch;

  @override
  State<StorefrontDesktopAppBar> createState() =>
      _StorefrontDesktopAppBarState();
}

class _StorefrontDesktopAppBarState extends State<StorefrontDesktopAppBar> {
  late Future<List<Category>> future;
  Widget hoverWidget = const SizedBox.shrink();
  bool subHeight = false;
  @override
  void initState() {
    future = widget.fetch;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _buildWidgetWithoutBar();
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return _loadingWidget();
            case ConnectionState.done:
              final List<Category>? items = snapshot.data;
              return items!.isNotEmpty
                  ? _buildWidget(items)
                  : _buildWidgetWithoutBar();
            default:
              return _buildWidgetWithoutBar();
          }
        });
  }

  Widget _loadingWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Expanded(flex: 2, child: AppBarDesktop()),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 6; i++)
                CardLoading(
                  height: 20,
                  width: 80,
                  borderRadius: BorderRadius.circular(18),
                  margin: const EdgeInsets.only(left: 15),
                ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildWidgetWithoutBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        SizedBox(height: 100, child: AppBarDesktop()),
        SizedBox(
          height: 40,
        )
      ],
    );
  }

  Widget _buildWidget(List<Category> categories) {
    return SizedBox(height: 170, child: AppBarDesktop(categories: categories));
  }
}
