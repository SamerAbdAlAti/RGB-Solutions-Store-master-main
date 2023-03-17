import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paginated_search_bar/paginated_search_bar.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';

import '../../../../domain/entities/product.dart';
import '../../../bloc/storefront_bloc.dart';

class BottomProductPickDesktop extends StatelessWidget {
  const BottomProductPickDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        child: PaginatedSearchBar<Product>(
            padding: const EdgeInsets.all(12),
            maxHeight: MediaQuery.of(context).size.height / 3,
            autoFocus: true,
            spacerBuilder: (context) =>
                Divider(color: StoreTheme.unselectedColor),
            hintText: "ابحث عن منتج",
            emptyBuilder: (context) =>
                const Center(child: Text("لا يوجد نتائج")),
            itemBuilder: (context, {required index, required item}) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: ListTile(
                  horizontalTitleGap: 20,
                  onTap: () => Navigator.of(context).pop(),
                  contentPadding: const EdgeInsets.all(8.0),
                  title: Text(
                    item.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 15),
                  ),
                  leading: AspectRatio(
                    aspectRatio: 2 / 1,
                    child: item.thumbnail.isEmpty
                        ? Image.asset('assets/image/logo.png',
                            fit: BoxFit.contain)
                        : CachedNetworkImage(
                            imageUrl: item.thumbnail, fit: BoxFit.contain),
                  ),
                ),
              );
            },
            onSearch: (
                {required pageIndex, required pageSize, required searchQuery}) {
              return context
                  .read<StorefrontBloc>()
                  .searchProducts(term: searchQuery, amount: 50);
            }),
      ),
    );
  }
}
