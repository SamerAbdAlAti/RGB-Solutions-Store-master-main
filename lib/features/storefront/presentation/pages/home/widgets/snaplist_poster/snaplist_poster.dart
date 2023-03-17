// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';
import 'package:saleor_app_flutter/core/types/route_type.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/poster.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/home/widgets/snaplist_poster/cubit/snaplist_poster_cubit.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class SnapListPoster extends StatefulWidget {
  const SnapListPoster({
    Key? key,
    required this.fetchPoster,
    required this.fetchProduct,
    required this.scrollController,
    required this.itemSize,
    required this.height,
    required this.screenDivider,
    this.backgroundHeight = 600,
    this.fit = BoxFit.contain,
  }) : super(key: key);
  final Future<List<Poster>> fetchPoster;
  final Future<Product> Function(String id, String channel) fetchProduct;
  final ScrollController scrollController;
  final double itemSize;
  final double height;
  final double backgroundHeight;
  final double screenDivider;
  final BoxFit fit;

  @override
  State<SnapListPoster> createState() => _SnapListPosterState();
}

class _SnapListPosterState extends State<SnapListPoster> {
  late SnaplistPosterCubit _cubit;
  late int _selectedIndex;

  @override
  void initState() {
    _cubit = SnaplistPosterCubit()
      ..fetchData(widget.fetchPoster, widget.fetchProduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SnaplistPosterCubit, SnaplistPosterState>(
      bloc: _cubit,
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const CircularProgressIndicator(strokeWidth: 2),
          loaded: (bannersData, product) {
            if (bannersData.isEmpty) {
              return const SizedBox.shrink();
            }
            return _fullWidget(bannersData, product);
          },
          error: (error) => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _fullWidget(List<Poster> posters, List<Product> products) {
    Size screenSize = MediaQuery.of(context).size;
    _selectedIndex = (posters.length / 2).round() - 1;
    return Container(
      width: double.infinity,
      height: widget.backgroundHeight,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  StoreTheme.commonColor.withOpacity(0.09), BlendMode.dstATop),
              image: const AssetImage('assets/image/snaplist.jpg'))),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: widget.height,
            width: screenSize.width / widget.screenDivider,
            child: ScrollSnapList(
              itemBuilder: (context, index) => _createPoster(
                  posters[index],
                  products.isEmpty ? null : products[index],
                  _cubit.routeTo(posters[index]),
                  index),
              itemCount: posters.length,
              dynamicItemSize: true,
              listController: widget.scrollController,
              initialIndex: (posters.length / 2).roundToDouble() - 1,
              scrollDirection: Axis.horizontal,
              allowAnotherDirection: true,
              itemSize: widget.itemSize,
              onItemFocus: (index) {
                _selectedIndex = index;
              },
            ),
          ),
          _arrowButton(
            icon: const Icon(Icons.arrow_forward_ios_rounded),
            margin: const EdgeInsets.only(left: 50),
            alignment: Alignment.centerLeft,
            onTap: () {
              if (widget.scrollController.offset ==
                  widget.itemSize * (posters.length - 1)) {
                widget.scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 360),
                    curve: Curves.easeOut);
                _selectedIndex = 0;
              } else {
                widget.scrollController.animateTo(
                    widget.scrollController.offset + widget.itemSize,
                    duration: const Duration(milliseconds: 360),
                    curve: Curves.ease);
                _selectedIndex += 1;
              }
            },
          ),
          _arrowButton(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(right: 50),
              onTap: () {
                if (widget.scrollController.offset == 0) {
                  widget.scrollController.animateTo(
                      widget.itemSize * (posters.length - 1),
                      duration: const Duration(milliseconds: 360),
                      curve: Curves.easeOut);
                } else {
                  widget.scrollController.animateTo(
                      widget.scrollController.offset - widget.itemSize,
                      duration: const Duration(milliseconds: 360),
                      curve: Curves.ease);
                }
              },
              icon: const Icon(Icons.arrow_back_ios_rounded))
        ],
      ),
    );
  }

  Widget _createPoster(Poster poster, Product? product, String uri, int index) {
    return AspectRatio(
      aspectRatio: 850 / 1600,
      child: SizedBox(
        child: Column(
          children: [
            MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                    onTap: poster.routeType == RouteType.unclickable
                        ? null
                        : _selectedIndex == index
                            ? () => Beamer.of(context).beamToNamed(uri)
                            : null,
                    child: AspectRatio(
                        aspectRatio: 850 / 1000,
                        child: CachedNetworkImage(imageUrl: poster.mediaUrl)))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                // IconButton(
                //     onPressed: () {}, icon: const Icon(Ionicons.heart_outline)),
                // AddCartIcon(
                //   product: product,
                //   intCallback: () => 1,
                // )
                // IconButton(
                //     onPressed: () {}, icon: const Icon(Ionicons.share_outline))
              ],
            ),
            const SizedBox(height: 10),
            product != null
                ? Text(
                    product.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                  )
                : const SizedBox.shrink(),
            product != null
                ? product.isDiscounted
                    ? _discountPrice(context, product)
                    : _undiscountPrice(context, product)
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  Widget _discountPrice(BuildContext context, Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${product.currency} ${product.undiscountedAmount}",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(decoration: TextDecoration.lineThrough, fontSize: 10),
        ),
        const SizedBox(width: 5),
        Text(
          "${product.currency} ${product.amount}",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }

  Widget _undiscountPrice(BuildContext context, Product product) => Text(
        " ${product.currency} ${product.amount}",
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
      );

  Widget _arrowButton(
      {required Widget icon,
      required AlignmentGeometry alignment,
      required void Function() onTap,
      required EdgeInsetsGeometry margin,
      double iconSize = 16}) {
    return Align(
        alignment: alignment,
        child: Container(
          margin: margin,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: const [BoxShadow(offset: Offset(0, 0), blurRadius: 2)],
            color: Colors.grey.shade300,
          ),
          child: IconButton(
            icon: icon,
            iconSize: iconSize,
            onPressed: onTap,
          ),
        ));
  }
}
