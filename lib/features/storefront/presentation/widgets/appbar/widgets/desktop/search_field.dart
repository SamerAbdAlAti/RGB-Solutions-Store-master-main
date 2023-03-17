// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:ionicons/ionicons.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/widgets/custom_input_decorations.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.fetch,
    this.isMobile = false,
  }) : super(key: key);

  final bool isMobile;
  final Future<List<Product>> Function(String searchQuery) fetch;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TypeAheadField<Product>(
          minCharsForSuggestions: 1,
          suggestionsBoxDecoration: SuggestionsBoxDecoration(
              offsetX: 0,
              constraints: BoxConstraints(
                  minWidth: screenSize.width / 2.5,
                  maxHeight: screenSize.height / 2.5,
                  minHeight: screenSize.height / 2.5)),
          textFieldConfiguration: TextFieldConfiguration(
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 10, height: 2),
              cursorColor: StoreTheme.commonColor,
              decoration: CustomInputDecorations.desktopInputDecoration(
                  "ابحث عن منتج...", Ionicons.search_outline)),
          noItemsFoundBuilder: (context) => ListTile(
            title: Text(
              "لا توجد نتائج",
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          suggestionsCallback: (pattern) => fetch(pattern),
          itemBuilder: (context, itemData) {
            return Column(
              children: [
                isMobile
                    ? _buildItemMobile(context, itemData)
                    : _buildItem(context, itemData),
                Divider(
                  thickness: 1,
                  color: Theme.of(context).appBarTheme.backgroundColor,
                )
              ],
            );
          },
          onSuggestionSelected: (suggestion) {
            Beamer.of(context).beamToNamed('/p/${suggestion.id}');
          },
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, Product itemData) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        horizontalTitleGap: 20,
        contentPadding: const EdgeInsets.all(8.0),
        title: Text(
          itemData.name,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontSize: 15),
        ),
        subtitle: itemData.isDiscounted
            ? _discountedPrice(context: context, product: itemData)
            : _undicountedPrice(context, itemData, null),
        leading: AspectRatio(
          aspectRatio: 2 / 1,
          child: itemData.thumbnail.isEmpty
              ? Image.asset('assets/image/logo.png', fit: BoxFit.contain)
              : CachedNetworkImage(
                  imageUrl: itemData.thumbnail, fit: BoxFit.contain),
        ),
      ),
    );
  }

  Widget _buildItemMobile(BuildContext context, Product itemData) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        horizontalTitleGap: 10,
        contentPadding: const EdgeInsets.all(4.0),
        title: Text(
          itemData.name,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontSize: 12),
        ),
        subtitle: itemData.isDiscounted
            ? _discountedPrice(
                context: context,
                product: itemData,
                mainFontSize: 12,
                subFontSize: 10)
            : _undicountedPrice(context, itemData, null),
        leading: AspectRatio(
          aspectRatio: 1 / 1,
          child: CachedNetworkImage(
            imageUrl: itemData.thumbnail,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _undicountedPrice(
    BuildContext context,
    Product product,
    double? mainFontSize,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
              text: "${product.currency}${product.amount}",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold, fontSize: mainFontSize)),
        ),
      ],
    );
  }

  Widget _discountedPrice(
      {required BuildContext context,
      required Product product,
      double? mainFontSize,
      double subFontSize = 14}) {
    return Row(
      children: [
        Text("${product.currency}${product.undiscountedAmount}",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                decoration: TextDecoration.lineThrough, fontSize: subFontSize)),
        const SizedBox(width: 10),
        Text("${product.currency}${product.amount}",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: StoreTheme.tentColor,
                fontWeight: FontWeight.bold,
                fontSize: mainFontSize)),
      ],
    );
  }
}
