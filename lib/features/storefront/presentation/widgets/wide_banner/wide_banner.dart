// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:saleor_app_flutter/core/types/route_type.dart';

import 'package:saleor_app_flutter/features/storefront/domain/entities/poster.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/wide_banner/cubit/wide_banner_cubit.dart';

class WideBanner extends StatefulWidget {
  final Future<List<Poster>> fetch;
  final BoxFit fit;
  final double aspectRatio;

  const WideBanner(
      {Key? key,
      required this.fetch,
      required this.aspectRatio,
      this.fit = BoxFit.cover})
      : super(key: key);

  @override
  State<WideBanner> createState() => _WideBannerState();
}

class _WideBannerState extends State<WideBanner> {
  late WideBannerCubit _cubit;

  @override
  void initState() {
    _cubit = WideBannerCubit(widget.fetch)..initPoster();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WideBannerCubit, WideBannerState>(
        bloc: _cubit,
        builder: (context, state) {
          return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const SizedBox.shrink(),
              loaded: (bannersData) {
                return _loadedWidget(context, bannersData);
              },
              error: (e) => const SizedBox.shrink());
        });
  }

  Widget _loadedWidget(BuildContext context, List<Poster> posters) {
    Size screenSize = MediaQuery.of(context).size;
    bool isSingleImage = posters.length <= 1 ? true : false;
    return ImageSlideshow(
      indicatorBackgroundColor:
          isSingleImage ? Colors.transparent : Colors.grey.shade300,
      indicatorColor: isSingleImage
          ? Colors.transparent
          : Theme.of(context).textTheme.titleLarge!.color,
      width: screenSize.height * widget.aspectRatio,
      height: screenSize.width / widget.aspectRatio,
      onPageChanged: ((value) {}),
      isLoop: !isSingleImage,
      autoPlayInterval: isSingleImage ? null : 5000,
      children: [for (Poster poster in posters) _buildPoster(context, poster)],
    );
  }

  Widget _buildPoster(BuildContext context, Poster poster) {
    String route = "/";
    switch (poster.routeType) {
      case RouteType.category:
        route = "/c/${poster.routeId}";
        break;
      case RouteType.collection:
        route = "/cl/${poster.routeId}";
        break;
      case RouteType.product:
        route = "/p/${poster.routeId}";
        break;
      case RouteType.unclickable:
        break;
    }
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: poster.routeType == RouteType.unclickable
            ? null
            : () => Beamer.of(context).beamToNamed(route),
        child: CachedNetworkImage(
          imageUrl: poster.mediaUrl,
          fit: widget.fit,
        ),
      ),
    );
  }
}
