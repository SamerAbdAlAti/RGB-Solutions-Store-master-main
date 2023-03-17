import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';

import '../../../../../../core/theme/app_theme.dart';

typedef GetAvgRating = void Function(double avgRating);

class RatingBarForProduct extends StatefulWidget {
  final Product product;
  final double realRating;
  const RatingBarForProduct(
      {Key? key, required this.product, required this.realRating})
      : super(key: key);

  @override
  _RatingBarForProductState createState() => _RatingBarForProductState();
}

class _RatingBarForProductState extends State<RatingBarForProduct> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          itemSize: 18,
          rating: widget.realRating != 0
              ? widget.realRating
              : widget.product.rating ?? 0,
          unratedColor: StoreTheme.commonColor,
          textDirection: TextDirection.rtl,
          itemBuilder: (context, index) => Icon(
            Ionicons.star,
            color: StoreTheme.tentColor,
          ),
        ),
        SizedBox(
          height: 12,
          child: Text(
            "${widget.realRating != 0 ? widget.realRating : widget.product.rating ?? 0} / 5",
            style: Theme.of(context).textTheme.titleMedium,
            textDirection: TextDirection.ltr,
          ),
        )
      ],
    );
  }
}
