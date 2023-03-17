import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:ionicons/ionicons.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product_variant.dart';

import '../../../../../../core/theme/app_theme.dart';
import '../../../../domain/entities/checkout_line.dart';
import '../../login/bloc/auth_bloc.dart';
import '../bloc/cart_bloc.dart';

class DesktopCartProductTile extends StatelessWidget {
  final CheckoutLine line;
  final String checkoutId;
  // final ProductVariant variant;
  const DesktopCartProductTile(
      {super.key, required this.line, required this.checkoutId});

  @override
  Widget build(BuildContext context) {
    bool allowCalls = false;
    double total = line.totalPrice ;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
              color: StoreTheme.dimColor,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: CachedNetworkImage(
                  imageUrl: line.product.thumbnail,
                  fit: BoxFit.contain,
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
                                  fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          " /${line.variantName}", // line.product.weight
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                    Wrap(
                      spacing: 50,
                      children: [
                        Text(
                          "الحبة  ${line.currency} ${line.unitPrice}",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color: StoreTheme.commonColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200),
                        ),
                        InputQty(
                          showMessageLimit: false,
                          initVal: line.quantity,
                          minVal: 1,
                          // textFieldDecoration: InputDecoration(hintStyle: TextStyle(color: Colors.black54)),
                          borderShape: BorderShapeBtn.square,
                          boxDecoration: BoxDecoration(color: Colors.black54),
                          btnColor1: Colors.white, btnColor2: Colors.white,
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
                          "إجمالي: ${line.currency}${total}", //line.totalPrice
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color: StoreTheme.breakerColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
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
                              size: 22,
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
          color: StoreTheme.unselectedColor,
          height: 35,
        )
      ],
    );
  }
}
