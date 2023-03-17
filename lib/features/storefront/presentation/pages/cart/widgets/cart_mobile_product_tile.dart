import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../../core/theme/app_theme.dart';
import '../../../../domain/entities/checkout_line.dart';
import '../../login/bloc/auth_bloc.dart';
import '../bloc/cart_bloc.dart';

class MobileCartProductTile extends StatelessWidget {
  final CheckoutLine line;
  final String checkoutId;
  const MobileCartProductTile(
      {super.key, required this.line, required this.checkoutId});

  @override
  Widget build(BuildContext context) {
    bool allowCalls = false;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          width: double.infinity,
          decoration: BoxDecoration(
              color: StoreTheme.dimColor,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: InkWell(
                  onTap: () =>
                      Beamer.of(context).beamToNamed('/p/${line.product.id}'),
                  child: CachedNetworkImage(
                    imageUrl: line.product.thumbnail,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              VerticalDivider(
                color: StoreTheme.unselectedColor,
                width: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          line.product.name,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          " / ${line.product.unit} ${line.product.weight}",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                    OverflowBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      overflowSpacing: 5,
                      children: [
                        Text(
                          "الحبة  ${line.currency} ${line.unitPrice}",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color: StoreTheme.commonColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w200),
                        ),
                        InputQty(
                          showMessageLimit: false,
                          initVal: line.quantity,
                          minVal: 1,
                          borderShape: BorderShapeBtn.square,
                          onQtyChanged: (value) {
                            if (allowCalls) {
                              context.read<CartBloc>().add(
                                  CartEvent.updateQuantity(
                                      context.read<AuthBloc>().onlineAccount(),
                                      line.id,
                                      checkoutId,
                                      value!.toInt()));
                            }
                            allowCalls = true;
                          },
                        ),
                        Text(
                          "إجمالي ${line.currency}${line.totalPrice}",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color: StoreTheme.breakerColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                        ),
                        IconButton(
                            onPressed: () {
                              context.read<CartBloc>().add(CartEvent.deleteItem(
                                  context.read<AuthBloc>().onlineAccount(),
                                  [line.id],
                                  checkoutId));
                            },
                            icon: Icon(
                              Ionicons.trash_bin_outline,
                              color: Theme.of(context).colorScheme.error,
                              size: 18,
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(
          thickness: 2,
          indent: 100,
          endIndent: 100,
          color: StoreTheme.unselectedColor,
          height: 35,
        )
      ],
    );
  }
}
