// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:saleor_app_flutter/core/types/route_type.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/category.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/bloc/storefront_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/category_page/widgets/single_category_grid/single_category_grid.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/page_not_found/page_not_found.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/page_not_found/page_not_found_mobile.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/appbar/storefront_mobile_app_bar.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/horizontal_product_list.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/product_view.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/simple_wide_banner.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/stacked_scroll.dart';

import '../../widgets/appbar/storefront_app_bar.dart';

class MobileCategoryPage extends StatefulWidget {
  const MobileCategoryPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  State<MobileCategoryPage> createState() => _MobileCategoryPageState();
}

class _MobileCategoryPageState extends State<MobileCategoryPage> {
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
                return const PageNotFoundMobile(noProducts: true);
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
    return Scaffold(
      appBar: const StorefrontAppBar(isMobile: true),
      drawer: const MobileDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SimpleWideBanner(
              outOfTheScreen: 1,
              fit: BoxFit.contain,
              routeId: category.id,
              height: 100,
              routeType: RouteType.category,
              mediaUrls: category.backgroundImage != null
                  ? [category.backgroundImage ?? '']
                  : null,
            ),
            _subCategory(context, category.childern),
            const SizedBox(height: 50),
            category.childern != null
                ? const SizedBox.shrink()
                : Text(
                    category.name,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
            SingleCategoryGrid(
                category: category,
                itemInRow: 2,
                pagination: (id, channel, amountOfProducts, after) => context
                    .read<StorefrontBloc>()
                    .getSingleCategory(
                        id: id,
                        channel: channel,
                        amountOfProducts: amountOfProducts,
                        after: after),
                itemBuilder: (context, item, index) =>
                    ProductView(product: item, isMobile: true),
                onEmpty: const Text("empty"),
                onError: const Text("error"),
                width: double.infinity,
                itemHeight: 260)
          ]),
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
                        : Image.asset('assets/image/logo.png'),
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
        child: const PageNotFound(noProducts: true));
  }
}

class _PageLoading extends StatelessWidget {
  const _PageLoading({
    Key? key,
    required this.fetchCategories,
  }) : super(key: key);
  final Future<List<Category>?> fetchCategories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StorefrontAppBar(isMobile: true),
      body: Center(
          child: SizedBox(
        height: 200,
        width: 200,
        child: Lottie.network(
            "https://assets7.lottiefiles.com/packages/lf20_kxsd2ytq.json"),
      )),
    );
  }
}
