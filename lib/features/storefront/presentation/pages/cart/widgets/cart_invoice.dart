import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/cart/widgets/text_row.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/widgets/custom_input_decorations.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/bordered_button.dart';

import '../../../../../../core/theme/app_theme.dart';
import '../../../../domain/entities/checkout.dart';
import '../../../../domain/entities/checkout_line.dart';
import '../../../../domain/entities/user.dart';
import '../../login/bloc/auth_bloc.dart';
import '../bloc/cart_bloc.dart';

class CartInvoice extends StatefulWidget {
  final Checkout checkout;
  final User user;
  final bool isMobile;
  const CartInvoice(
      {super.key,
      required this.checkout,
      required this.user,
      this.isMobile = false});

  @override
  State<CartInvoice> createState() => _CartInvoiceState();
}

class _CartInvoiceState extends State<CartInvoice> {
  final TextEditingController _cobonController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  void initState() {
    _cobonController.text = widget.checkout.voucherCode ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0.00;
    double totalQuantity = 0.00;
    for (CheckoutLine line in widget.checkout.lines) {
      totalPrice += line.totalPrice;
      totalQuantity+=line.quantity;

      // print(totalPrice);
    }
    return Container(
      color: Theme.of(context).cardTheme.color,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  "اسم المنتج",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Divider(
                    height: widget.isMobile ? 5 : 25,
                    color: Colors.black87),
                for (CheckoutLine line in widget.checkout.lines)
                  TextRow(
                      title: line.product.name,
                      value: "${line.currency}${line.totalPrice }"), //line.totalPrice
              ],
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                Divider(
                  color: Colors.transparent,
                  height: widget.isMobile ? 15 : 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "الدفع عند الاستلام",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 16),
                    ),
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Divider(
                  color: Colors.black87,
                  height: widget.isMobile ? 15 : 40,
                ),
                widget.checkout.discountAmount == 0
                    ? const SizedBox.shrink()
                    : TextRow(
                        title: "قيمة الخصم",
                        value:
                            "${widget.checkout.currency} ${widget.checkout.discountAmount.toStringAsFixed(3)}",
                        valueStyle: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontSize: 16, color: StoreTheme.tentColor)),
                TextRow(
                    title: "مجموع الطلبات",
                    value:
                        "${widget.checkout.currency} ${totalPrice.toStringAsFixed(3)}",
                    titleStyle: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 18),
                    valueStyle: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                            fontSize: 18, color: StoreTheme.breakerColor)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Divider(color: Colors.black87, height: widget.isMobile ? 15 : 40),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Form(
                          key: _form,
                          child: TextFormField(
                            controller: _cobonController,
                            readOnly: widget.checkout.voucherCode != null
                                ? true
                                : false,
                            decoration:
                                CustomInputDecorations.desktopInputDecoration(
                                    "ادخل كوبون", Ionicons.pricetag_outline),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "ادخل كوبون للتطبيق";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    BorderedButton(
                      text: widget.checkout.voucherCode == null
                          ? "تطبيق"
                          : "إزالة",
                      onPressed: () {
                        if (_form.currentState!.validate()) {
                          widget.checkout.voucherCode == null
                              ? context.read<CartBloc>().add(CartEvent.addCobon(
                                  context.read<AuthBloc>().onlineAccount(),
                                  widget.checkout.id,
                                  _cobonController.text.trim()))
                              : context.read<CartBloc>().add(
                                  CartEvent.removeCobon(
                                      context.read<AuthBloc>().onlineAccount(),
                                      widget.checkout.id,
                                      _cobonController.text.trim()));
                        }
                      },
                      positive:
                          widget.checkout.voucherCode == null ? true : false,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                    onPressed: widget.checkout.lines.isNotEmpty
                        ? () {
                            Beamer.of(context).beamToReplacementNamed(
                                '/checkout',
                                data: widget.user);
                          }
                        : null,
                    child: Text(widget.checkout.lines.isNotEmpty
                        ? "أكمل خطوات الطلب"
                        : "اضف منتجات"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
