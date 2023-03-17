import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/product.dart';

class ProductView extends StatefulWidget {
  final Product product;
  final EdgeInsetsGeometry padding;
  final bool isMobile;
  final String? specialBannerText;

  const ProductView(
      {super.key,
      required this.product,
      required this.isMobile,
      this.padding = const EdgeInsets.all(2.0),
      this.specialBannerText});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  BorderRadius borderRadius = BorderRadius.circular(4.0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Material(
          elevation: 6,
          borderRadius: borderRadius,
          child: InkWell(
            onTap: () {
              Beamer.of(context)
                  .beamToNamed('/p/${widget.product.id}', data: widget.product);
            },
            child: Container(
              decoration: BoxDecoration(borderRadius: borderRadius),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: borderRadius.topLeft,
                                topRight: borderRadius.topRight),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: widget.product.thumbnail.isNotEmpty
                                  ? CachedNetworkImageProvider(
                                      widget.product.thumbnail)
                                  : const AssetImage('assets/image/logo.png')
                                      as ImageProvider,
                            ))),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                        padding: widget.padding,
                        child: widget.product.defaultVariant.onSale
                            ? _specialBottomData()
                            : _normalBottom()),
                  ),
                ],
              ),
            ),
          ),
        ),
        _createBanner(),
      ],
    );
  }

  Widget _specialBottomData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            flex: 2,
            child: Center(
                child: Container(
              margin: const EdgeInsets.only(left: 2.0),
              padding: EdgeInsets.all(widget.isMobile ? 4 : 6),
              decoration: BoxDecoration(
                  color: StoreTheme.breakerColor,
                  borderRadius: BorderRadius.circular(2)),
              child: Text(
                "وفر  ${widget.product.discountPercentage}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: widget.isMobile ? 10 : null),
              ),
            ))),
        Expanded(
            flex: 3,
            child: Column(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Text(
                    widget.product.name,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: widget.isMobile ? 12 : 14),
                  ),
                ),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${widget.product.defaultVariant.currency} ${widget.product.defaultVariant.priceUndiscounted}",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w500,
                                    fontSize: widget.isMobile ? 8 : 12),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "${widget.product.defaultVariant.weight}${widget.product.defaultVariant.unit}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: widget.isMobile ? 8 : 12),
                            ),
                            Text(
                              "/",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: widget.isMobile ? 8 : 12),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "${widget.product.defaultVariant.currency} ${widget.product.defaultVariant.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: widget.isMobile ? 12 : 15,
                                      fontWeight: FontWeight.w500,
                                      color: StoreTheme.breakerColor),
                            ),
                          ],
                        ),
                      ],
                    ))
              ],
            )),
      ],
    );
  }

  Widget _createBanner() {
    String? bannerText = _bannerTextString();
    return bannerText != null
        ? Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 75,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: borderRadius.topLeft,
                      bottomRight: borderRadius.bottomRight),
                  color: StoreTheme.tentColor),
              child: Text(
                bannerText,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  String? _bannerTextString() {
    if (widget.specialBannerText != null) {
      return widget.specialBannerText;
    } else {
      if (widget.product.isDiscounted) {
        return widget.product.discountPercentage;
      } else {
        return null;
      }
    }
  }

  Widget _normalBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.product.name,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: widget.isMobile ? 12 : 14,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 15.0,),
            Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 5),
                    Text(
                      "${widget.product.defaultVariant.weight}${widget.product.defaultVariant.unit}",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: widget.isMobile ? 8 : 12),
                    ),
                    Text(
                      "/",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: widget.isMobile ? 8 : 12),
                    ),
                    Text(
                      "${widget.product.defaultVariant.price} ${widget.product.defaultVariant.currency}",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: widget.isMobile ? 12 : 15,
                          fontWeight: FontWeight.w600,
                          color: StoreTheme.breakerColor),
                      textDirection: TextDirection.ltr,
                    ),
                  ],
                ),
              ],
            )
          ],
        ))
      ],
    );
  }

  Widget _undiscountPrice(BuildContext context) => Text(
        " ${widget.product.currency} ${widget.product.amount}",
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.bold, fontSize: widget.isMobile ? 11 : null),
      );
}
