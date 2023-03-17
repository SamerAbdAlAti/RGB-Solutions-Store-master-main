import 'package:flutter/material.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product_variant.dart';

import '../../../../../../core/theme/app_theme.dart';
import '../../../../domain/entities/product.dart';

class VariantArea extends StatefulWidget {
  const VariantArea({
    Key? key,
    required this.onPressed,
    required this.product,
  }) : super(key: key);
  final void Function(String selectedId) onPressed;
  final Product product;

  @override
  _VariantAreaState createState() => _VariantAreaState();
}

class _VariantAreaState extends State<VariantArea> {
  late String _selectedVariantId;
  @override
  void initState() {
    super.initState();
    _selectedVariantId = widget.product.defaultVariant.id;
  }

  @override
  Widget build(BuildContext context) {
    final selectedStyle = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(fontSize: 20, color: Colors.white);
    final notSelectedStyle =
        Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 18);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (ProductVariant variant in widget.product.variants)
          Column(
            children: [
              InkWell(
                onTap: () => setState(() {
                  _selectedVariantId = variant.id;
                  widget.onPressed(_selectedVariantId);
                }),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  transformAlignment: Alignment.topRight,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _selectedVariantId == variant.id
                        ? StoreTheme.breakerColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(5),
                    border:
                        Border.all(color: StoreTheme.breakerColor, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        variant.name,
                        style: TextStyle(color: Colors.white)
                      ),
                      Text(
                        "${variant.price} ${variant.currency}",
                        style: TextStyle(color: Colors.white),
                        textDirection: TextDirection.ltr,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
      ],
    );
  }
}
