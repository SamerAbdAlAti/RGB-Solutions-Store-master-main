// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';
import 'package:saleor_app_flutter/core/types/route_type.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/category.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/bloc/storefront_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/category_page/widgets/single_category_grid/single_category_grid.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/page_not_found/page_not_found.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/page_not_found/page_not_found_desktop.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/appbar/storefront_app_bar.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/horizontal_product_list.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/product_view.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/simple_wide_banner.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/stacked_scroll.dart';

import '../../widgets/footer_wrapper.dart';

class DesktopCategoryPage extends StatefulWidget {
  const DesktopCategoryPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  State<DesktopCategoryPage> createState() => _DesktopCategoryPageState();
}

class _DesktopCategoryPageState extends State<DesktopCategoryPage> {
  final subCategoryController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: FutureBuilder(
          future: context.read<StorefrontBloc>().getSingleCategory(
              id: widget.id, channel: "default-channel", amountOfProducts: 20),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const PageNotFoundDesktop(noProducts: true);
              case ConnectionState.done:
                if (snapshot.hasData == false ||
                    snapshot.data!.pageInfo!.startCursor.isEmpty) {
                  return const _BuildNotFound();
                }
                Category category = snapshot.data!;
                return _fullWidget(context, category);
              default:
                return const SizedBox.shrink();
            }
          },
        ));
  }

  Widget _fullWidget(BuildContext context, Category category) {
    Size screenSize = MediaQuery.of(context).size;
    return Title(
      title: category.name,
      color: StoreTheme.breakerColor,
      child: Scaffold(
        appBar: const StorefrontAppBar(),
        body: FooterWrapper(
          child: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: screenSize.width * 0.75,
                child: Column(children: [
                  SimpleWideBanner(
                    outOfTheScreen: 1.3,
                    fit: BoxFit.contain,
                    routeId: category.id,
                    routeType: RouteType.category,
                    mediaUrls: category.backgroundImage != null
                        ? [category.backgroundImage ?? '']
                        : null,
                  ),
                  const SizedBox(height: 5),
                  _subCategory(context, category.childern),
                  category.childern != null
                      ? const SizedBox.shrink()
                      : Text(
                          category.name,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                  SingleCategoryGrid(
                      category: category,
                      itemInRow: 5,
                      pagination: (id, channel, amountOfProducts, after) =>
                          context.read<StorefrontBloc>().getSingleCategory(
                              id: id,
                              channel: channel,
                              amountOfProducts: amountOfProducts,
                              after: after),
                      itemBuilder: (context, item, index) =>
                          ProductView(product: item, isMobile: false),
                      onEmpty: const Text("empty"),
                      onError: const Text("error"),
                      width: double.infinity,
                      itemHeight: 260)
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _subCategory(BuildContext context, List<Category>? subCategory) {
    return subCategory != null
        ? StackedScroll(
            itemWidth: 200,
            scrollController: subCategoryController,
            autoScroll: true,
            child: HorizontalProductList<Category>(
              listHeight: 300,
              controller: subCategoryController,
              onWaiting: const Center(child: CircularProgressIndicator()),
              fetch: Future.value(subCategory),
              onEmpty: const SizedBox.shrink(),
              onError: const SizedBox.shrink(),
              tileWidth: 200,
              title: const SizedBox.shrink(),
              itemBuilder: (context, item, index) {
                return _SubCategoryView(item: item);
              },
            ),
          )
        : const SizedBox.shrink();
  }
}

class _SubCategoryView extends StatelessWidget {
  final Category item;
  const _SubCategoryView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Beamer.of(context).beamToNamed('/c/${item.id}');
        },
        child: Container(
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: item.products != null
                  ? DecorationImage(
                      image: CachedNetworkImageProvider(
                          item.products![0].thumbnail),
                    )
                  : null),
          child: Column(
            children: [
              Expanded(
                  flex: 4,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: item.backgroundImage != null
                        ? CachedNetworkImage(imageUrl: item.backgroundImage!)
                        : const FadeInImage(
                            image: AssetImage('assets/image/logo.png'),
                            placeholder: AssetImage('assets/image/logo.png'),
                          ),
                  )),
              Expanded(
                flex: 2,
                child: Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildNotFound extends StatelessWidget {
  const _BuildNotFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Title(
        title: "تمور الحواري | ضايع؟",
        color: Theme.of(context).textTheme.titleLarge!.color ?? Colors.orange,
        child: const PageNotFound(
          noProducts: true,
        ));
  }
}
