import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/poster.dart';
import '../../../bloc/storefront_bloc.dart';
import '../../../widgets/wide_banner/wide_banner.dart';
import '../../home/widgets/snaplist_poster/snaplist_poster.dart';
import '../../home/widgets/wall_banner/wall_banner.dart';

class DesktopHomeReplica extends StatelessWidget {
  final Tuple3<List<Poster>, List<Poster>, List<Poster>> posters;
  const DesktopHomeReplica({super.key, required this.posters});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Column(
        children: [
          const Text("المجموعة الأولى"),
          WideBanner(
              fetch: Future.value(posters.value1),
              fit: BoxFit.contain,
              aspectRatio: 2200 / 400),
          const Text("المجموعة الثانية"),
          WallBanner(
              aspectRatio: 1000 / 600, fetch: Future.value(posters.value2)),
          const Text("المجموعة الثالثة"),
          SnapListPoster(
              fetchProduct: (id, channel) =>
                  context.read<StorefrontBloc>().getSingleProduct(id, channel),
              fetchPoster: Future.value(posters.value3),
              scrollController: ScrollController(),
              itemSize: 145,
              height: 275,
              backgroundHeight: 320,
              screenDivider: 5)
        ],
      ),
    );
  }
}
