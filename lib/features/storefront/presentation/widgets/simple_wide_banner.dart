import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import '../../../../core/types/route_type.dart';

class SimpleWideBanner extends StatelessWidget {
  const SimpleWideBanner(
      {super.key,
      required this.outOfTheScreen,
      required this.routeId,
      required this.routeType,
      this.mediaUrls,
      this.debug = false,
      this.fit = BoxFit.cover,
      this.height = 200});

  /// Screen Width ÷ The Enter Number
  final double outOfTheScreen;
  final String routeId;
  final RouteType routeType;
  final List<String>? mediaUrls;
  final BoxFit fit;
  final double height;

  /// Will Use PlaceHolder if the url is empty
  final bool debug;

  //RGP solution

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    if (mediaUrls != null) {
      bool isSingleImage = mediaUrls!.length <= 1 ? true : false;
      return ImageSlideshow(
        indicatorBackgroundColor:
            isSingleImage ? Colors.transparent : Colors.grey.shade300,
        indicatorColor: isSingleImage
            ? Colors.transparent
            : Theme.of(context).textTheme.titleLarge!.color,
        width: screenSize.width / outOfTheScreen,
        height: height,
        onPageChanged: ((value) {}),
        isLoop: !isSingleImage,
        autoPlayInterval: isSingleImage ? null : 5000,
        children: [
          for (String url in mediaUrls!)
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: routeType == RouteType.unclickable
                    ? null
                    : () => Beamer.of(context)
                        .beamToNamed(_routeTo(routeType, routeId)),
                child: CachedNetworkImage(
                  imageUrl: url,
                  fit: fit,
                ),
              ),
            )
        ],
      );
    } else {
      return debug
          ? ImageSlideshow(
              indicatorBackgroundColor: Colors.grey.shade300,
              indicatorColor: Theme.of(context).textTheme.titleLarge!.color,
              width: screenSize.width / outOfTheScreen,
              onPageChanged: ((value) {}),
              isLoop: true,
              autoPlayInterval: null,
              children: const [Placeholder()],
            )
          : const SizedBox.shrink();
    }
  }

  String _routeTo(RouteType routeType, String id) {
    switch (routeType) {
      case RouteType.category:
        return "/c/$id";
      case RouteType.collection:
        return "/cl/$id";
      case RouteType.product:
        return "/p/$id";
      case RouteType.unclickable:
        return '';
    }
  }
}
