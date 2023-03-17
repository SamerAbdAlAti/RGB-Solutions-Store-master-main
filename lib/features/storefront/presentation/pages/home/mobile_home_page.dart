import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/collection_listview/collection_listview.dart';

import '../../bloc/storefront_bloc.dart';
import '../../cubit/store_information_cubit.dart';
import '../../widgets/appbar/storefront_app_bar.dart';
import '../../widgets/appbar/storefront_mobile_app_bar.dart';
import '../../widgets/category_grid_widget/category_grid_widget.dart';
import '../../widgets/container_error_widget.dart';
import '../../widgets/product_view.dart';
import '../../widgets/wide_banner/wide_banner.dart';
import 'widgets/snaplist_poster/snaplist_poster.dart';
import 'widgets/wall_banner/wall_banner.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    Size screenSize = MediaQuery.of(context).size;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: _BuildHomePage(
          screenSize: screenSize,
          scrollController: scrollController,
          appBar: const StorefrontAppBar(isMobile: true),
        ));
  }
}

class _BuildHomePage extends StatelessWidget {
  const _BuildHomePage({
    Key? key,
    required this.screenSize,
    required this.scrollController,
    required this.appBar,
  }) : super(key: key);

  final Size screenSize;
  final ScrollController scrollController;
  final PreferredSizeWidget appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: const MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WideBanner(
              fit: BoxFit.contain,
              fetch: context.read<StoreInformationCubit>().getHomeHugePoster(),
              aspectRatio: 1920 / 750,
            ),
            CollectionListView(
                isMobile: true,
                collections: context
                    .read<StorefrontBloc>()
                    .getCollections(amount: 1, amountOfProducts: 50)),
            const SizedBox(height: 80),
            // _downloadApp(context),
            // const SizedBox(height: 80),
            WallBanner(
                aspectRatio: 1400 / 900,
                fetch:
                    context.read<StoreInformationCubit>().getHomeWallPoster()),
            const SizedBox(
              height: 50,
            ),
            CollectionListView(
                showIndex: 1,
                isMobile: true,
                collections: context
                    .read<StorefrontBloc>()
                    .getCollections(amount: 2, amountOfProducts: 50)),
            const SizedBox(
              height: 50,
            ),
            SnapListPoster(
                fetchProduct: (id, channel) => context
                    .read<StorefrontBloc>()
                    .getSingleProduct(id, channel),
                fetchPoster:
                    context.read<StoreInformationCubit>().getHomeListPoster(),
                scrollController: scrollController,
                itemSize: 265,
                height: 500,
                screenDivider: 1.3),
            CollectionListView(
                showIndex: 3,
                isMobile: true,
                collections: context
                    .read<StorefrontBloc>()
                    .getCollections(amount: 10, amountOfProducts: 50)),
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: CategoryGridWidget(
                width: double.infinity,
                gridPadding: const EdgeInsets.all(8.0),
                itemsInRow: (screenSize.width ~/ 150),
                isMobile: true,
                buttonTextStyle: ButtonTextStyle(
                    textStyle: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 12)),
                itemBuilder: (context, item, index) =>
                    ProductView(product: item, isMobile: true),
                fetch: context.read<StorefrontBloc>().getCategories(
                    amount: 12,
                    channel: 'default-channel',
                    amountOfProducts: 10),
                fetchMore: (id, channel, amountOfProducts, after) {
                  return context.read<StorefrontBloc>().getSingleCategory(
                      id: id,
                      channel: channel,
                      amountOfProducts: amountOfProducts,
                      after: after);
                },
                onEmpty: const Text("لا توجد بيانات"),
                itemHeight: 200,
                margin: const EdgeInsets.only(top: 40),
                onError:
                    const ContainerErrorWidget(message: Text("خطأ في السيرفر")),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

// Widget _downloadApp(BuildContext context) {
//   return Column(
//     children: [
//       Text(
//         "اللي بخاطرك ، واصلك",
//         style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
//       ),
//       const SizedBox(height: 20),
//       Text(
//         "حمل تطبيق الحواري للتمور والضيافة للحصول على عروض حصرية",
//         style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 14),
//       ),
//       // const SizedBox(height: 20),
//       // Row(
//       //   mainAxisAlignment: MainAxisAlignment.center,
//       //   children: [
//       //     Container(
//       //       decoration: const BoxDecoration(
//       //           image: DecorationImage(
//       //               image: AssetImage("assets/image/play.png"))),
//       //       width: 150,
//       //       height: 75,
//       //     ),
//       //     const SizedBox(width: 20),
//       //     Container(
//       //       decoration: const BoxDecoration(
//       //           image:
//       //               DecorationImage(image: AssetImage("assets/image/app.png"))),
//       //       width: 130,
//       //       height: 40,
//       //     ),
//       //   ],
//       // )
//     ],
//   );
// }
