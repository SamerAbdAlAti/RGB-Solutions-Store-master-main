import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../domain/entities/collection.dart';
import '../../../domain/entities/product.dart';
import '../horizontal_product_list.dart';
import '../product_view.dart';
import '../stacked_scroll.dart';
import 'cubit/collection_list_cubit.dart';

class CollectionListView extends StatefulWidget {
  final bool isMobile;
  final int showIndex;
  final EdgeInsetsGeometry padding;
  final Future<Collection>? collection;
  final Future<List<Collection>>? collections;
  const CollectionListView(
      {super.key,
      this.collection,
      this.collections,
      this.showIndex = 0,
      this.padding = const EdgeInsets.all(12),
      this.isMobile = false});

  @override
  State<CollectionListView> createState() => _CollectionListViewState();
}

class _CollectionListViewState extends State<CollectionListView> {
  late CollectionListCubit _cubit;

  @override
  void initState() {
    _cubit = CollectionListCubit(widget.collection, widget.collections)
      ..unwrapFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionListCubit, CollectionListState>(
      bloc: _cubit,
      builder: (context, state) {
        return state.when(
          loading: () => const CircularProgressIndicator(strokeWidth: 2),
          ready: (collections) {
            if (collections.isNotEmpty) {
              if (widget.showIndex == 0 && collections.isNotEmpty) {
                return _listView(context, collections[0]);
              } else if (widget.showIndex == 1 && collections.length >= 2) {
                return _listView(context, collections[1]);
              } else {
                if (collections.length >= 3) {
                  List<Collection> coll = collections.map((e) => e).toList();
                  coll.removeRange(0, 2);
                  return _body(context, coll);
                } else {
                  return const SizedBox.shrink();
                }
              }
            } else {
              return const SizedBox.shrink();
            }
          },
          error: (message) => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _body(BuildContext context, List<Collection> collections) {
    return Column(
      children: [
        for (Collection collection in collections)
          _listView(context, collection)
      ],
    );
  }

  Widget _listView(BuildContext context, Collection collection) {
    final scrollController = ScrollController();
    return StackedScroll(
      autoScroll: true,
      scrollController: scrollController,
      itemWidth: widget.isMobile ? 120 : 150,
      child: HorizontalProductList<Product>(
          paddingInsideList: true,
          padding: widget.padding,
          controller: scrollController,
          listHeight: widget.isMobile ? 200 : 230,
          itemBuilder: (context, item, index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ProductView(
                  product: item,
                  padding: const EdgeInsets.all(4.0),
                  specialBannerText: collection.name,
                  isMobile: widget.isMobile,
                ),
              ),
          fetch: Future.value(collection.products),
          onEmpty: const SizedBox.shrink(),
          onError: const SizedBox.shrink(),
          tileWidth: widget.isMobile ? 150 : 180,
          title: _topBody(context, collection)),
    );
  }

  Widget _topBody(BuildContext context, Collection collection) {
    return Row(
      children: [
        Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: StoreTheme.tentColor,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                collection.name,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Colors.white, fontSize: widget.isMobile ? 18 : null),
              ),
            )),
      ],
    );
  }
}
