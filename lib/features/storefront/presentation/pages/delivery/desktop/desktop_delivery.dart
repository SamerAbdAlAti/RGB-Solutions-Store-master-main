import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart' hide Order, State;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saleor_app_flutter/core/injectable/injection.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order_line.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/delivery/cubit/delivery_cubit.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/order_details/widgets/order_details_util.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/appbar/storefront_app_bar.dart';

import '../../../../domain/entities/order.dart';
import '../../../widgets/bordered_button.dart';
import '../../../widgets/footer_wrapper.dart';

class DesktopDelivery extends StatefulWidget {
  const DesktopDelivery({super.key});

  @override
  State<DesktopDelivery> createState() => _DesktopDeliveryState();
}

class _DesktopDeliveryState extends State<DesktopDelivery> {
  late DeliveryCubit _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = DeliveryCubit(getIt(), getIt())..getReadyOrders(50);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const StorefrontAppBar(),
        // body: _fullWidget(context, order),
        body: FooterWrapper(
          child: FutureBuilder(
              future: context.read<AuthBloc>().onlineAccount(),
              builder: (context, snapshot) {
                return BlocBuilder<DeliveryCubit, DeliveryState>(
                  bloc: _cubit,
                  builder: (context, state) {
                    return state.map(
                        initial: (value) => const Center(
                            child: CircularProgressIndicator(strokeWidth: 2)),
                        loading: (value) => const Center(
                            child: CircularProgressIndicator(strokeWidth: 2)),
                        ready: (value) => _fullWidget(context, value.orders),
                        error: (_) => const Text("error"));
                  },
                );
              }),
        ),
      ),
    );
  }

  Widget _fullWidget(BuildContext context, List<Order> orders) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 5),
      child: Center(
        child: SizedBox(
            width: screenSize.width * 0.75,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardTheme.color,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2,
                                blurRadius: 2)
                          ]),
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("الطلبات المراد توصيلها"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "عدد الطلبات: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 16),
                              ),
                              Text(orders.length.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontSize: 16))
                            ],
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.all(12),
                      height: 400,
                      child: ListView.builder(
                        itemCount: orders.length,
                        itemExtent: 150,
                        padding: const EdgeInsets.all(12),
                        itemBuilder: (context, index) {
                          return _orderTile(context, orders[index]);
                        },
                      ),
                    ))
              ],
            )),
      ),
    );
  }

  Widget _orderTile(BuildContext context, Order order) {
    OrderDetailsUtil util = OrderDetailsUtil();
    Tuple3<String, Color, Color?> textColors =
        util.getStatus(context, order.status, order.paymentStatus);
    int quantity = 0;
    for (OrderLine line in order.lines) {
      quantity += line.quantity;
    }
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).cardTheme.color),
      height: 150,
      width: 400,
      child: Row(
        children: [
          AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: order.lines.first.thumbnail,
                fit: BoxFit.contain,
              )),
          const VerticalDivider(
            thickness: 2,
            width: 30,
          ),
          Flexible(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "قيمة الطلب: ",
                            style: Theme.of(context).textTheme.labelLarge),
                        TextSpan(
                            text: "${order.currency} ${order.total}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: StoreTheme.breakerColor))
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
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          textColors.head,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
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
