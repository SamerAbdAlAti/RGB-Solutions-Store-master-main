import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart' hide Order;
import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_theme.dart';
import '../../../../domain/entities/order.dart';
import '../../../../domain/entities/order_line.dart';
import '../../../widgets/bordered_button.dart';
import '../../order_details/widgets/order_details_util.dart';

class OrderTiles extends StatelessWidget {
  final Order order;
  final bool isMobile;
  OrderTiles({Key? key, required this.order, this.isMobile = false})
      : super(key: key);

  final util = OrderDetailsUtil();

  @override
  Widget build(BuildContext context) {
    Tuple3<String, Color, Color?> textColors =
        util.getStatus(context, order.status, order.paymentStatus);
    int quantity = 0;
    for (OrderLine line in order.lines) {
      quantity += line.quantity;
    }
    return Container(
      padding: EdgeInsets.all(isMobile ? 4 : 12.0),
      margin: isMobile
          ? const EdgeInsets.fromLTRB(8, 0, 8, 10)
          : const EdgeInsets.only(bottom: 25),
      height: isMobile ? 150 : 200,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).cardTheme.color),
      child: Row(
        children: [
          isMobile
              ? SizedBox(
                  width: 80,
                  height: 80,
                  child: CachedNetworkImage(
                    imageUrl: order.lines.first.thumbnail,
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/image/logo.png',
                      fit: BoxFit.contain,
                    ),
                    fit: BoxFit.contain,
                  ),
                )
              : AspectRatio(
                  aspectRatio: 1,
                  child: CachedNetworkImage(
                    imageUrl: order.lines.first.thumbnail,
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/image/logo.png',
                      fit: BoxFit.contain,
                    ),
                    fit: BoxFit.contain,
                  )),
          VerticalDivider(
            thickness: 2,
            width: isMobile ? 10 : 30,
          ),
          Flexible(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("رقم الطلب: #${order.number}"),
                      Text(
                        util.getDate(order.created),
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                  OverflowBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    overflowSpacing: 1,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "قيمة الطلب: ",
                            style: Theme.of(context).textTheme.labelLarge),
                        TextSpan(
                            text: "${order.total} ${order.currency}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: StoreTheme.breakerColor),
                        )
                      ])),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "العدد: ",
                            style: Theme.of(context).textTheme.labelLarge),
                        TextSpan(
                            text: quantity.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontWeight: FontWeight.bold))
                      ])),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "وزن الطلب: ",
                            style: Theme.of(context).textTheme.labelLarge),
                        TextSpan(
                            text: "${order.unit} ${order.weight}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontWeight: FontWeight.bold))
                      ])),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: textColors.value2,
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          textColors.head,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  fontFamily: 'Hacen',
                                  fontSize: isMobile ? 12 : 15,
                                  fontWeight: FontWeight.normal,
                                  color: textColors.value3),
                        ),
                      ),
                      BorderedButton(
                          text: "تفاصيل الطلب",
                          onPressed: () {
                            Beamer.of(context)
                                .beamToNamed('/order', data: order);
                          }),
                    ],
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
