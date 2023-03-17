import 'dart:async';

import 'package:beamer/beamer.dart';
import 'package:dartz/dartz.dart' hide Order;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';
import 'package:saleor_app_flutter/core/types/order_events.dart';
import 'package:saleor_app_flutter/core/utl/map_util.dart';
import 'package:saleor_app_flutter/core/utl/phone_converter.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout_line.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order_event.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order_line.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/order_details/mobile/cubit/app_cubit.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/order_details/widgets/order_details_util.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/appbar/storefront_app_bar.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/bordered_button.dart';
import 'package:timelines/timelines.dart';

import '../../../widgets/footer_wrapper.dart';

class DekstopOrderDetails extends StatelessWidget {
  DekstopOrderDetails({super.key});

  final util = OrderDetailsUtil();

  @override
  Widget build(BuildContext context) {
    Order? order = Beamer.of(context).currentBeamLocation.data as Order?;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: const StorefrontAppBar(),
          // body: _fullWidget(context, order),
          body: FooterWrapper(
            child: order != null
                ? _fullWidget(context, order)
                : util.directToAccount(context),
          )),
    );
  }

  Widget _fullWidget(BuildContext context, Order order) {
    Size screenSize = MediaQuery.of(context).size;
    double lat = 0;
    double long = 0;
    Tuple3<String, Color, Color?> statusDecoration =
        util.getStatus(context, order.status, order.paymentStatus);
    if (order.metafields.containsKey('lat')) {
      lat = double.parse(order.metafields['lat']);
      long = double.parse(order.metafields['long']);
    }
    // double totalPrice = 0.00;
    // Checkout? checkout;
    // for (CheckoutLine line in checkout!.lines) {
    //   totalPrice += line.totalPrice * line.quantity;
    //   // print(totalPrice);
    // }
    return BlocBuilder<AppLocationCubit, AppLocationState>(
      builder: (context, state) {
        AppLocationCubit cubit = AppLocationCubit.get(context);
        return SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20, bottom: 50),
          child: Center(
            child: SizedBox(
                width: screenSize.width * 0.75,
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).cardTheme.color,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 250,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("رقم الطلب: #${order.number}"),
                                        Text(
                                          util.getDate(order.created),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "حالة الطلب:",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(fontSize: 16),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(12.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: statusDecoration.value2,
                                          ),
                                          child: Text(
                                            statusDecoration.value1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color:
                                                        statusDecoration.value3,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "وزن الطلب:",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(fontSize: 16),
                                        ),
                                        Text(
                                          "${order.unit} ${order.weight}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "المبلغ الكلي:",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(fontSize: 16),
                                        ),
                                        Text(
                                          "${order.currency} ${order.total}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                  color:
                                                      StoreTheme.breakerColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    // order.status == OrderStatus.CANCELED
                                    //     ? const SizedBox.shrink()
                                    //     : BorderedButton(
                                    //         text: "إلغاء الطلب",
                                    //         onPressed:
                                    //             order.status == OrderStatus.FULFILLED
                                    //                 ? null
                                    //                 : () {})
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                padding: const EdgeInsets.all(12.0),
                                margin: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Theme.of(context).cardTheme.color),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "الإسم: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                        ),
                                        Text(
                                          "${order.firstName} ${order.lastName}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "رقم الهاتف: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                        ),
                                        Text(
                                          PhoneConverter()
                                              .toPhone(order.userPhone),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 3,
                                      color: Colors.white,
                                      height: 10,
                                    ),
                                    Text("العنوان",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            )),
                                    const Divider(
                                      thickness: 3,
                                      color: Colors.transparent,
                                      height: 5,
                                    ),
                                    Text(
                                      "${order.shippingAddress.city}, ${order.shippingAddress.streetAddress1}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                    ),
                                    const Divider(
                                      thickness: 3,
                                      color: Colors.white,
                                      height: 10,
                                    ),
                                    Text("ملاحظات",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            )),
                                    const Divider(
                                      thickness: 3,
                                      color: Colors.transparent,
                                      height: 5,
                                    ),
                                    Text(order.shippingAddress.streetAddress2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            )),
                                    const Divider(
                                      thickness: 3,
                                      color: Colors.white,
                                      height: 7,
                                    ),
                                    lat != 0
                                        ? BorderedButton(
                                            text: "الموقع على الخريطة",
                                            onPressed: () {
                                              cubit
                                                  .getLocationMethod()
                                                  .then((value) {
                                                Timer(
                                                    const Duration(
                                                        milliseconds: 500),
                                                    () async {
                                                  WidgetsFlutterBinding
                                                      .ensureInitialized();
                                                  await MapUtils.openMap(
                                                    state.lat,
                                                    state.lon,
                                                  );
                                                });
                                              });
                                            })
                                        : BorderedButton(
                                            text: "لا يوجد موقع بهذا الطلب",
                                            onPressed: () {})
                                  ],
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(width: 20),
                      Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("اسم المنتج",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                      Text("الكمية",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium)
                                    ]),
                              ),
                              for (OrderLine line in order.lines)
                                _orderTile(context, line),
                            ],
                          )),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: SizedBox(
                                    height: 300,
                                    child: Timeline.tileBuilder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      theme: TimelineThemeData(
                                          color: StoreTheme.tentColor,
                                          indicatorPosition: 0),
                                      builder: TimelineTileBuilder.fromStyle(
                                        contentsAlign:
                                            ContentsAlign.alternating,
                                        indicatorStyle: IndicatorStyle.dot,
                                        connectorStyle:
                                            ConnectorStyle.solidLine,
                                        endConnectorStyle:
                                            ConnectorStyle.dashedLine,
                                        oppositeContentsBuilder:
                                            (context, index) {
                                          return _oppisTimeline(
                                              context, order.events[index]);
                                        },
                                        itemCount: order.events.length,
                                        contentsBuilder: (context, index) =>
                                            Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: _innerTimeline(
                                              context, order.events[index]),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // FutureBuilder(
                            //   future: context.read<AuthBloc>().localAccount(),
                            //   builder: (context, snapshot) {
                            //     if (snapshot.hasData &&
                            //         snapshot.connectionState ==
                            //             ConnectionState.done) {
                            //       return snapshot.data!.isStaff
                            //           ? Row(
                            //               children: [
                            //                 BorderedButton(
                            //                     text: "استلمت السلعة والمبلغ",
                            //                     positive: true,
                            //                     onPressed: () {}),
                            //                 BorderedButton(
                            //                     text: "في الطريق",
                            //                     positive: true,
                            //                     onPressed: () {})
                            //               ],
                            //             )
                            //           : const SizedBox.shrink();
                            //     }
                            //     return const SizedBox.shrink();
                            //   },
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }

  Widget? _innerTimeline(BuildContext context, OrderEvent orderEvent) {
    String title = '';
    switch (orderEvent.type) {
      case OrderEventEnum.PLACED:
        title = "تم وضع الطلب";
        break;

      case OrderEventEnum.FULFILLMENT_FULFILLED_ITEMS:
        title = "تم تجهيز الطلب";
        break;

      case OrderEventEnum.ORDER_MARKED_AS_PAID:
        title = "تم تسليم الطلب";
        break;

      case OrderEventEnum.NOTE_ADDED:
        title = orderEvent.message;
        break;

      default:
        null;
        break;
    }
    return title.isEmpty ? null : Text(title);
  }

  Widget? _oppisTimeline(BuildContext context, OrderEvent orderEvent) {
    String title = orderEvent.date;
    bool doSh = false;
    switch (orderEvent.type) {
      case OrderEventEnum.PLACED:
        doSh = true;
        break;

      case OrderEventEnum.FULFILLMENT_FULFILLED_ITEMS:
        doSh = true;
        break;

      case OrderEventEnum.ORDER_MARKED_AS_PAID:
        doSh = true;
        break;

      case OrderEventEnum.NOTE_ADDED:
        doSh = true;
        break;

      default:
        null;
        break;
    }
    return !doSh
        ? null
        : Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(OrderDetailsUtil().getDateAndTime(title),
                style: Theme.of(context).textTheme.labelSmall),
          );
  }

  Widget _orderTile(BuildContext context, OrderLine order) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).cardTheme.color),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          order.productName,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "العدد: ",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 12)),
          TextSpan(
              text: order.quantity.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 14))
        ])),
      ]),
    );
  }
}
