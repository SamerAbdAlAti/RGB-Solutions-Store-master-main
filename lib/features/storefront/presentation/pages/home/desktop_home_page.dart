import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/storefront_bloc.dart';
import '../../cubit/store_information_cubit.dart';
import '../../widgets/appbar/storefront_app_bar.dart';
import '../../widgets/category_grid_widget/category_grid_widget.dart';
import '../../widgets/collection_listview/collection_listview.dart';
import '../../widgets/container_error_widget.dart';
import '../../widgets/footer_wrapper.dart';
import '../../widgets/product_view.dart';
import '../../widgets/wide_banner/wide_banner.dart';
import 'widgets/snaplist_poster/snaplist_poster.dart';
import 'widgets/wall_banner/wall_banner.dart';

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    Size screenSize = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const StorefrontAppBar(),
        body: FooterWrapper(
          child: _BuildHomePage(
              screenSize: screenSize, scrollController: scrollController),
        ),
      ),
    );
  }
}

class _BuildHomePage extends StatelessWidget {
  const _BuildHomePage({
    Key? key,
    required this.screenSize,
    required this.scrollController,
  }) : super(key: key);

  final Size screenSize;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: screenSize.width * 0.75,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WideBanner(
              fit: BoxFit.contain,
              fetch: context.read<StoreInformationCubit>().getHomeHugePoster(),
              aspectRatio: 1400 / 400,
            ),
            CollectionListView(
                collections: context
                    .read<StorefrontBloc>()
                    .getCollections(amount: 1, amountOfProducts: 50)),
            const SizedBox(height: 20),
            WallBanner(
                aspectRatio: 1400 / 900,
                fetch:
                    context.read<StoreInformationCubit>().getHomeWallPoster()),
            const SizedBox(
              height: 50,
            ),
            CollectionListView(
                showIndex: 1,
                collections: context
                    .read<StorefrontBloc>()
                    .getCollections(amount: 2, amountOfProducts: 50)),
            _downloadApp(context),
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
                screenDivider: 1.2),
            CollectionListView(
                showIndex: 3,
                collections: context
                    .read<StorefrontBloc>()
                    .getCollections(amount: 10, amountOfProducts: 50)),
            const SizedBox(
              height: 50,
            ),
            Align(
                alignment: Alignment.center,
                child: CategoryGridWidget(
                  buttonTextStyle: ButtonTextStyle(
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 12)),
                  width: double.infinity,
                  itemBuilder: (context, item, index) => ProductView(
                    product: item,
                    isMobile: false,
                  ),
                  fetch: context.read<StorefrontBloc>().getCategories(
                      amount: 12,
                      channel: 'default-channel',
                      amountOfProducts: 12),
                  fetchMore: (id, channel, amountOfProducts, after) {
                    return context.read<StorefrontBloc>().getSingleCategory(
                        id: id,
                        channel: channel,
                        amountOfProducts: amountOfProducts,
                        after: after);
                  },
                  onEmpty: const Text("لا توجد بيانات"),
                  itemHeight: 250,
                  margin: const EdgeInsets.only(top: 40),
                  onError: const ContainerErrorWidget(
                      message: Text("خطأ في السيرفر")),
                )),
          ],
        ),
      ),
    );
  }
}

Widget _downloadApp(BuildContext context) {
  return Column(
    children: [
      const Text("اللي بخاطرك, واصلك"),
      const SizedBox(height: 20),
      Text(
        "حمل تطبيق الحواري للتمور والضيافة للحصول على عروض حصرية",
        style: Theme.of(context).textTheme.displaySmall,
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/play.png"))),
            width: 200,
            height: 100,
          ),
          const SizedBox(width: 20),
          Container(
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/image/app.png"))),
            width: 175,
            height: 52,
          ),
        ],
      )
    ],
  );
}
