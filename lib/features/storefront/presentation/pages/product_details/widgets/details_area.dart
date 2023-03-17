import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/widgets/custom_input_decorations.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/product_details/widgets/variant_area.dart';

import '../../../../../../core/theme/app_theme.dart';
import '../../../../domain/entities/product.dart';
import 'attributes_columns.dart';

class DetailsAreaProduct extends StatefulWidget {
  final Product product;
  final void Function(String selectedId) onSelected;

  const DetailsAreaProduct(
      {Key? key, required this.product, required this.onSelected})
      : super(key: key);

  @override
  _DetailsAreaProductState createState() => _DetailsAreaProductState();
}

class _DetailsAreaProductState extends State<DetailsAreaProduct> {
  late String _selectedVariantId;

  @override
  void initState() {
    _selectedVariantId = widget.product.defaultVariant.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String availabilityText =
        widget.product.isAvailable ? "*متوفر*" : "نفدت الكمية";
    final notesController = TextEditingController();
    return Column(
      children: [
        widget.product.variants.length == 1
            ? widget.product.isDiscounted
                ? _discountedPrice(context, widget.product)
                : _undicountedPrice(context, widget.product)
            : VariantArea(
                product: widget.product,
                onPressed: (selectedId) {
                  setState(() {
                    _selectedVariantId = selectedId;
                    widget.onSelected(_selectedVariantId);
                  });
                },
              ),
        Row(
          children: [
            Text(
              "التوفر: ",
              style: TextStyle(color: Colors.white),
            ),
            _availabilityText(context, availabilityText)
          ],
        ),
        // const Divider(
        //   thickness: 1,
        //   height: 30,
        // ),
        // الملاحظات على المنتج
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text("الملاحظات", style: TextStyle(color: Colors.white)),
        //     TextFormField(
        //       cursorHeight: 30.0,
        //       style: TextStyle(color: Colors.white, fontSize: 20.0),
        //       cursorColor: Colors.white,
        //       maxLines: 4,
        //       controller: notesController,
        //       decoration: InputDecoration(
        //           hintText: "اكتب ملاحظتك هنا بشأن المنتج",
        //           hintStyle: TextStyle(
        //               color: Colors.white,
        //               fontSize: 13.0,
        //               fontWeight: FontWeight.w400),
        //           border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(30.0))),
        //     ),
        //   ],
        // ),
        AttributesColumn(
            attributes: widget.product.attributes,
            values: widget.product.values),
        widget.product.variants
                .firstWhere((element) => element.id == _selectedVariantId)
                .values
                .isNotEmpty
            ? AttributesColumn(
                attributes: widget.product.variants
                    .firstWhere((element) => element.id == _selectedVariantId)
                    .attributes,
                values: widget.product.variants
                    .firstWhere((element) => element.id == _selectedVariantId)
                    .values)
            : const SizedBox.shrink(),
        const Divider(
          thickness: 1,
          height: 30,
        ),
      ],
    );
  }

  Widget _availabilityText(BuildContext context, String text) {
    return EasyRichText(
      text,
      defaultStyle:
          Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 20),
      textAlign: TextAlign.center,
      patternList: [
        EasyRichTextPattern(
          targetString: '(\\*)(.*?)(\\*)',
          matchBuilder: (context, match) {
            return TextSpan(
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: StoreTheme.breakerColor),
              text: match?[0]?.replaceAll(
                '*',
                ''..replaceAll('*', ''),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _undicountedPrice(BuildContext context, Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
              text: "${product.currency} ${product.amount}",
              style: Theme.of(context).textTheme.titleLarge),
        ),
      ],
    );
  }

  Widget _discountedPrice(BuildContext context, Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: "${product.currency} ${product.amount}",
                  style: Theme.of(context).textTheme.titleLarge),
              TextSpan(
                  text: "${product.currency} ${product.undiscountedAmount}",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(decoration: TextDecoration.lineThrough)),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: StoreTheme.breakerColor),
          child: Text(
            "خصم ${product.discountPercentage}",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white),
          ),
        )
      ],
    );
  }
}
