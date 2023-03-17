// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wall_layout/flutter_wall_layout.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';
import 'package:saleor_app_flutter/core/types/route_type.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/poster.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/home/widgets/wall_banner/cubit/wall_banner_cubit.dart';

class WallBanner extends StatefulWidget {
  const WallBanner({
    Key? key,
    required this.fetch,
    this.customStones,
    this.aspectRatio = 16 / 5,
    this.staticMode = false,
  }) : super(key: key);
  final double aspectRatio;
  final Future<List<Poster>> fetch;
  final List<Stone>? customStones;
  final bool staticMode;

  @override
  State<WallBanner> createState() => _WallBannerState();
}

class _WallBannerState extends State<WallBanner> {
  late WallBannerCubit _cubit;
  final PageController pageController = PageController();

  int _selectedPage = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    _cubit = WallBannerCubit()..mapDataToBanner(widget.fetch);
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (!widget.staticMode) _pageAutoScroller();
    });
  }

  void _pageAutoScroller() async {
    try {
      await Future.delayed(const Duration(seconds: 10));
      if (pageController.page == pages.length - 1) {
        _selectedPage = 0;
        pageController.animateToPage(0,
            duration: const Duration(milliseconds: 360), curve: Curves.easeIn);
      } else {
        _selectedPage = pageController.page!.toInt() + 1;

        pageController.nextPage(
            duration: const Duration(milliseconds: 360), curve: Curves.easeIn);
      }
      setState(() {
        _pageAutoScroller();
      });
    } catch (e) {
      // TODO do cool
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocBuilder<WallBannerCubit, WallBannerState>(
      bloc: _cubit,
      builder: (context, state) {
        return state.map(
            initial: (_) => const SizedBox.shrink(),
            loading: (_) => const SizedBox.shrink(),
            loaded: (banners) {
              var walls = banners.bannersData.slices(5);
              pages = [];

              for (var element in walls) {
                pages.add(
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: WallLayout(
                        scrollDirection: Axis.horizontal,
                        stonePadding: 5,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollController: ScrollController(),
                        layersCount: 2,
                        stones: widget.customStones ?? _getStones(element),
                      ),
                    ),
                  ),
                );
              }
              return banners.bannersData.isNotEmpty
                  ? _fullWidget(banners.bannersData, screenSize)
                  : const SizedBox.shrink();
            },
            error: (error) {
              if (kDebugMode) print("come to WallBanner bro: $error");
              return const SizedBox.shrink();
            });
      },
    );
  }

  Widget _fullWidget(List<Poster> bannersData, Size screenSize) {
    return AspectRatio(
      aspectRatio: widget.aspectRatio,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          PageView(
              pageSnapping: true, controller: pageController, children: pages),
          Align(
            alignment: Alignment.bottomCenter,
            child: _navigationBar(context),
          )
        ],
      ),
    );
  }

  Widget _navigationBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < pages.length; i++) _navigationItem(context, i)
      ],
    );
  }

  Widget _navigationItem(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedPage = index;
          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 360), curve: Curves.ease);
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 260),
        height: 10,
        width: _selectedPage == index ? 30 : 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: _selectedPage == index
              ? StoreTheme.breakerColor
              : StoreTheme.unselectedColor,
        ),
      ),
    );
  }

  List<Stone> _getStones(List<Poster> posters) {
    int i = 0;
    List<Stone> stones = [];
    for (Poster element in posters) {
      i++;
      stones.add(_createStone(element, i));
    }

    return stones;
  }

  Stone _createStone(Poster data, int index) {
    return Stone(
        id: index,
        width: 1,
        height: index == 3 ? 2 : 1,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: data.routeType == RouteType.unclickable
                ? null
                : () {
                    switch (data.routeType) {
                      case RouteType.product:
                        Beamer.of(context).beamToNamed('/p/${data.routeId}');
                        break;
                      case RouteType.category:
                        Beamer.of(context).beamToNamed('/c/${data.routeId}');
                        break;
                      case RouteType.collection:
                        Beamer.of(context).beamToNamed('/cl/${data.routeId}');
                        break;
                      case RouteType.unclickable:
                        break;
                    }
                  },
            child: CachedNetworkImage(
              imageUrl: data.mediaUrl,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
