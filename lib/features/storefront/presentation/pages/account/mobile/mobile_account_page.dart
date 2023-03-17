import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart' hide Order;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';
import 'package:saleor_app_flutter/core/utl/phone_converter.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order_line.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/account/widgets/empty_orders.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/account/widgets/order_tiles.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/widgets/custom_input_decorations.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/order_details/widgets/order_details_util.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/appbar/storefront_app_bar.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/appbar/storefront_mobile_app_bar.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/bordered_button.dart';

class MobileAccountPage extends StatelessWidget {
  MobileAccountPage({super.key});

  final util = OrderDetailsUtil();

  @override
  Widget build(BuildContext context) {
    User? user = Beamer.of(context).currentBeamLocation.data as User?;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // appBar: const StorefrontAppBar(isMobile: true),
        drawer: const MobileDrawer(),
        body: user != null
            ? _fullWidget(context, user)
            : FutureBuilder(
                future: context.read<AuthBloc>().onlineAccount(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return _fullWidget(context, snapshot.data!);
                  }
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData == false) {
                    return _premoteAccountRegister(context);
                  }
                  return const Center(
                      child: CircularProgressIndicator(strokeWidth: 2));
                }),
      ),
    );
  }

  Widget _fullWidget(BuildContext context, User user) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(6.0),
            child: Column(children: [
              Text(
                "بيانات حسابي",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Divider(
                height: 30,
                color: StoreTheme.commonColor,
              ),
              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration:
                                CustomInputDecorations.desktopInputDecoration(
                                    "الاسم الأول", Ionicons.person_outline),
                            initialValue: user.firstName, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800),
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: TextFormField(
                            initialValue: user.lastName, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800),
                            readOnly: true,
                            decoration:
                                CustomInputDecorations.desktopInputDecoration(
                                    "الاسم الأخير", Ionicons.person_outline),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      readOnly: true, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800),
                      initialValue: PhoneConverter().toPhone(user.email),
                      decoration: CustomInputDecorations.desktopInputDecoration(
                          "رقم الهاتف", Ionicons.call_outline),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          const SizedBox(height: 20),
          Text(
            "طلباتي",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: 30),
          ),
          const SizedBox(width: 5),
          const SizedBox(height: 30),
          for (Order order in user.orders)
            OrderTiles(order: order, isMobile: true),
          user.orders.isEmpty ? const EmptyOrders() : const SizedBox.shrink()
        ],
      ),
    );
  }

  Widget _orderTile(BuildContext context, Order order) {
    Tuple3<String, Color, Color?> textColors =
        util.getStatus(context, order.status, order.paymentStatus);
    int quantity = 0;
    for (OrderLine line in order.lines) {
      quantity += line.quantity;
    }
    return Container(
      padding: const EdgeInsets.all(6.0),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 25),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).cardTheme.color),
      child: Flexible(
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: CachedNetworkImage(
                imageUrl: order.lines.first.thumbnail,
                fit: BoxFit.contain,
              ),
            ),
            const VerticalDivider(
              thickness: 1,
              width: 10,
            ),
            Flexible(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "رقم الطلب: #${order.number}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 14),
                        ),
                        Text(
                          util.getDate(order.created),
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    Wrap(
                      spacing: 10,
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
                                    fontSize: 10,
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
      ),
    );
  }

  Widget _premoteAccountRegister(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Beamer.of(context).beamToReplacementNamed('/register');
    });

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: SizedBox(
          width: screenSize.width * 0.75,
          child: Column(children: const [
            Text("يبدو انك لا تمتلك حساب يرجى إنشاء حساب او تسجيل الدخول"),
          ]),
        ),
      ),
    );
  }
}
